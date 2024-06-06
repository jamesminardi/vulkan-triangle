#version 450

layout(location = 0) out vec4 outColor;
layout(location = 0) in vec3 fragColor; // Name doesn't have to match vert, just location and in/out

void main() {
    outColor = vec4(fragColor, 1.0);
}