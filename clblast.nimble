### Package
packageName   = "clblast"
version       = "0.0.1"
author        = "Mamy André-Ratsimbazafy"
description   = "A wrapper for CLBlast, an OpenCL BLAS library"
license       = "Apache License 2.0"

### Source
srcDir        = "src"

### Dependencies
requires "nim >= 0.17.2", "opencl"

task autogen, "Automatically generate up-to-date CLBlast bindings (requires nimgen)":
  exec "nimgen clblast_nimgen.cfg"
  if dirExists"src/generated":
    echo "src/generated directory exists and will replaced by up-to-date bindings"
    rmDir "src/generated"
  mvFile "clblast", "src/generated"
  echo "CLBlast bindings generated"