# Code is based on https://forum.nim-lang.org/t/1305
# and https://forum.nim-lang.org/t/338
import macros, hashes
import std/base64
import std/strformat
import sequtils

type
  # Use a distinct string type so we won't recurse forever
  gkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEE = distinct string

type
  # Use a distinct string type so we won't recurse forever
  stringldljkwöökcöjaadskostringldljkwöökcöjaadskostringldljkwöökcöjaadsko = distinct string

# Use a "strange" name
proc klsjioufhuslfhestringwefjklvdh(s: stringldljkwöökcöjaadskostringldljkwöökcöjaadskostringldljkwöökcöjaadsko,key: int): string {.noinline.} =
  # We need {.noinline.} here because otherwise C compiler
  # aggressively inlines this procedure for EACH string which results
  # in more assembly instructions
  #var k = key
  var bytes = toSeq("%%%%")
  var tempstring = string(s)
  if tempstring[0] == bytes[0]:
    result = string(decode(string(tempstring[1..^0])))
  else:
    let t2 = string(encode(tempstring))
    result = string(fmt"%{t2}")

var encodedCounter64 {.compileTime.} = hash(CompileTime & CompileDate) and 0x7FFFFFFE

# Use a term-rewriting macro to change all string literals
macro b64enrypt*{s}(s: string{lit}): untyped =
  var encodedStr = klsjioufhuslfhestringwefjklvdh(stringldljkwöökcöjaadskostringldljkwöökcöjaadskostringldljkwöökcöjaadsko($s),encodedCounter64)

  template genStuff2(str,counter: untyped): untyped = 
    {.noRewrite.}:
      klsjioufhuslfhestringwefjklvdh(stringldljkwöökcöjaadskostringldljkwöökcöjaadskostringldljkwöökcöjaadsko(`str`),`counter`)
  result = getAst(genStuff2(encodedStr,encodedCounter64))
  encodedCounter64 = (encodedCounter64 *% 16777619) and 0x7FFFFFFE
# Use a "strange" name
proc gkkaekgaEEgkkaekgaEEgkkaekgaEE(s: gkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEE, key: int): string {.noinline.} =
  # We need {.noinline.} here because otherwise C compiler
  # aggresively inlines this procedure for EACH string which results
  # in more assembly instructions
  var k = key
  var res = string(s)
  for i in 0 ..< res.len:
    for f in [0, 8, 16, 24]:
      res[i] = chr(uint8(res[i]) xor uint8((k shr f) and 0xFF))
    k = k +% 1
  result = res
  

var encodedCounter {.compileTime.} = hash(CompileTime & CompileDate) and 0x7FFFFFF1

# Use a term-rewriting macro to change all string literals
macro encryptstring*{s}(s: string{lit}): untyped =
  var encodedStr = gkkaekgaEEgkkaekgaEEgkkaekgaEE(gkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEE($s), encodedCounter)

  template genStuff(str, counter: untyped): untyped = 
    {.noRewrite.}:
      gkkaekgaEEgkkaekgaEEgkkaekgaEE(gkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEEgkkaekgaEE(`str`), `counter`)
  
  result = getAst(genStuff(encodedStr, encodedCounter))
  encodedCounter = (encodedCounter *% 16777619) and 0x7FFFFFF1
