import opencl
import ./clblast_half

type
  cl_float2* = array[2, cfloat]
  cl_double2* = array[2, cdouble]
  cl_half* = half
when defined(Windows):
  const dynlibclblast_c = "clblast.dll"

when defined(Linux):
  const dynlibclblast_c = "libclblast.so"

when defined(MacOSX):
  const dynlibclblast_c = "libclblast.dylib"

type
  CLBlastStatusCode* {.size: sizeof(cint).} = enum
    CLBlastInsufficientMemoryTemp = -2050, CLBlastInvalidBatchCount = -2049,
    CLBlastInvalidOverrideKernel = -2048, CLBlastMissingOverrideParameter = -2047,
    CLBlastInvalidLocalMemUsage = -2046, CLBlastNoHalfPrecision = -2045,
    CLBlastNoDoublePrecision = -2044, CLBlastInvalidVectorScalar = -2043,
    CLBlastInsufficientMemoryScalar = -2042, CLBlastDatabaseError = -2041,
    CLBlastUnknownError = -2040, CLBlastUnexpectedError = -2039,
    CLBlastNotImplemented = -1024, CLBlastInvalidMatrixA = -1022,
    CLBlastInvalidMatrixB = -1021, CLBlastInvalidMatrixC = -1020,
    CLBlastInvalidVectorX = -1019, CLBlastInvalidVectorY = -1018,
    CLBlastInvalidDimension = -1017, CLBlastInvalidLeadDimA = -1016,
    CLBlastInvalidLeadDimB = -1015, CLBlastInvalidLeadDimC = -1014,
    CLBlastInvalidIncrementX = -1013, CLBlastInvalidIncrementY = -1012,
    CLBlastInsufficientMemoryA = -1011, CLBlastInsufficientMemoryB = -1010,
    CLBlastInsufficientMemoryC = -1009, CLBlastInsufficientMemoryX = -1008,
    CLBlastInsufficientMemoryY = -1007, CLBlastInvalidGlobalWorkSize = -63,
    CLBlastInvalidBufferSize = -61, CLBlastInvalidOperation = -59,
    CLBlastInvalidEvent = -58, CLBlastInvalidEventWaitList = -57,
    CLBlastInvalidGlobalOffset = -56, CLBlastInvalidLocalThreadsDim = -55,
    CLBlastInvalidLocalThreadsTotal = -54, CLBlastInvalidLocalNumDimensions = -53,
    CLBlastInvalidKernelArgs = -52, CLBlastInvalidArgSize = -51,
    CLBlastInvalidArgValue = -50, CLBlastInvalidArgIndex = -49,
    CLBlastInvalidKernel = -48, CLBlastInvalidKernelDefinition = -47,
    CLBlastInvalidKernelName = -46, CLBlastInvalidProgramExecutable = -45,
    CLBlastInvalidProgram = -44, CLBlastInvalidBuildOptions = -43,
    CLBlastInvalidBinary = -42, CLBlastInvalidMemObject = -38,
    CLBlastInvalidCommandQueue = -36, CLBlastInvalidValue = -30,
    CLBlastOpenCLBuildProgramFailure = -11, CLBlastOpenCLOutOfHostMemory = -6,
    CLBlastOpenCLOutOfResources = -5, CLBlastTempBufferAllocFailure = -4,
    CLBlastOpenCLCompilerNotAvailable = -3, CLBlastSuccess = 0
  CLBlastLayout* {.size: sizeof(cint).} = enum
    CLBlastLayoutRowMajor = 101, CLBlastLayoutColMajor = 102
  CLBlastTranspose* {.size: sizeof(cint).} = enum
    CLBlastTransposeNo = 111, CLBlastTransposeYes = 112,
    CLBlastTransposeConjugate = 113
  CLBlastTriangle* {.size: sizeof(cint).} = enum
    CLBlastTriangleUpper = 121, CLBlastTriangleLower = 122
  CLBlastDiagonal* {.size: sizeof(cint).} = enum
    CLBlastDiagonalNonUnit = 131, CLBlastDiagonalUnit = 132
  CLBlastSide* {.size: sizeof(cint).} = enum
    CLBlastSideLeft = 141, CLBlastSideRight = 142
  CLBlastKernelMode* {.size: sizeof(cint).} = enum
    CLBlastKernelModeCrossCorrelation = 151, CLBlastKernelModeConvolution = 152
  CLBlastPrecision* {.size: sizeof(cint).} = enum
    CLBlastPrecisionHalf = 16, CLBlastPrecisionSingle = 32,
    CLBlastPrecisionDouble = 64, CLBlastPrecisionComplexSingle = 3232,
    CLBlastPrecisionComplexDouble = 6464









proc clblastSrotg*(sa_buffer: Pmem; sa_offset: csize; sb_buffer: Pmem;
                  sb_offset: csize; sc_buffer: Pmem; sc_offset: csize;
                  ss_buffer: Pmem; ss_offset: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSrotg", dynlib: dynlibclblast_c.}
proc clblastDrotg*(sa_buffer: Pmem; sa_offset: csize; sb_buffer: Pmem;
                  sb_offset: csize; sc_buffer: Pmem; sc_offset: csize;
                  ss_buffer: Pmem; ss_offset: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDrotg", dynlib: dynlibclblast_c.}
proc clblastSrotmg*(sd1_buffer: Pmem; sd1_offset: csize; sd2_buffer: Pmem;
                   sd2_offset: csize; sx1_buffer: Pmem; sx1_offset: csize;
                   sy1_buffer: Pmem; sy1_offset: csize; sparam_buffer: Pmem;
                   sparam_offset: csize; queue: ptr Pcommand_queue;
                   event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSrotmg", dynlib: dynlibclblast_c.}
proc clblastDrotmg*(sd1_buffer: Pmem; sd1_offset: csize; sd2_buffer: Pmem;
                   sd2_offset: csize; sx1_buffer: Pmem; sx1_offset: csize;
                   sy1_buffer: Pmem; sy1_offset: csize; sparam_buffer: Pmem;
                   sparam_offset: csize; queue: ptr Pcommand_queue;
                   event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDrotmg", dynlib: dynlibclblast_c.}
proc clblastSrot*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 y_buffer: Pmem; y_offset: csize; y_inc: csize; cos: cfloat;
                 sin: cfloat; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSrot", dynlib: dynlibclblast_c.}
proc clblastDrot*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 y_buffer: Pmem; y_offset: csize; y_inc: csize; cos: cdouble;
                 sin: cdouble; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDrot", dynlib: dynlibclblast_c.}
proc clblastSrotm*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  sparam_buffer: Pmem; sparam_offset: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSrotm", dynlib: dynlibclblast_c.}
proc clblastDrotm*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  sparam_buffer: Pmem; sparam_offset: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDrotm", dynlib: dynlibclblast_c.}
proc clblastSswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSswap", dynlib: dynlibclblast_c.}
proc clblastDswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDswap", dynlib: dynlibclblast_c.}
proc clblastCswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCswap", dynlib: dynlibclblast_c.}
proc clblastZswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZswap", dynlib: dynlibclblast_c.}
proc clblastHswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHswap", dynlib: dynlibclblast_c.}
proc clblastSscal*(n: csize; alpha: cfloat; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSscal", dynlib: dynlibclblast_c.}
proc clblastDscal*(n: csize; alpha: cdouble; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDscal", dynlib: dynlibclblast_c.}
proc clblastCscal*(n: csize; alpha: cl_float2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCscal", dynlib: dynlibclblast_c.}
proc clblastZscal*(n: csize; alpha: cl_double2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZscal", dynlib: dynlibclblast_c.}
proc clblastHscal*(n: csize; alpha: cl_half; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHscal", dynlib: dynlibclblast_c.}
proc clblastScopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScopy", dynlib: dynlibclblast_c.}
proc clblastDcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDcopy", dynlib: dynlibclblast_c.}
proc clblastCcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCcopy", dynlib: dynlibclblast_c.}
proc clblastZcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZcopy", dynlib: dynlibclblast_c.}
proc clblastHcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHcopy", dynlib: dynlibclblast_c.}
proc clblastSaxpy*(n: csize; alpha: cfloat; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSaxpy", dynlib: dynlibclblast_c.}
proc clblastDaxpy*(n: csize; alpha: cdouble; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDaxpy", dynlib: dynlibclblast_c.}
proc clblastCaxpy*(n: csize; alpha: cl_float2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCaxpy", dynlib: dynlibclblast_c.}
proc clblastZaxpy*(n: csize; alpha: cl_double2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZaxpy", dynlib: dynlibclblast_c.}
proc clblastHaxpy*(n: csize; alpha: cl_half; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHaxpy", dynlib: dynlibclblast_c.}
proc clblastSdot*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                 y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSdot", dynlib: dynlibclblast_c.}
proc clblastDdot*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                 y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDdot", dynlib: dynlibclblast_c.}
proc clblastHdot*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                 y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHdot", dynlib: dynlibclblast_c.}
proc clblastCdotu*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCdotu", dynlib: dynlibclblast_c.}
proc clblastZdotu*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZdotu", dynlib: dynlibclblast_c.}
proc clblastCdotc*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCdotc", dynlib: dynlibclblast_c.}
proc clblastZdotc*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZdotc", dynlib: dynlibclblast_c.}
proc clblastSnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSnrm2", dynlib: dynlibclblast_c.}
proc clblastDnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDnrm2", dynlib: dynlibclblast_c.}
proc clblastScnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScnrm2", dynlib: dynlibclblast_c.}
proc clblastDznrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDznrm2", dynlib: dynlibclblast_c.}
proc clblastHnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHnrm2", dynlib: dynlibclblast_c.}
proc clblastSasum*(n: csize; asum_buffer: Pmem; asum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSasum", dynlib: dynlibclblast_c.}
proc clblastDasum*(n: csize; asum_buffer: Pmem; asum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDasum", dynlib: dynlibclblast_c.}
proc clblastScasum*(n: csize; asum_buffer: Pmem; asum_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScasum", dynlib: dynlibclblast_c.}
proc clblastDzasum*(n: csize; asum_buffer: Pmem; asum_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDzasum", dynlib: dynlibclblast_c.}
proc clblastHasum*(n: csize; asum_buffer: Pmem; asum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHasum", dynlib: dynlibclblast_c.}
proc clblastSsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsum", dynlib: dynlibclblast_c.}
proc clblastDsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsum", dynlib: dynlibclblast_c.}
proc clblastScsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastScsum", dynlib: dynlibclblast_c.}
proc clblastDzsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDzsum", dynlib: dynlibclblast_c.}
proc clblastHsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsum", dynlib: dynlibclblast_c.}
proc clblastiSamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiSamax", dynlib: dynlibclblast_c.}
proc clblastiDamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiDamax", dynlib: dynlibclblast_c.}
proc clblastiCamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiCamax", dynlib: dynlibclblast_c.}
proc clblastiZamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiZamax", dynlib: dynlibclblast_c.}
proc clblastiHamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiHamax", dynlib: dynlibclblast_c.}
proc clblastiSamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiSamin", dynlib: dynlibclblast_c.}
proc clblastiDamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiDamin", dynlib: dynlibclblast_c.}
proc clblastiCamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiCamin", dynlib: dynlibclblast_c.}
proc clblastiZamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiZamin", dynlib: dynlibclblast_c.}
proc clblastiHamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiHamin", dynlib: dynlibclblast_c.}
proc clblastiSmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiSmax", dynlib: dynlibclblast_c.}
proc clblastiDmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiDmax", dynlib: dynlibclblast_c.}
proc clblastiCmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiCmax", dynlib: dynlibclblast_c.}
proc clblastiZmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiZmax", dynlib: dynlibclblast_c.}
proc clblastiHmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiHmax", dynlib: dynlibclblast_c.}
proc clblastiSmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiSmin", dynlib: dynlibclblast_c.}
proc clblastiDmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiDmin", dynlib: dynlibclblast_c.}
proc clblastiCmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiCmin", dynlib: dynlibclblast_c.}
proc clblastiZmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiZmin", dynlib: dynlibclblast_c.}
proc clblastiHmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiHmin", dynlib: dynlibclblast_c.}
proc clblastSgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cfloat; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cfloat; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgemv", dynlib: dynlibclblast_c.}
proc clblastDgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cdouble; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cdouble; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgemv", dynlib: dynlibclblast_c.}
proc clblastCgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cl_float2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_float2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgemv", dynlib: dynlibclblast_c.}
proc clblastZgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cl_double2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_double2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgemv", dynlib: dynlibclblast_c.}
proc clblastHgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cl_half; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_half; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgemv", dynlib: dynlibclblast_c.}
proc clblastSgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cfloat; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cfloat; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgbmv", dynlib: dynlibclblast_c.}
proc clblastDgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cdouble; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cdouble; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgbmv", dynlib: dynlibclblast_c.}
proc clblastCgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cl_float2; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cl_float2; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgbmv", dynlib: dynlibclblast_c.}
proc clblastZgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cl_double2; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cl_double2; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgbmv", dynlib: dynlibclblast_c.}
proc clblastHgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cl_half; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cl_half; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgbmv", dynlib: dynlibclblast_c.}
proc clblastChemv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_float2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChemv", dynlib: dynlibclblast_c.}
proc clblastZhemv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_double2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhemv", dynlib: dynlibclblast_c.}
proc clblastChbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cl_float2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_float2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChbmv", dynlib: dynlibclblast_c.}
proc clblastZhbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cl_double2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_double2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhbmv", dynlib: dynlibclblast_c.}
proc clblastChpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_float2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChpmv", dynlib: dynlibclblast_c.}
proc clblastZhpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_double2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhpmv", dynlib: dynlibclblast_c.}
proc clblastSsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cfloat;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsymv", dynlib: dynlibclblast_c.}
proc clblastDsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cdouble;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsymv", dynlib: dynlibclblast_c.}
proc clblastHsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_half;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsymv", dynlib: dynlibclblast_c.}
proc clblastSsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cfloat; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cfloat; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsbmv", dynlib: dynlibclblast_c.}
proc clblastDsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cdouble; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cdouble; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsbmv", dynlib: dynlibclblast_c.}
proc clblastHsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cl_half; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_half; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsbmv", dynlib: dynlibclblast_c.}
proc clblastSspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cfloat;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSspmv", dynlib: dynlibclblast_c.}
proc clblastDspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cdouble;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDspmv", dynlib: dynlibclblast_c.}
proc clblastHspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_half;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHspmv", dynlib: dynlibclblast_c.}
proc clblastStrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStrmv", dynlib: dynlibclblast_c.}
proc clblastDtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtrmv", dynlib: dynlibclblast_c.}
proc clblastCtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtrmv", dynlib: dynlibclblast_c.}
proc clblastZtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtrmv", dynlib: dynlibclblast_c.}
proc clblastHtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHtrmv", dynlib: dynlibclblast_c.}
proc clblastStbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStbmv", dynlib: dynlibclblast_c.}
proc clblastDtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtbmv", dynlib: dynlibclblast_c.}
proc clblastCtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtbmv", dynlib: dynlibclblast_c.}
proc clblastZtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtbmv", dynlib: dynlibclblast_c.}
proc clblastHtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHtbmv", dynlib: dynlibclblast_c.}
proc clblastStpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStpmv", dynlib: dynlibclblast_c.}
proc clblastDtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtpmv", dynlib: dynlibclblast_c.}
proc clblastCtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtpmv", dynlib: dynlibclblast_c.}
proc clblastZtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtpmv", dynlib: dynlibclblast_c.}
proc clblastHtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHtpmv", dynlib: dynlibclblast_c.}
proc clblastStrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStrsv", dynlib: dynlibclblast_c.}
proc clblastDtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtrsv", dynlib: dynlibclblast_c.}
proc clblastCtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtrsv", dynlib: dynlibclblast_c.}
proc clblastZtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtrsv", dynlib: dynlibclblast_c.}
proc clblastStbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStbsv", dynlib: dynlibclblast_c.}
proc clblastDtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtbsv", dynlib: dynlibclblast_c.}
proc clblastCtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtbsv", dynlib: dynlibclblast_c.}
proc clblastZtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtbsv", dynlib: dynlibclblast_c.}
proc clblastStpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStpsv", dynlib: dynlibclblast_c.}
proc clblastDtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtpsv", dynlib: dynlibclblast_c.}
proc clblastCtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtpsv", dynlib: dynlibclblast_c.}
proc clblastZtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtpsv", dynlib: dynlibclblast_c.}
proc clblastSger*(layout: CLBlastLayout; m: csize; n: csize; alpha: cfloat;
                 x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                 y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                 a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSger", dynlib: dynlibclblast_c.}
proc clblastDger*(layout: CLBlastLayout; m: csize; n: csize; alpha: cdouble;
                 x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                 y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                 a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDger", dynlib: dynlibclblast_c.}
proc clblastHger*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_half;
                 x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                 y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                 a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHger", dynlib: dynlibclblast_c.}
proc clblastCgeru*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_float2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgeru", dynlib: dynlibclblast_c.}
proc clblastZgeru*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_double2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgeru", dynlib: dynlibclblast_c.}
proc clblastCgerc*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_float2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgerc", dynlib: dynlibclblast_c.}
proc clblastZgerc*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_double2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgerc", dynlib: dynlibclblast_c.}
proc clblastCher*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCher", dynlib: dynlibclblast_c.}
proc clblastZher*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZher", dynlib: dynlibclblast_c.}
proc clblastChpr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastChpr", dynlib: dynlibclblast_c.}
proc clblastZhpr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZhpr", dynlib: dynlibclblast_c.}
proc clblastCher2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCher2", dynlib: dynlibclblast_c.}
proc clblastZher2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZher2", dynlib: dynlibclblast_c.}
proc clblastChpr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChpr2", dynlib: dynlibclblast_c.}
proc clblastZhpr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhpr2", dynlib: dynlibclblast_c.}
proc clblastSsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsyr", dynlib: dynlibclblast_c.}
proc clblastDsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsyr", dynlib: dynlibclblast_c.}
proc clblastHsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsyr", dynlib: dynlibclblast_c.}
proc clblastSspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSspr", dynlib: dynlibclblast_c.}
proc clblastDspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDspr", dynlib: dynlibclblast_c.}
proc clblastHspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: ptr Pcommand_queue;
                 event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHspr", dynlib: dynlibclblast_c.}
proc clblastSsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsyr2", dynlib: dynlibclblast_c.}
proc clblastDsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsyr2", dynlib: dynlibclblast_c.}
proc clblastHsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsyr2", dynlib: dynlibclblast_c.}
proc clblastSspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSspr2", dynlib: dynlibclblast_c.}
proc clblastDspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDspr2", dynlib: dynlibclblast_c.}
proc clblastHspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHspr2", dynlib: dynlibclblast_c.}
proc clblastSgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cfloat; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cfloat;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgemm", dynlib: dynlibclblast_c.}
proc clblastDgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cdouble; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cdouble;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgemm", dynlib: dynlibclblast_c.}
proc clblastCgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_float2;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgemm", dynlib: dynlibclblast_c.}
proc clblastZgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_double2;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgemm", dynlib: dynlibclblast_c.}
proc clblastHgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cl_half; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_half;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgemm", dynlib: dynlibclblast_c.}
proc clblastSsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cfloat; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsymm", dynlib: dynlibclblast_c.}
proc clblastDsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cdouble; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsymm", dynlib: dynlibclblast_c.}
proc clblastCsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_float2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCsymm", dynlib: dynlibclblast_c.}
proc clblastZsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_double2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZsymm", dynlib: dynlibclblast_c.}
proc clblastHsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_half;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_half; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsymm", dynlib: dynlibclblast_c.}
proc clblastChemm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_float2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastChemm", dynlib: dynlibclblast_c.}
proc clblastZhemm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_double2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZhemm", dynlib: dynlibclblast_c.}
proc clblastSsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cfloat;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsyrk", dynlib: dynlibclblast_c.}
proc clblastDsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cdouble;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsyrk", dynlib: dynlibclblast_c.}
proc clblastCsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cl_float2;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCsyrk", dynlib: dynlibclblast_c.}
proc clblastZsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize;
                  alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  beta: cl_double2; c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZsyrk", dynlib: dynlibclblast_c.}
proc clblastHsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cl_half;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cl_half;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsyrk", dynlib: dynlibclblast_c.}
proc clblastCherk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cfloat;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCherk", dynlib: dynlibclblast_c.}
proc clblastZherk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cdouble;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZherk", dynlib: dynlibclblast_c.}
proc clblastSsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cfloat;
                   a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                   b_offset: csize; b_ld: csize; beta: cfloat; c_buffer: Pmem;
                   c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                   event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsyr2k", dynlib: dynlibclblast_c.}
proc clblastDsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cdouble;
                   a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                   b_offset: csize; b_ld: csize; beta: cdouble; c_buffer: Pmem;
                   c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                   event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsyr2k", dynlib: dynlibclblast_c.}
proc clblastCsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_float2;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCsyr2k", dynlib: dynlibclblast_c.}
proc clblastZsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_double2;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZsyr2k", dynlib: dynlibclblast_c.}
proc clblastHsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cl_half;
                   a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                   b_offset: csize; b_ld: csize; beta: cl_half; c_buffer: Pmem;
                   c_offset: csize; c_ld: csize; queue: ptr Pcommand_queue;
                   event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsyr2k", dynlib: dynlibclblast_c.}
proc clblastCher2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cfloat;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCher2k", dynlib: dynlibclblast_c.}
proc clblastZher2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cdouble;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZher2k", dynlib: dynlibclblast_c.}
proc clblastStrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStrmm", dynlib: dynlibclblast_c.}
proc clblastDtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtrmm", dynlib: dynlibclblast_c.}
proc clblastCtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtrmm", dynlib: dynlibclblast_c.}
proc clblastZtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtrmm", dynlib: dynlibclblast_c.}
proc clblastHtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_half;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHtrmm", dynlib: dynlibclblast_c.}
proc clblastStrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStrsm", dynlib: dynlibclblast_c.}
proc clblastDtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtrsm", dynlib: dynlibclblast_c.}
proc clblastCtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtrsm", dynlib: dynlibclblast_c.}
proc clblastZtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: ptr Pcommand_queue;
                  event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtrsm", dynlib: dynlibclblast_c.}
proc clblastSomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cfloat; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSomatcopy", dynlib: dynlibclblast_c.}
proc clblastDomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cdouble; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDomatcopy", dynlib: dynlibclblast_c.}
proc clblastComatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cl_float2; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastComatcopy", dynlib: dynlibclblast_c.}
proc clblastZomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cl_double2; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZomatcopy", dynlib: dynlibclblast_c.}
proc clblastHomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cl_half; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHomatcopy", dynlib: dynlibclblast_c.}
proc clblastSim2col*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; im_buffer: Pmem; im_offset: csize;
                    col_buffer: Pmem; col_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSim2col", dynlib: dynlibclblast_c.}
proc clblastDim2col*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; im_buffer: Pmem; im_offset: csize;
                    col_buffer: Pmem; col_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDim2col", dynlib: dynlibclblast_c.}
proc clblastCim2col*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; im_buffer: Pmem; im_offset: csize;
                    col_buffer: Pmem; col_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCim2col", dynlib: dynlibclblast_c.}
proc clblastZim2col*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; im_buffer: Pmem; im_offset: csize;
                    col_buffer: Pmem; col_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZim2col", dynlib: dynlibclblast_c.}
proc clblastHim2col*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; im_buffer: Pmem; im_offset: csize;
                    col_buffer: Pmem; col_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHim2col", dynlib: dynlibclblast_c.}
proc clblastScol2im*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; col_buffer: Pmem; col_offset: csize;
                    im_buffer: Pmem; im_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScol2im", dynlib: dynlibclblast_c.}
proc clblastDcol2im*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; col_buffer: Pmem; col_offset: csize;
                    im_buffer: Pmem; im_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDcol2im", dynlib: dynlibclblast_c.}
proc clblastCcol2im*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; col_buffer: Pmem; col_offset: csize;
                    im_buffer: Pmem; im_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCcol2im", dynlib: dynlibclblast_c.}
proc clblastZcol2im*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; col_buffer: Pmem; col_offset: csize;
                    im_buffer: Pmem; im_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZcol2im", dynlib: dynlibclblast_c.}
proc clblastHcol2im*(kernel_mode: CLBlastKernelMode; channels: csize; height: csize;
                    width: csize; kernel_h: csize; kernel_w: csize; pad_h: csize;
                    pad_w: csize; stride_h: csize; stride_w: csize; dilation_h: csize;
                    dilation_w: csize; col_buffer: Pmem; col_offset: csize;
                    im_buffer: Pmem; im_offset: csize;
                    queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHcol2im", dynlib: dynlibclblast_c.}
proc clblastSconvgemm*(kernel_mode: CLBlastKernelMode; channels: csize;
                      height: csize; width: csize; kernel_h: csize; kernel_w: csize;
                      pad_h: csize; pad_w: csize; stride_h: csize; stride_w: csize;
                      dilation_h: csize; dilation_w: csize; num_kernels: csize;
                      batch_count: csize; im_buffer: Pmem; im_offset: csize;
                      kernel_buffer: Pmem; kernel_offset: csize;
                      result_buffer: Pmem; result_offset: csize;
                      queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSconvgemm", dynlib: dynlibclblast_c.}
proc clblastDconvgemm*(kernel_mode: CLBlastKernelMode; channels: csize;
                      height: csize; width: csize; kernel_h: csize; kernel_w: csize;
                      pad_h: csize; pad_w: csize; stride_h: csize; stride_w: csize;
                      dilation_h: csize; dilation_w: csize; num_kernels: csize;
                      batch_count: csize; im_buffer: Pmem; im_offset: csize;
                      kernel_buffer: Pmem; kernel_offset: csize;
                      result_buffer: Pmem; result_offset: csize;
                      queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDconvgemm", dynlib: dynlibclblast_c.}
proc clblastHconvgemm*(kernel_mode: CLBlastKernelMode; channels: csize;
                      height: csize; width: csize; kernel_h: csize; kernel_w: csize;
                      pad_h: csize; pad_w: csize; stride_h: csize; stride_w: csize;
                      dilation_h: csize; dilation_w: csize; num_kernels: csize;
                      batch_count: csize; im_buffer: Pmem; im_offset: csize;
                      kernel_buffer: Pmem; kernel_offset: csize;
                      result_buffer: Pmem; result_offset: csize;
                      queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHconvgemm", dynlib: dynlibclblast_c.}
proc clblastSaxpyBatched*(n: csize; alphas: ptr cfloat; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSaxpyBatched", dynlib: dynlibclblast_c.}
proc clblastDaxpyBatched*(n: csize; alphas: ptr cdouble; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDaxpyBatched", dynlib: dynlibclblast_c.}
proc clblastCaxpyBatched*(n: csize; alphas: ptr cl_float2; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCaxpyBatched", dynlib: dynlibclblast_c.}
proc clblastZaxpyBatched*(n: csize; alphas: ptr cl_double2; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZaxpyBatched", dynlib: dynlibclblast_c.}
proc clblastHaxpyBatched*(n: csize; alphas: ptr cl_half; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHaxpyBatched", dynlib: dynlibclblast_c.}
proc clblastSgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cfloat; a_buffer: Pmem; a_offsets: ptr csize;
                         a_ld: csize; b_buffer: Pmem; b_offsets: ptr csize;
                         b_ld: csize; betas: ptr cfloat; c_buffer: Pmem;
                         c_offsets: ptr csize; c_ld: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgemmBatched", dynlib: dynlibclblast_c.}
proc clblastDgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cdouble; a_buffer: Pmem; a_offsets: ptr csize;
                         a_ld: csize; b_buffer: Pmem; b_offsets: ptr csize;
                         b_ld: csize; betas: ptr cdouble; c_buffer: Pmem;
                         c_offsets: ptr csize; c_ld: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgemmBatched", dynlib: dynlibclblast_c.}
proc clblastCgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cl_float2; a_buffer: Pmem;
                         a_offsets: ptr csize; a_ld: csize; b_buffer: Pmem;
                         b_offsets: ptr csize; b_ld: csize; betas: ptr cl_float2;
                         c_buffer: Pmem; c_offsets: ptr csize; c_ld: csize;
                         batch_count: csize; queue: ptr Pcommand_queue;
                         event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCgemmBatched", dynlib: dynlibclblast_c.}
proc clblastZgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cl_double2; a_buffer: Pmem;
                         a_offsets: ptr csize; a_ld: csize; b_buffer: Pmem;
                         b_offsets: ptr csize; b_ld: csize; betas: ptr cl_double2;
                         c_buffer: Pmem; c_offsets: ptr csize; c_ld: csize;
                         batch_count: csize; queue: ptr Pcommand_queue;
                         event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZgemmBatched", dynlib: dynlibclblast_c.}
proc clblastHgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cl_half; a_buffer: Pmem; a_offsets: ptr csize;
                         a_ld: csize; b_buffer: Pmem; b_offsets: ptr csize;
                         b_ld: csize; betas: ptr cl_half; c_buffer: Pmem;
                         c_offsets: ptr csize; c_ld: csize; batch_count: csize;
                         queue: ptr Pcommand_queue; event: ptr Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgemmBatched", dynlib: dynlibclblast_c.}
proc clblastSgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cfloat; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cfloat; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: ptr Pcommand_queue;
                                event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSgemmStridedBatched", dynlib: dynlibclblast_c.}
proc clblastDgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cdouble; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cdouble; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: ptr Pcommand_queue;
                                event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDgemmStridedBatched", dynlib: dynlibclblast_c.}
proc clblastCgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_float2; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cl_float2; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: ptr Pcommand_queue;
                                event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCgemmStridedBatched", dynlib: dynlibclblast_c.}
proc clblastZgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_double2; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cl_double2; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: ptr Pcommand_queue;
                                event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZgemmStridedBatched", dynlib: dynlibclblast_c.}
proc clblastHgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_half; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cl_half; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: ptr Pcommand_queue;
                                event: ptr Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHgemmStridedBatched", dynlib: dynlibclblast_c.}
proc clblastSgemmWithTempBuffer*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cfloat; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; b_buffer: Pmem;
                                b_offset: csize; b_ld: csize; beta: cfloat;
                                c_buffer: Pmem; c_offset: csize; c_ld: csize;
                                queue: ptr Pcommand_queue; event: ptr Pevent;
                                temp_buffer: Pmem): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSgemmWithTempBuffer", dynlib: dynlibclblast_c.}
proc clblastDgemmWithTempBuffer*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cdouble; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; b_buffer: Pmem;
                                b_offset: csize; b_ld: csize; beta: cdouble;
                                c_buffer: Pmem; c_offset: csize; c_ld: csize;
                                queue: ptr Pcommand_queue; event: ptr Pevent;
                                temp_buffer: Pmem): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDgemmWithTempBuffer", dynlib: dynlibclblast_c.}
proc clblastCgemmWithTempBuffer*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_float2; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; b_buffer: Pmem;
                                b_offset: csize; b_ld: csize; beta: cl_float2;
                                c_buffer: Pmem; c_offset: csize; c_ld: csize;
                                queue: ptr Pcommand_queue; event: ptr Pevent;
                                temp_buffer: Pmem): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCgemmWithTempBuffer", dynlib: dynlibclblast_c.}
proc clblastZgemmWithTempBuffer*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_double2; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; b_buffer: Pmem;
                                b_offset: csize; b_ld: csize; beta: cl_double2;
                                c_buffer: Pmem; c_offset: csize; c_ld: csize;
                                queue: ptr Pcommand_queue; event: ptr Pevent;
                                temp_buffer: Pmem): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZgemmWithTempBuffer", dynlib: dynlibclblast_c.}
proc clblastHgemmWithTempBuffer*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_half; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; b_buffer: Pmem;
                                b_offset: csize; b_ld: csize; beta: cl_half;
                                c_buffer: Pmem; c_offset: csize; c_ld: csize;
                                queue: ptr Pcommand_queue; event: ptr Pevent;
                                temp_buffer: Pmem): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHgemmWithTempBuffer", dynlib: dynlibclblast_c.}
proc clblastSGemmTempBufferSize*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; a_offset: csize; a_ld: csize;
                                b_offset: csize; b_ld: csize; c_offset: csize;
                                c_ld: csize; queue: ptr Pcommand_queue;
                                temp_buffer_size: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSGemmTempBufferSize", dynlib: dynlibclblast_c.}
proc clblastDGemmTempBufferSize*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; a_offset: csize; a_ld: csize;
                                b_offset: csize; b_ld: csize; c_offset: csize;
                                c_ld: csize; queue: ptr Pcommand_queue;
                                temp_buffer_size: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDGemmTempBufferSize", dynlib: dynlibclblast_c.}
proc clblastCGemmTempBufferSize*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; a_offset: csize; a_ld: csize;
                                b_offset: csize; b_ld: csize; c_offset: csize;
                                c_ld: csize; queue: ptr Pcommand_queue;
                                temp_buffer_size: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCGemmTempBufferSize", dynlib: dynlibclblast_c.}
proc clblastZGemmTempBufferSize*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; a_offset: csize; a_ld: csize;
                                b_offset: csize; b_ld: csize; c_offset: csize;
                                c_ld: csize; queue: ptr Pcommand_queue;
                                temp_buffer_size: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZGemmTempBufferSize", dynlib: dynlibclblast_c.}
proc clblastHGemmTempBufferSize*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; a_offset: csize; a_ld: csize;
                                b_offset: csize; b_ld: csize; c_offset: csize;
                                c_ld: csize; queue: ptr Pcommand_queue;
                                temp_buffer_size: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHGemmTempBufferSize", dynlib: dynlibclblast_c.}
proc clblastClearCache*(): CLBlastStatusCode {.stdcall,
    importc: "CLBlastClearCache", dynlib: dynlibclblast_c.}
proc clblastFillCache*(device: Pdevice_id): CLBlastStatusCode {.stdcall,
    importc: "CLBlastFillCache", dynlib: dynlibclblast_c.}
proc clblastOverrideParameters*(device: Pdevice_id; kernel_name: cstring;
                               precision: CLBlastPrecision; num_parameters: csize;
                               parameters_names: cstringArray;
                               parameters_values: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastOverrideParameters", dynlib: dynlibclblast_c.}
