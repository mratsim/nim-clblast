# Nim-CLBlast

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Stability](https://img.shields.io/badge/stability-experimental-orange.svg)

Nim CLBlast is a wrapper for [CLBlast](https://github.com/CNugteren/CLBlast), an OpenCL BLAS library


# APIs exposed

The wrapper exposes:
  - the core CLBlast API, this requires dealing with low-level opencl like memory allocation.
  - the Netlib API that can be used as a drop-in replacement to classic BLAS libraries like OpenBLAS (or nimblas in Nim case).
    This doesn't require any OpenCL knowledge or setup, everything is handled by CLBlast, however each function call
    will require a copy of input to the OpenCL device and a copy of the result from the OpenCL device.

A `check` template is provided to automatically check the error return values of all CLBlast calls.

# Full documentation

Please refer to [CLBlast repo.](https://github.com/CNugteren/CLBlast)