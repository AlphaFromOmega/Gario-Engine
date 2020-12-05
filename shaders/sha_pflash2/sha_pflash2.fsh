//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
	vec4 v_sColour = vec4(1.0, 1.0, 1.0, 0.2);
	vec4 v_Colour = v_sColour * v_vColour;
	gl_FragColor = v_Colour * texture2D( gm_BaseTexture, v_vTexcoord );
}
