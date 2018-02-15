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
    CLBlastInvalidBatchCount = -2049, CLBlastInvalidOverrideKernel = -2048,
    CLBlastMissingOverrideParameter = -2047, CLBlastInvalidLocalMemUsage = -2046,
    CLBlastNoHalfPrecision = -2045, CLBlastNoDoublePrecision = -2044,
    CLBlastInvalidVectorScalar = -2043, CLBlastInsufficientMemoryScalar = -2042,
    CLBlastDatabaseError = -2041, CLBlastUnknownError = -2040,
    CLBlastUnexpectedError = -2039, CLBlastNotImplemented = -1024,
    CLBlastInvalidMatrixA = -1022, CLBlastInvalidMatrixB = -1021,
    CLBlastInvalidMatrixC = -1020, CLBlastInvalidVectorX = -1019,
    CLBlastInvalidVectorY = -1018, CLBlastInvalidDimension = -1017,
    CLBlastInvalidLeadDimA = -1016, CLBlastInvalidLeadDimB = -1015,
    CLBlastInvalidLeadDimC = -1014, CLBlastInvalidIncrementX = -1013,
    CLBlastInvalidIncrementY = -1012, CLBlastInsufficientMemoryA = -1011,
    CLBlastInsufficientMemoryB = -1010, CLBlastInsufficientMemoryC = -1009,
    CLBlastInsufficientMemoryX = -1008, CLBlastInsufficientMemoryY = -1007,
    CLBlastInvalidGlobalWorkSize = -63, CLBlastInvalidBufferSize = -61,
    CLBlastInvalidOperation = -59, CLBlastInvalidEvent = -58,
    CLBlastInvalidEventWaitList = -57, CLBlastInvalidGlobalOffset = -56,
    CLBlastInvalidLocalThreadsDim = -55, CLBlastInvalidLocalThreadsTotal = -54,
    CLBlastInvalidLocalNumDimensions = -53, CLBlastInvalidKernelArgs = -52,
    CLBlastInvalidArgSize = -51, CLBlastInvalidArgValue = -50,
    CLBlastInvalidArgIndex = -49, CLBlastInvalidKernel = -48,
    CLBlastInvalidKernelDefinition = -47, CLBlastInvalidKernelName = -46,
    CLBlastInvalidProgramExecutable = -45, CLBlastInvalidProgram = -44,
    CLBlastInvalidBuildOptions = -43, CLBlastInvalidBinary = -42,
    CLBlastInvalidMemObject = -38, CLBlastInvalidCommandQueue = -36,
    CLBlastInvalidValue = -30, CLBlastOpenCLBuildProgramFailure = -11,
    CLBlastOpenCLOutOfHostMemory = -6, CLBlastOpenCLOutOfResources = -5,
    CLBlastTempBufferAllocFailure = -4, CLBlastOpenCLCompilerNotAvailable = -3,
    CLBlastSuccess = 0
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
  CLBlastPrecision* {.size: sizeof(cint).} = enum
    CLBlastPrecisionHalf = 16, CLBlastPrecisionSingle = 32,
    CLBlastPrecisionDouble = 64, CLBlastPrecisionComplexSingle = 3232,
    CLBlastPrecisionComplexDouble = 6464








proc CLBlastSrotg*(sa_buffer: Pmem; sa_offset: csize; sb_buffer: Pmem;
                  sb_offset: csize; sc_buffer: Pmem; sc_offset: csize;
                  ss_buffer: Pmem; ss_offset: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSrotg", dynlib: dynlibclblast_c.}
proc CLBlastDrotg*(sa_buffer: Pmem; sa_offset: csize; sb_buffer: Pmem;
                  sb_offset: csize; sc_buffer: Pmem; sc_offset: csize;
                  ss_buffer: Pmem; ss_offset: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDrotg", dynlib: dynlibclblast_c.}
proc CLBlastSrotmg*(sd1_buffer: Pmem; sd1_offset: csize; sd2_buffer: Pmem;
                   sd2_offset: csize; sx1_buffer: Pmem; sx1_offset: csize;
                   sy1_buffer: Pmem; sy1_offset: csize; sparam_buffer: Pmem;
                   sparam_offset: csize; queue: Pcommand_queue;
                   event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSrotmg", dynlib: dynlibclblast_c.}
proc CLBlastDrotmg*(sd1_buffer: Pmem; sd1_offset: csize; sd2_buffer: Pmem;
                   sd2_offset: csize; sx1_buffer: Pmem; sx1_offset: csize;
                   sy1_buffer: Pmem; sy1_offset: csize; sparam_buffer: Pmem;
                   sparam_offset: csize; queue: Pcommand_queue;
                   event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDrotmg", dynlib: dynlibclblast_c.}
proc CLBlastSrot*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 y_buffer: Pmem; y_offset: csize; y_inc: csize; cos: cfloat;
                 sin: cfloat; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSrot", dynlib: dynlibclblast_c.}
proc CLBlastDrot*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 y_buffer: Pmem; y_offset: csize; y_inc: csize; cos: cdouble;
                 sin: cdouble; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDrot", dynlib: dynlibclblast_c.}
proc CLBlastSrotm*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  sparam_buffer: Pmem; sparam_offset: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSrotm", dynlib: dynlibclblast_c.}
proc CLBlastDrotm*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  sparam_buffer: Pmem; sparam_offset: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDrotm", dynlib: dynlibclblast_c.}
proc CLBlastSswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSswap", dynlib: dynlibclblast_c.}
proc CLBlastDswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDswap", dynlib: dynlibclblast_c.}
proc CLBlastCswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCswap", dynlib: dynlibclblast_c.}
proc CLBlastZswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZswap", dynlib: dynlibclblast_c.}
proc CLBlastHswap*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHswap", dynlib: dynlibclblast_c.}
proc CLBlastSscal*(n: csize; alpha: cfloat; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSscal", dynlib: dynlibclblast_c.}
proc CLBlastDscal*(n: csize; alpha: cdouble; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDscal", dynlib: dynlibclblast_c.}
proc CLBlastCscal*(n: csize; alpha: cl_float2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCscal", dynlib: dynlibclblast_c.}
proc CLBlastZscal*(n: csize; alpha: cl_double2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZscal", dynlib: dynlibclblast_c.}
proc CLBlastHscal*(n: csize; alpha: cl_half; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHscal", dynlib: dynlibclblast_c.}
proc CLBlastScopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScopy", dynlib: dynlibclblast_c.}
proc CLBlastDcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDcopy", dynlib: dynlibclblast_c.}
proc CLBlastCcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCcopy", dynlib: dynlibclblast_c.}
proc CLBlastZcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZcopy", dynlib: dynlibclblast_c.}
proc CLBlastHcopy*(n: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHcopy", dynlib: dynlibclblast_c.}
proc CLBlastSaxpy*(n: csize; alpha: cfloat; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSaxpy", dynlib: dynlibclblast_c.}
proc CLBlastDaxpy*(n: csize; alpha: cdouble; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDaxpy", dynlib: dynlibclblast_c.}
proc CLBlastCaxpy*(n: csize; alpha: cl_float2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCaxpy", dynlib: dynlibclblast_c.}
proc CLBlastZaxpy*(n: csize; alpha: cl_double2; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZaxpy", dynlib: dynlibclblast_c.}
proc CLBlastHaxpy*(n: csize; alpha: cl_half; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHaxpy", dynlib: dynlibclblast_c.}
proc CLBlastSdot*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                 y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSdot", dynlib: dynlibclblast_c.}
proc CLBlastDdot*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                 y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDdot", dynlib: dynlibclblast_c.}
proc CLBlastHdot*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                 y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHdot", dynlib: dynlibclblast_c.}
proc CLBlastCdotu*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCdotu", dynlib: dynlibclblast_c.}
proc CLBlastZdotu*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZdotu", dynlib: dynlibclblast_c.}
proc CLBlastCdotc*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCdotc", dynlib: dynlibclblast_c.}
proc CLBlastZdotc*(n: csize; dot_buffer: Pmem; dot_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZdotc", dynlib: dynlibclblast_c.}
proc CLBlastSnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSnrm2", dynlib: dynlibclblast_c.}
proc CLBlastDnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDnrm2", dynlib: dynlibclblast_c.}
proc CLBlastScnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScnrm2", dynlib: dynlibclblast_c.}
proc CLBlastDznrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDznrm2", dynlib: dynlibclblast_c.}
proc CLBlastHnrm2*(n: csize; nrm2_buffer: Pmem; nrm2_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHnrm2", dynlib: dynlibclblast_c.}
proc CLBlastSasum*(n: csize; asum_buffer: Pmem; asum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSasum", dynlib: dynlibclblast_c.}
proc CLBlastDasum*(n: csize; asum_buffer: Pmem; asum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDasum", dynlib: dynlibclblast_c.}
proc CLBlastScasum*(n: csize; asum_buffer: Pmem; asum_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastScasum", dynlib: dynlibclblast_c.}
proc CLBlastDzasum*(n: csize; asum_buffer: Pmem; asum_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDzasum", dynlib: dynlibclblast_c.}
proc CLBlastHasum*(n: csize; asum_buffer: Pmem; asum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHasum", dynlib: dynlibclblast_c.}
proc CLBlastSsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsum", dynlib: dynlibclblast_c.}
proc CLBlastDsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsum", dynlib: dynlibclblast_c.}
proc CLBlastScsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastScsum", dynlib: dynlibclblast_c.}
proc CLBlastDzsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDzsum", dynlib: dynlibclblast_c.}
proc CLBlastHsum*(n: csize; sum_buffer: Pmem; sum_offset: csize; x_buffer: Pmem;
                 x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsum", dynlib: dynlibclblast_c.}
proc CLBlastiSamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiSamax", dynlib: dynlibclblast_c.}
proc CLBlastiDamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiDamax", dynlib: dynlibclblast_c.}
proc CLBlastiCamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiCamax", dynlib: dynlibclblast_c.}
proc CLBlastiZamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiZamax", dynlib: dynlibclblast_c.}
proc CLBlastiHamax*(n: csize; imax_buffer: Pmem; imax_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiHamax", dynlib: dynlibclblast_c.}
proc CLBlastiSamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiSamin", dynlib: dynlibclblast_c.}
proc CLBlastiDamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiDamin", dynlib: dynlibclblast_c.}
proc CLBlastiCamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiCamin", dynlib: dynlibclblast_c.}
proc CLBlastiZamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiZamin", dynlib: dynlibclblast_c.}
proc CLBlastiHamin*(n: csize; imin_buffer: Pmem; imin_offset: csize;
                   x_buffer: Pmem; x_offset: csize; x_inc: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastiHamin", dynlib: dynlibclblast_c.}
proc CLBlastiSmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiSmax", dynlib: dynlibclblast_c.}
proc CLBlastiDmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiDmax", dynlib: dynlibclblast_c.}
proc CLBlastiCmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiCmax", dynlib: dynlibclblast_c.}
proc CLBlastiZmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiZmax", dynlib: dynlibclblast_c.}
proc CLBlastiHmax*(n: csize; imax_buffer: Pmem; imax_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiHmax", dynlib: dynlibclblast_c.}
proc CLBlastiSmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiSmin", dynlib: dynlibclblast_c.}
proc CLBlastiDmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiDmin", dynlib: dynlibclblast_c.}
proc CLBlastiCmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiCmin", dynlib: dynlibclblast_c.}
proc CLBlastiZmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiZmin", dynlib: dynlibclblast_c.}
proc CLBlastiHmin*(n: csize; imin_buffer: Pmem; imin_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastiHmin", dynlib: dynlibclblast_c.}
proc CLBlastSgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cfloat; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cfloat; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgemv", dynlib: dynlibclblast_c.}
proc CLBlastDgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cdouble; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cdouble; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgemv", dynlib: dynlibclblast_c.}
proc CLBlastCgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cl_float2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_float2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgemv", dynlib: dynlibclblast_c.}
proc CLBlastZgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cl_double2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_double2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgemv", dynlib: dynlibclblast_c.}
proc CLBlastHgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; alpha: cl_half; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_half; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgemv", dynlib: dynlibclblast_c.}
proc CLBlastSgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cfloat; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cfloat; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgbmv", dynlib: dynlibclblast_c.}
proc CLBlastDgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cdouble; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cdouble; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgbmv", dynlib: dynlibclblast_c.}
proc CLBlastCgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cl_float2; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cl_float2; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgbmv", dynlib: dynlibclblast_c.}
proc CLBlastZgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cl_double2; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cl_double2; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgbmv", dynlib: dynlibclblast_c.}
proc CLBlastHgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: csize;
                  n: csize; kl: csize; ku: csize; alpha: cl_half; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; x_buffer: Pmem; x_offset: csize;
                  x_inc: csize; beta: cl_half; y_buffer: Pmem; y_offset: csize;
                  y_inc: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgbmv", dynlib: dynlibclblast_c.}
proc CLBlastChemv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_float2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChemv", dynlib: dynlibclblast_c.}
proc CLBlastZhemv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_double2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhemv", dynlib: dynlibclblast_c.}
proc CLBlastChbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cl_float2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_float2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChbmv", dynlib: dynlibclblast_c.}
proc CLBlastZhbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cl_double2; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_double2; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhbmv", dynlib: dynlibclblast_c.}
proc CLBlastChpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_float2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChpmv", dynlib: dynlibclblast_c.}
proc CLBlastZhpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_double2;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhpmv", dynlib: dynlibclblast_c.}
proc CLBlastSsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cfloat;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsymv", dynlib: dynlibclblast_c.}
proc CLBlastDsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cdouble;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsymv", dynlib: dynlibclblast_c.}
proc CLBlastHsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_half;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsymv", dynlib: dynlibclblast_c.}
proc CLBlastSsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cfloat; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cfloat; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsbmv", dynlib: dynlibclblast_c.}
proc CLBlastDsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cdouble; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cdouble; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsbmv", dynlib: dynlibclblast_c.}
proc CLBlastHsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  k: csize; alpha: cl_half; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  beta: cl_half; y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsbmv", dynlib: dynlibclblast_c.}
proc CLBlastSspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cfloat;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSspmv", dynlib: dynlibclblast_c.}
proc CLBlastDspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cdouble;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDspmv", dynlib: dynlibclblast_c.}
proc CLBlastHspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; ap_buffer: Pmem; ap_offset: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; beta: cl_half;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHspmv", dynlib: dynlibclblast_c.}
proc CLBlastStrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStrmv", dynlib: dynlibclblast_c.}
proc CLBlastDtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtrmv", dynlib: dynlibclblast_c.}
proc CLBlastCtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtrmv", dynlib: dynlibclblast_c.}
proc CLBlastZtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtrmv", dynlib: dynlibclblast_c.}
proc CLBlastHtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHtrmv", dynlib: dynlibclblast_c.}
proc CLBlastStbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStbmv", dynlib: dynlibclblast_c.}
proc CLBlastDtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtbmv", dynlib: dynlibclblast_c.}
proc CLBlastCtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtbmv", dynlib: dynlibclblast_c.}
proc CLBlastZtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtbmv", dynlib: dynlibclblast_c.}
proc CLBlastHtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHtbmv", dynlib: dynlibclblast_c.}
proc CLBlastStpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStpmv", dynlib: dynlibclblast_c.}
proc CLBlastDtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtpmv", dynlib: dynlibclblast_c.}
proc CLBlastCtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtpmv", dynlib: dynlibclblast_c.}
proc CLBlastZtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtpmv", dynlib: dynlibclblast_c.}
proc CLBlastHtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHtpmv", dynlib: dynlibclblast_c.}
proc CLBlastStrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStrsv", dynlib: dynlibclblast_c.}
proc CLBlastDtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtrsv", dynlib: dynlibclblast_c.}
proc CLBlastCtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtrsv", dynlib: dynlibclblast_c.}
proc CLBlastZtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtrsv", dynlib: dynlibclblast_c.}
proc CLBlastStbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastStbsv", dynlib: dynlibclblast_c.}
proc CLBlastDtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDtbsv", dynlib: dynlibclblast_c.}
proc CLBlastCtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCtbsv", dynlib: dynlibclblast_c.}
proc CLBlastZtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; k: csize; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZtbsv", dynlib: dynlibclblast_c.}
proc CLBlastStpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStpsv", dynlib: dynlibclblast_c.}
proc CLBlastDtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtpsv", dynlib: dynlibclblast_c.}
proc CLBlastCtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtpsv", dynlib: dynlibclblast_c.}
proc CLBlastZtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal;
                  n: csize; ap_buffer: Pmem; ap_offset: csize; x_buffer: Pmem;
                  x_offset: csize; x_inc: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtpsv", dynlib: dynlibclblast_c.}
proc CLBlastSger*(layout: CLBlastLayout; m: csize; n: csize; alpha: cfloat;
                 x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                 y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                 a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSger", dynlib: dynlibclblast_c.}
proc CLBlastDger*(layout: CLBlastLayout; m: csize; n: csize; alpha: cdouble;
                 x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                 y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                 a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDger", dynlib: dynlibclblast_c.}
proc CLBlastHger*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_half;
                 x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                 y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                 a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHger", dynlib: dynlibclblast_c.}
proc CLBlastCgeru*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_float2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgeru", dynlib: dynlibclblast_c.}
proc CLBlastZgeru*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_double2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgeru", dynlib: dynlibclblast_c.}
proc CLBlastCgerc*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_float2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgerc", dynlib: dynlibclblast_c.}
proc CLBlastZgerc*(layout: CLBlastLayout; m: csize; n: csize; alpha: cl_double2;
                  x_buffer: Pmem; x_offset: csize; x_inc: csize; y_buffer: Pmem;
                  y_offset: csize; y_inc: csize; a_buffer: Pmem; a_offset: csize;
                  a_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgerc", dynlib: dynlibclblast_c.}
proc CLBlastCher*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCher", dynlib: dynlibclblast_c.}
proc CLBlastZher*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZher", dynlib: dynlibclblast_c.}
proc CLBlastChpr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastChpr", dynlib: dynlibclblast_c.}
proc CLBlastZhpr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZhpr", dynlib: dynlibclblast_c.}
proc CLBlastCher2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCher2", dynlib: dynlibclblast_c.}
proc CLBlastZher2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZher2", dynlib: dynlibclblast_c.}
proc CLBlastChpr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_float2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastChpr2", dynlib: dynlibclblast_c.}
proc CLBlastZhpr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_double2; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZhpr2", dynlib: dynlibclblast_c.}
proc CLBlastSsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsyr", dynlib: dynlibclblast_c.}
proc CLBlastDsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsyr", dynlib: dynlibclblast_c.}
proc CLBlastHsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 a_buffer: Pmem; a_offset: csize; a_ld: csize;
                 queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsyr", dynlib: dynlibclblast_c.}
proc CLBlastSspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSspr", dynlib: dynlibclblast_c.}
proc CLBlastDspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDspr", dynlib: dynlibclblast_c.}
proc CLBlastHspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                 alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                 ap_buffer: Pmem; ap_offset: csize; queue: Pcommand_queue;
                 event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHspr", dynlib: dynlibclblast_c.}
proc CLBlastSsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsyr2", dynlib: dynlibclblast_c.}
proc CLBlastDsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsyr2", dynlib: dynlibclblast_c.}
proc CLBlastHsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; a_buffer: Pmem;
                  a_offset: csize; a_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsyr2", dynlib: dynlibclblast_c.}
proc CLBlastSspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cfloat; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSspr2", dynlib: dynlibclblast_c.}
proc CLBlastDspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cdouble; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDspr2", dynlib: dynlibclblast_c.}
proc CLBlastHspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: csize;
                  alpha: cl_half; x_buffer: Pmem; x_offset: csize; x_inc: csize;
                  y_buffer: Pmem; y_offset: csize; y_inc: csize; ap_buffer: Pmem;
                  ap_offset: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHspr2", dynlib: dynlibclblast_c.}
proc CLBlastSgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cfloat; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cfloat;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgemm", dynlib: dynlibclblast_c.}
proc CLBlastDgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cdouble; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cdouble;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgemm", dynlib: dynlibclblast_c.}
proc CLBlastCgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_float2;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCgemm", dynlib: dynlibclblast_c.}
proc CLBlastZgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_double2;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZgemm", dynlib: dynlibclblast_c.}
proc CLBlastHgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                  b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                  alpha: cl_half; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_half;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgemm", dynlib: dynlibclblast_c.}
proc CLBlastSsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cfloat; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsymm", dynlib: dynlibclblast_c.}
proc CLBlastDsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cdouble; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsymm", dynlib: dynlibclblast_c.}
proc CLBlastCsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_float2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCsymm", dynlib: dynlibclblast_c.}
proc CLBlastZsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_double2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZsymm", dynlib: dynlibclblast_c.}
proc CLBlastHsymm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_half;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_half; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsymm", dynlib: dynlibclblast_c.}
proc CLBlastChemm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_float2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastChemm", dynlib: dynlibclblast_c.}
proc CLBlastZhemm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; beta: cl_double2; c_buffer: Pmem;
                  c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZhemm", dynlib: dynlibclblast_c.}
proc CLBlastSsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cfloat;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSsyrk", dynlib: dynlibclblast_c.}
proc CLBlastDsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cdouble;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDsyrk", dynlib: dynlibclblast_c.}
proc CLBlastCsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cl_float2;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCsyrk", dynlib: dynlibclblast_c.}
proc CLBlastZsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize;
                  alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                  beta: cl_double2; c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZsyrk", dynlib: dynlibclblast_c.}
proc CLBlastHsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cl_half;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cl_half;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHsyrk", dynlib: dynlibclblast_c.}
proc CLBlastCherk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cfloat;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCherk", dynlib: dynlibclblast_c.}
proc CLBlastZherk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  a_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; beta: cdouble;
                  c_buffer: Pmem; c_offset: csize; c_ld: csize;
                  queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZherk", dynlib: dynlibclblast_c.}
proc CLBlastSsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cfloat;
                   a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                   b_offset: csize; b_ld: csize; beta: cfloat; c_buffer: Pmem;
                   c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                   event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSsyr2k", dynlib: dynlibclblast_c.}
proc CLBlastDsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cdouble;
                   a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                   b_offset: csize; b_ld: csize; beta: cdouble; c_buffer: Pmem;
                   c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                   event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDsyr2k", dynlib: dynlibclblast_c.}
proc CLBlastCsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_float2;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCsyr2k", dynlib: dynlibclblast_c.}
proc CLBlastZsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cl_double2;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZsyr2k", dynlib: dynlibclblast_c.}
proc CLBlastHsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize; alpha: cl_half;
                   a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                   b_offset: csize; b_ld: csize; beta: cl_half; c_buffer: Pmem;
                   c_offset: csize; c_ld: csize; queue: Pcommand_queue;
                   event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHsyr2k", dynlib: dynlibclblast_c.}
proc CLBlastCher2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_float2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cfloat;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCher2k", dynlib: dynlibclblast_c.}
proc CLBlastZher2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                   ab_transpose: CLBlastTranspose; n: csize; k: csize;
                   alpha: cl_double2; a_buffer: Pmem; a_offset: csize; a_ld: csize;
                   b_buffer: Pmem; b_offset: csize; b_ld: csize; beta: cdouble;
                   c_buffer: Pmem; c_offset: csize; c_ld: csize;
                   queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZher2k", dynlib: dynlibclblast_c.}
proc CLBlastStrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStrmm", dynlib: dynlibclblast_c.}
proc CLBlastDtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtrmm", dynlib: dynlibclblast_c.}
proc CLBlastCtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtrmm", dynlib: dynlibclblast_c.}
proc CLBlastZtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtrmm", dynlib: dynlibclblast_c.}
proc CLBlastHtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_half;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHtrmm", dynlib: dynlibclblast_c.}
proc CLBlastStrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cfloat;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastStrsm", dynlib: dynlibclblast_c.}
proc CLBlastDtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cdouble;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDtrsm", dynlib: dynlibclblast_c.}
proc CLBlastCtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_float2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCtrsm", dynlib: dynlibclblast_c.}
proc CLBlastZtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                  triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                  diagonal: CLBlastDiagonal; m: csize; n: csize; alpha: cl_double2;
                  a_buffer: Pmem; a_offset: csize; a_ld: csize; b_buffer: Pmem;
                  b_offset: csize; b_ld: csize; queue: Pcommand_queue;
                  event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZtrsm", dynlib: dynlibclblast_c.}
proc CLBlastSomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cfloat; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSomatcopy", dynlib: dynlibclblast_c.}
proc CLBlastDomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cdouble; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDomatcopy", dynlib: dynlibclblast_c.}
proc CLBlastComatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cl_float2; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastComatcopy", dynlib: dynlibclblast_c.}
proc CLBlastZomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cl_double2; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZomatcopy", dynlib: dynlibclblast_c.}
proc CLBlastHomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                      m: csize; n: csize; alpha: cl_half; a_buffer: Pmem;
                      a_offset: csize; a_ld: csize; b_buffer: Pmem; b_offset: csize;
                      b_ld: csize; queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHomatcopy", dynlib: dynlibclblast_c.}
proc CLBlastSim2col*(channels: csize; height: csize; width: csize; kernel_h: csize;
                    kernel_w: csize; pad_h: csize; pad_w: csize; stride_h: csize;
                    stride_w: csize; dilation_h: csize; dilation_w: csize;
                    im_buffer: Pmem; im_offset: csize; col_buffer: Pmem;
                    col_offset: csize; queue: Pcommand_queue;
                    event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSim2col", dynlib: dynlibclblast_c.}
proc CLBlastDim2col*(channels: csize; height: csize; width: csize; kernel_h: csize;
                    kernel_w: csize; pad_h: csize; pad_w: csize; stride_h: csize;
                    stride_w: csize; dilation_h: csize; dilation_w: csize;
                    im_buffer: Pmem; im_offset: csize; col_buffer: Pmem;
                    col_offset: csize; queue: Pcommand_queue;
                    event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDim2col", dynlib: dynlibclblast_c.}
proc CLBlastCim2col*(channels: csize; height: csize; width: csize; kernel_h: csize;
                    kernel_w: csize; pad_h: csize; pad_w: csize; stride_h: csize;
                    stride_w: csize; dilation_h: csize; dilation_w: csize;
                    im_buffer: Pmem; im_offset: csize; col_buffer: Pmem;
                    col_offset: csize; queue: Pcommand_queue;
                    event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCim2col", dynlib: dynlibclblast_c.}
proc CLBlastZim2col*(channels: csize; height: csize; width: csize; kernel_h: csize;
                    kernel_w: csize; pad_h: csize; pad_w: csize; stride_h: csize;
                    stride_w: csize; dilation_h: csize; dilation_w: csize;
                    im_buffer: Pmem; im_offset: csize; col_buffer: Pmem;
                    col_offset: csize; queue: Pcommand_queue;
                    event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZim2col", dynlib: dynlibclblast_c.}
proc CLBlastHim2col*(channels: csize; height: csize; width: csize; kernel_h: csize;
                    kernel_w: csize; pad_h: csize; pad_w: csize; stride_h: csize;
                    stride_w: csize; dilation_h: csize; dilation_w: csize;
                    im_buffer: Pmem; im_offset: csize; col_buffer: Pmem;
                    col_offset: csize; queue: Pcommand_queue;
                    event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHim2col", dynlib: dynlibclblast_c.}
proc CLBlastSaxpyBatched*(n: csize; alphas: ptr cfloat; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSaxpyBatched", dynlib: dynlibclblast_c.}
proc CLBlastDaxpyBatched*(n: csize; alphas: ptr cdouble; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDaxpyBatched", dynlib: dynlibclblast_c.}
proc CLBlastCaxpyBatched*(n: csize; alphas: ptr cl_float2; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastCaxpyBatched", dynlib: dynlibclblast_c.}
proc CLBlastZaxpyBatched*(n: csize; alphas: ptr cl_double2; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastZaxpyBatched", dynlib: dynlibclblast_c.}
proc CLBlastHaxpyBatched*(n: csize; alphas: ptr cl_half; x_buffer: Pmem;
                         x_offsets: ptr csize; x_inc: csize; y_buffer: Pmem;
                         y_offsets: ptr csize; y_inc: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHaxpyBatched", dynlib: dynlibclblast_c.}
proc CLBlastSgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cfloat; a_buffer: Pmem; a_offsets: ptr csize;
                         a_ld: csize; b_buffer: Pmem; b_offsets: ptr csize;
                         b_ld: csize; betas: ptr cfloat; c_buffer: Pmem;
                         c_offsets: ptr csize; c_ld: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastSgemmBatched", dynlib: dynlibclblast_c.}
proc CLBlastDgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cdouble; a_buffer: Pmem; a_offsets: ptr csize;
                         a_ld: csize; b_buffer: Pmem; b_offsets: ptr csize;
                         b_ld: csize; betas: ptr cdouble; c_buffer: Pmem;
                         c_offsets: ptr csize; c_ld: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastDgemmBatched", dynlib: dynlibclblast_c.}
proc CLBlastCgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cl_float2; a_buffer: Pmem;
                         a_offsets: ptr csize; a_ld: csize; b_buffer: Pmem;
                         b_offsets: ptr csize; b_ld: csize; betas: ptr cl_float2;
                         c_buffer: Pmem; c_offsets: ptr csize; c_ld: csize;
                         batch_count: csize; queue: Pcommand_queue;
                         event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCgemmBatched", dynlib: dynlibclblast_c.}
proc CLBlastZgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cl_double2; a_buffer: Pmem;
                         a_offsets: ptr csize; a_ld: csize; b_buffer: Pmem;
                         b_offsets: ptr csize; b_ld: csize; betas: ptr cl_double2;
                         c_buffer: Pmem; c_offsets: ptr csize; c_ld: csize;
                         batch_count: csize; queue: Pcommand_queue;
                         event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZgemmBatched", dynlib: dynlibclblast_c.}
proc CLBlastHgemmBatched*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                         b_transpose: CLBlastTranspose; m: csize; n: csize; k: csize;
                         alphas: ptr cl_half; a_buffer: Pmem; a_offsets: ptr csize;
                         a_ld: csize; b_buffer: Pmem; b_offsets: ptr csize;
                         b_ld: csize; betas: ptr cl_half; c_buffer: Pmem;
                         c_offsets: ptr csize; c_ld: csize; batch_count: csize;
                         queue: Pcommand_queue; event: Pevent): CLBlastStatusCode {.
    stdcall, importc: "CLBlastHgemmBatched", dynlib: dynlibclblast_c.}
proc CLBlastSgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cfloat; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cfloat; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: Pcommand_queue;
                                event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastSgemmStridedBatched", dynlib: dynlibclblast_c.}
proc CLBlastDgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cdouble; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cdouble; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: Pcommand_queue;
                                event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastDgemmStridedBatched", dynlib: dynlibclblast_c.}
proc CLBlastCgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_float2; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cl_float2; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: Pcommand_queue;
                                event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastCgemmStridedBatched", dynlib: dynlibclblast_c.}
proc CLBlastZgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_double2; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cl_double2; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: Pcommand_queue;
                                event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastZgemmStridedBatched", dynlib: dynlibclblast_c.}
proc CLBlastHgemmStridedBatched*(layout: CLBlastLayout;
                                a_transpose: CLBlastTranspose;
                                b_transpose: CLBlastTranspose; m: csize; n: csize;
                                k: csize; alpha: cl_half; a_buffer: Pmem;
                                a_offset: csize; a_ld: csize; a_stride: csize;
                                b_buffer: Pmem; b_offset: csize; b_ld: csize;
                                b_stride: csize; beta: cl_half; c_buffer: Pmem;
                                c_offset: csize; c_ld: csize; c_stride: csize;
                                batch_count: csize; queue: Pcommand_queue;
                                event: Pevent): CLBlastStatusCode {.stdcall,
    importc: "CLBlastHgemmStridedBatched", dynlib: dynlibclblast_c.}
proc CLBlastClearCache*(): CLBlastStatusCode {.stdcall,
    importc: "CLBlastClearCache", dynlib: dynlibclblast_c.}
proc CLBlastFillCache*(device: Pdevice_id): CLBlastStatusCode {.stdcall,
    importc: "CLBlastFillCache", dynlib: dynlibclblast_c.}
proc CLBlastOverrideParameters*(device: Pdevice_id; kernel_name: cstring;
                               precision: CLBlastPrecision; num_parameters: csize;
                               parameters_names: cstringArray;
                               parameters_values: ptr csize): CLBlastStatusCode {.
    stdcall, importc: "CLBlastOverrideParameters", dynlib: dynlibclblast_c.}