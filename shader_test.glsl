#define PI 3.1415926535897932384626433832795

uniform float angle = 0;
uniform float magnitude = 0.1;

vec4 effect(vec4 color, sampler2D tex, vec2 tx, vec2 sc) {
    float angle = angle;
    float dx = 0.001;

    // vec2 offsetR = vec2(cos(angle), sin(angle)) * magnitude;
    // angle += 2 * PI / 3;
    // vec2 offsetG = vec2(cos(angle), sin(angle)) * magnitude;
    // angle += 2 * PI / 3;
    // vec2 offsetB = vec2(cos(angle), sin(angle)) * magnitude;

    // vec2 red   = texture2D(tex, tx + offsetR).ra;
    // vec2 green = texture2D(tex, tx + offsetG).ga;
    // vec2 blue  = texture2D(tex, tx + offsetB).ba;

    vec2 offset = vec2(1, 1) * magnitude;
    vec4 off = texture2D(tex, tx + offset).rgba;
    if (0.5 - dx < tx.x && 0.5 + dx > tx.x) {
      return vec4(1,0,1,1) * color;
    } else if (0.5 - dx < (tx + offset).x && 0.5 + dx > (tx + offset).x) {
      return vec4(1,1,0,1) * color;
    } else {
      return off * color;
    }
    // return vec4(
    //     mix(1.0, red.x, red.y),
    //     mix(1.0, green.x, green.y),
    //     mix(1.0, blue.x, blue.y),
    //     max(max(red.y, green.y), blue.y)
    // ) * color;
}
