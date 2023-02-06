#version 450
#extension GL_EXT_mesh_shader : require
layout(row_major) uniform;
layout(row_major) buffer;
const vec3  colors_0[3] = { vec3(1.00000000000000000000, 1.00000000000000000000, 0.00000000000000000000), vec3(0.00000000000000000000, 1.00000000000000000000, 1.00000000000000000000), vec3(1.00000000000000000000, 0.00000000000000000000, 1.00000000000000000000) };
const vec2  positions_0[3] = { vec2(0.00000000000000000000, -0.50000000000000000000), vec2(0.50000000000000000000, 0.50000000000000000000), vec2(-0.50000000000000000000, 0.50000000000000000000) };
layout(location = 0)
out vec3  _S1[3];

out gl_MeshPerVertexEXT
{
    vec4 gl_Position;
} gl_MeshVerticesEXT[3];

perprimitiveEXT layout(location = 1)
out vec3  _S2[1];

perprimitiveEXT out gl_MeshPerPrimitiveEXT
{
    int gl_PrimitiveID;
    bool gl_CullPrimitiveEXT;
} gl_MeshPrimitivesEXT[1];

layout(local_size_x = 3, local_size_y = 1, local_size_z = 1) in;
layout(max_vertices = 3) out;
layout(max_primitives = 1) out;
layout(triangles) out;
void main()
{
    SetMeshOutputsEXT(3U, 1U);
    if(gl_LocalInvocationIndex < 3U)
    {
        vec3 _S3 = colors_0[gl_LocalInvocationIndex];
        gl_MeshVerticesEXT[gl_LocalInvocationIndex].gl_Position = vec4(positions_0[gl_LocalInvocationIndex], 0.00000000000000000000, 1.00000000000000000000);
        _S1[gl_LocalInvocationIndex] = _S3;
    }
    else
    {
    }
    if(gl_LocalInvocationIndex < 1U)
    {
        gl_PrimitiveTriangleIndicesEXT[gl_LocalInvocationIndex] = uvec3(0U, 1U, 2U);
        _S2[gl_LocalInvocationIndex] = vec3(0.00000000000000000000, 0.00000000000000000000, 1.00000000000000000000);
        gl_MeshPrimitivesEXT[gl_LocalInvocationIndex].gl_PrimitiveID = int(gl_LocalInvocationIndex);
        gl_MeshPrimitivesEXT[gl_LocalInvocationIndex].gl_CullPrimitiveEXT = false;
    }
    else
    {
    }
    return;
}
