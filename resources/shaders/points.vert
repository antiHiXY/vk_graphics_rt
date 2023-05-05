#version 450
#extension GL_ARB_separate_shader_objects : enable
#extension GL_GOOGLE_include_directive : require


layout(push_constant) uniform params_t
{
    mat4 mProjView;
    mat4 mModel;
} params;

layout(binding = 1, set = 0) buffer data { float points[]; };

out gl_PerVertex { vec4 gl_Position; };
void main(void)
{
    uint indx = gl_VertexIndex % 2 == 0 ? 0 : (gl_VertexIndex / 2) + 1; 
    gl_Position = params.mProjView * vec4(points[indx * 3],points[indx * 3 + 1], points[indx * 3 + 2], 1.0);
    //gl_Position   = params.mProjView * vec4(0.f, 0.f, 0.f, 1.0);
}
