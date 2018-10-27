#define PI 3.1415926535897932384626433832795
float b = 0.15;
float min_r = 0.2;
float angle_b = acos(1-b/min_r);
float O1O2 = min_r * (0.5 - min_r) / (min_r-b);
float big_r = min_r + O1O2;
float min_arc = min_r * angle_b;
float big_arc = big_r * (PI - 2 * angle_b);
float ext_len = 2 * min_arc + big_arc;


// float norm2ext(float x) {
//   return x*(1 + 2 * b * (PI/2 - 1));
// }
//
// float ext2norm(float x) {
//   return x/(1 + 2 * b * (PI/2 - 1));
// }

// float proceed_x(float in_x) {
//   if (in_x < border) {
//     float angle = acos((border - in_x)/min_r);
//     // float shift = min_r * 2 * angle / PI;
//     float rounded = min_r * angle;
//     return ext2norm(rounded);
//   } else if (in_x > 1 - border) {
//     float centered = in_x - border + min_r * PI/2;
//     return ext2norm(centered);
//   } else {
//     float centered = in_x - border + min_r * PI/2;
//     return ext2norm(centered);
//   }
// }

float proceed_x(float in_x) {
  if (in_x < b) {
    float angle = acos((min_r - in_x)/min_r);
    float ext_x = angle * min_r;
    return ext_x / ext_len;
  } else if (in_x > 1 - b) {
    float angle = angle_b - acos((in_x + min_r - 1)/min_r);
    float ext_x = min_arc + big_arc + angle * min_r;
    return ext_x / ext_len;
  } else if (in_x < 0.5) {
    float comp_x = in_x - b + big_r * (1 - (1-b/min_r));
    // float comp_x = in_x - b + big_r * (1 - cos(angle_b));
    float angle = PI/2 - angle_b - asin(1 - comp_x/big_r);
    float arc = angle * big_r;
    float ext_x = min_arc + arc;
    return ext_x / ext_len;
  } else {
    float comp_x = in_x - b + big_r * (1 - (1-b/min_r));
    float angle = asin((comp_x - big_r)/big_r) + PI/2 - angle_b;
    float arc = angle * big_r;
    float ext_x = min_arc + arc;
    return ext_x / ext_len;
  }
}

vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
  float out_x = proceed_x(texture_coords.x);
  float out_y = proceed_x(texture_coords.y);
  vec4 res = texture2D(texture, vec2(out_x, out_y));
  return res * color;
}
