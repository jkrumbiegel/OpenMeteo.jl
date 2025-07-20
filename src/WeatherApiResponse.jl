FlatBuffers.@with_kw mutable struct WeatherApiResponse{A, B, C, D, E}
    latitude::Float32 = 0.0
    longitude::Float32 = 0.0
    elevation::Float32 = 0.0
    generation_time_milliseconds::Float32 = 0.0
    location_id::Int64 = 0
    model::Model = 0
    utc_offset_seconds::Int32 = 0
    timezone::String = ""
    timezone_abbreviation::String = ""
    current::Union{A, Nothing} = nothing
    daily::Union{B, Nothing} = nothing
    hourly::Union{C, Nothing} = nothing
    minutely_15::Union{D, Nothing} = nothing
    six_hourly::Union{E, Nothing} = nothing
end
FlatBuffers.@ALIGN(WeatherApiResponse, 1)
FlatBuffers.slot_offsets(::Type{T}) where {T<:WeatherApiResponse} = [
    0x00000004, 0x00000006, 0x00000008, 0x0000000A, 
    0x0000000C, 0x0000000E, 0x00000010, 0x00000012, 
    0x00000014, 0x00000016, 0x00000018, 0x0000001A, 
    0x0000001C, 0x0000001E
]
FlatBuffers.root_type(::Type{T}) where {T<:WeatherApiResponse} = true

WeatherApiResponse(buf::AbstractVector{UInt8}) = FlatBuffers.read(WeatherApiResponse{ConcreteVariablesWithTime, ConcreteVariablesWithTime, ConcreteVariablesWithTime, ConcreteVariablesWithTime, ConcreteVariablesWithTime}, buf)
WeatherApiResponse(io::IO) = FlatBuffers.deserialize(io, WeatherApiResponse{ConcreteVariablesWithTime, ConcreteVariablesWithTime, ConcreteVariablesWithTime, ConcreteVariablesWithTime, ConcreteVariablesWithTime})
