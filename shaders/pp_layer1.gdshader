shader_type canvas_item;

uniform float invert = 0;
uniform float brightness = 0;
uniform vec2 size = vec2(32.0, 28.0);
// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

float lerp(float a, float b, float c){
	return b*c + a*(1.0-c);
}

vec4 inv(vec4 color, float inv){
	vec4 inverted = vec4(1.0-color.x,1.0-color.y,1.0-color.z,color.w);
    return vec4(lerp(color.x, inverted.x, inv),lerp(color.y, inverted.y, inv), lerp(color.z, inverted.z, inv), lerp(color.w, inverted.w, inv));
}



void fragment() {
	vec4 color = texture(screen_texture, SCREEN_UV);
	color = inv(color, invert);
	color = color * vec4(brightness + 1.0,brightness + 1.0,brightness + 1.0,1);
    COLOR = color;
}