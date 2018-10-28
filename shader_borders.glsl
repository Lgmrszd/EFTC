#define PI 3.1415926535897932384626433832795

uniform float shift = 0;
uniform int thickness = 1;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
  vec4 current = texture2D(texture, texture_coords);

  // vec4 gray = vec4(0.7, 0.7, 0.7, 1);
  float average = (current.r + current.g + current.b)/3;
  vec4 gray = 0.5*vec4(average, average, average, 1) + 0.5*vec4(0.5,0.5,0.5,1);
  float r_x = texture_coords.x;
  float y = screen_coords.y;
  float factor = max(0, 2*(abs(r_x - 0.5)-0.1));

  float color_factor_y = (screen_coords.y / texture_coords.y)*0.01*factor;
  vec2 color_factor = vec2(0, 0.01*factor);
  float r_layer = texture2D(texture, texture_coords + color_factor).r;
  float g_layer = texture2D(texture, texture_coords).g;
  float b_layer = texture2D(texture, texture_coords - color_factor).b;
  float a_layer = texture2D(texture, texture_coords).a;
  vec4 my = vec4(r_layer, g_layer, b_layer, a_layer);

  if (mod(floor((y+shift+color_factor_y)/thickness), 2) == 0) {
    my.r = (my + (gray - my)*factor).r;
  }
  if (mod(floor((y+shift)/thickness), 2) == 0) {
    my.g = (my + (gray - my)*factor).g;
  }
  if (mod(floor((y+shift-color_factor_y)/thickness), 2) == 0) {
    my.b = (my + (gray - my)*factor).b;
  }
  return my * color;
}
