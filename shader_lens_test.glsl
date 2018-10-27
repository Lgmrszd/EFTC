#define PI 3.1415926535897932384626433832795

uniform float angle = 0;
uniform float magnitude = 0.1;

vec4 effect(vec4 color, sampler2D tex, vec2 tx, vec2 sc) {
    float angle = angle;
    float dx = 0.001;


    vec2 offset = vec2(1, 1) * magnitude;
    vec4 off = texture2D(tex, tx + offset).rgba;
    if (0.5 - dx < tx.x && 0.5 + dx > tx.x) {
      return vec4(1,0,1,1) * color;
    } else if (0.5 - dx < (tx + offset).x && 0.5 + dx > (tx + offset).x) {
      return vec4(1,1,0,1) * color;
    } else {
      return off * color;
    }
}
