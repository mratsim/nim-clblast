


const headerclblast_half = "clblast_half.h"
type
  half* = cushort
  ConversionBits* {.importc: "ConversionBits", header: headerclblast_half, bycopy.} = object {.
      union.}
    i32* {.importc: "i32".}: cuint
    f32* {.importc: "f32".}: cfloat


proc FloatToHalf*(value: cfloat): half {.inline, stdcall.} =
  var base_table: array[512, cushort]
  var shift_table: array[512, cuchar]
  var bits: ConversionBits
  bits.f32 = value
  var halfbits: cushort
  return halfbits

proc HalfToFloat*(value: half): cfloat {.inline, stdcall.} =
  var mantissa_table: array[2048, cuint]
  var exponent_table: array[64, cuint]
  var offset_table: array[64, cushort]
  var bits: ConversionBits
  bits.i32 = mantissa_table[offset_table[value shr 10] + (value and 0x000003FF)] +
      exponent_table[value shr 10]
  return bits.f32
