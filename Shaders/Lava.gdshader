shader_type spatial;

uniform vec3 albedo : source_color;
uniform vec3 albedo2 : source_color;

float fresnel(float amount, vec3 normal, vec3 view)
{
	return pow((1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0)), amount);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float fresnell = fresnel(5.0, NORMAL, VIEW);

	vec3 surface_color = mix(albedo, albedo2, fresnell);

	ALBEDO = surface_color;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
