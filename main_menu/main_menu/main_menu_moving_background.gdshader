shader_type canvas_item;

uniform float speed = 0.5;

void fragment() {
	COLOR = texture(TEXTURE, UV + vec2(TIME, TIME) * speed);
}