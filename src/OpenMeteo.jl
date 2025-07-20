module OpenMeteo

    using FlatBuffers
    using HTTP
    using URIs

    include("Unit.jl")
    include("Model.jl")
    include("Variable.jl")
    include("Aggregation.jl")
    include("VariableWithValues.jl")
    include("VariablesWithTime.jl")
    include("WeatherApiResponse.jl")

    function request_weather_api(
        url;
        params,
        method,
        verify,
        kwargs...
    )

        # Add required flatbuffer format
        params["format"] = "flatbuffers"

        # Prepare request
        if method == "POST"
            response = HTTP.request("POST", url;
                body=URIs.escapeuri(params),
                require_ssl_verification=verify,
                kwargs...
            )
        else
            uri = URI(url)
            full_uri = merge(uri, query=params)
            response = HTTP.request("GET", string(full_uri);
                require_ssl_verification=verify,
            )
        end

        if response.status in (400, 429)
            msg = try
                String(response.body)
            catch
                "<unreadable error response>"
            end
            error("OpenMeteo API error: $msg")
        elseif response.status ≥ 300
            error("HTTP error: $(response.status)")
        end

        data = Vector{UInt8}(response.body)
        pos = 1
        messages = WeatherApiResponse[]

        while pos <= length(data) - 4
          # read the 4‑byte flatbuffers length prefix
          len = reinterpret(UInt32, data[pos:pos+3])[1]
          # slice *only* the actual flatbuffer bytes
          start = pos + 4
          fin   = start + Int(len) - 1
          msgbuf = data[start:fin]
          # this will invoke FlatBuffers.read under the hood
          resp = WeatherApiResponse(msgbuf)
          push!(messages, resp)
          pos = fin + 1
        end

        return messages
    end

end
