FlatBuffers.@with_kw mutable struct VariableWithValues
    variable::Variable = 0
    unit::Unit = 0
    value::Float32 = 0.0
    values::Vector{Float32} = []
    values_int64::Vector{Int64} = []
    altitude::Int16 = 0
    aggregation::Aggregation = 0
    pressure_level::Int16 = 0
    depth::Int16 = 0
    depth_to::Int16 = 0
    ensemble_member::Int16 = 0
    previous_day::Int16 = 0
end
FlatBuffers.@ALIGN(VariableWithValues, 1)
FlatBuffers.slot_offsets(::Type{T}) where {T<:VariableWithValues} = [
    0x00000004, 0x00000006, 0x00000008, 0x0000000A, 
    0x0000000C, 0x0000000E, 0x00000010, 0x00000012, 
    0x00000014, 0x00000016, 0x00000018, 0x0000001A
]

VariableWithValues(buf::AbstractVector{UInt8}) = FlatBuffers.read(VariableWithValues, buf)
VariableWithValues(io::IO) = FlatBuffers.deserialize(io, VariableWithValues)
