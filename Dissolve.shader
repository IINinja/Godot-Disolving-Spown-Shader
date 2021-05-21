shader_type canvas_item;

uniform float FlashState : hint_range(0, 1);
uniform sampler2D Noise;
uniform float  DissolveState : hint_range(0, 1);
uniform vec4 BorderColor : hint_color;
uniform float BorderTicknes : hint_range(0.01, 0.1);
void fragment(){
	vec4 color = texture(TEXTURE, UV);
	float brightness = (color.r + color.b + color.g) / 3.0;
	COLOR = vec4(mix(color.rgb, vec3(brightness), FlashState), color.a);
	float Noise_val =  texture(Noise, UV).r;
	//COLOR.rgb = vec3(Noise_val);
	if (Noise_val < DissolveState)
	COLOR.a = 0.0;
	else if (Noise_val - BorderTicknes < DissolveState)
	COLOR.rgb = BorderColor.rgb;
	
}