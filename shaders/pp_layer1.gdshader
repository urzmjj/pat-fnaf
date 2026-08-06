shader_type canvas_item;

uniform int chrom_levels = 3;
uniform float chrom_spread = 0.01;

uniform float invert = 0;
uniform float brightness = 0;
uniform float thermal = 0;

uniform vec2 size = vec2(32.0, 28.0);
uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;


vec4 inv(vec4 color, float inv){
	vec3 inverted = vec3(1.0-color.x,1.0-color.y,1.0-color.z);
    return vec4(mix(color.x, inverted.x, inv),mix(color.y, inverted.y, inv), mix(color.z, inverted.z, inv), color.w);
}

vec4 therm(vec4 color, float inv){
	float t = dot(color, vec4(0.299, 0.587, 0.114, 0.0));
	vec3 m = vec3(clamp(4.0*t - 2.0,0.0,1.0), clamp(2.0 - abs(2.0*t - 1.0)*2.0,0.0,1.0), clamp(2.0 - 4.0*t,0.0,1.0));
    return vec4(mix(color.x, m.x, inv),mix(color.y, m.y, inv), mix(color.z, m.z, inv), color.w);
}

void fragment() {
	vec3 sum;
	vec3 ccolor = vec3(0);
	vec2 iResolution = vec2(textureSize(screen_texture, 0));
    vec2 uv = SCREEN_UV;
    uv.y = 1.0 - uv.y;
    float aspectRatio = iResolution.x / iResolution.y;
    
	
	for(int i = 0; i < chrom_levels; i++){
		float t = float(i)/float(chrom_levels-1); // range 0.0->2.0
		vec3 slice = vec3(clamp(2.0-4.0*t,0.0,1.0), clamp(2.0 - abs(2.0*t - 1.0)*2.0,0.0,1.0), clamp(4.0*t - 2.0,0.0,1.0));
		slice = max(slice, 0.0);
		sum += slice;
		vec2 intensity = vec2(
	        (t/16.0)*chrom_spread * aspectRatio,
	        (t/16.0)*chrom_spread * aspectRatio
	    );
	    vec2 coords = uv;
	    coords = (coords - 0.5) * 2.0;
	    vec2 realCoordOffs;
	    realCoordOffs.x = (1.0 - coords.y * coords.y) * intensity.y * coords.x * pow(2.0,t*chrom_spread);
	    realCoordOffs.y = (1.0 - coords.x * coords.x) * intensity.x * coords.y * pow(2.0,t*chrom_spread);
	    vec2 fuv = uv - realCoordOffs;
	    if(!(fuv.x < 0.0 || fuv.x > 1.0 || fuv.y < 0.0 || fuv.y > 1.0)) {
	        fuv.y = 1.0 - fuv.y;
	    }
		vec2 slice_offset = fuv;
		ccolor += slice * texture(screen_texture, fuv).rgb;
	}
	ccolor /= sum;
	vec4 color = vec4(ccolor,texture(screen_texture, SCREEN_UV).w);
	color = inv(color, invert);
	color = therm(color, thermal);
	color = color * vec4(brightness + 1.0,brightness + 1.0,brightness + 1.0,1);
    COLOR = color;
}