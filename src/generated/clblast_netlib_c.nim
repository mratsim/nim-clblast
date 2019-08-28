when defined(Windows):
  const dynlibclblast_netlib_c = "clblast.dll"

when defined(Linux):
  const dynlibclblast_netlib_c = "libclblast.so"

when defined(MacOSX):
  const dynlibclblast_netlib_c = "libclblast.dylib"


const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
{.passC: "-I\"" & sourcePath & "\"".}
{.passC: "-I\"" & sourcePath & "/include\"".}
type
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
    CLBlastKernelModeCrossCorrelation = 141, CLBlastKernelModeConvolution = 152
  CBLAS_ORDER* = CLBlastLayout
  CBLAS_TRANSPOSE* = CLBlastTranspose
  CBLAS_UPLO* = CLBlastTriangle
  CBLAS_DIAG* = CLBlastDiagonal
  CBLAS_SIDE* = CLBlastSide







proc cblas_srotg*(sa: ptr cfloat; sb: ptr cfloat; sc: ptr cfloat; ss: ptr cfloat) {.stdcall,
    importc: "cblas_srotg", dynlib: dynlibclblast_netlib_c.}
proc cblas_drotg*(sa: ptr cdouble; sb: ptr cdouble; sc: ptr cdouble; ss: ptr cdouble) {.
    stdcall, importc: "cblas_drotg", dynlib: dynlibclblast_netlib_c.}
proc cblas_srotmg*(sd1: ptr cfloat; sd2: ptr cfloat; sx1: ptr cfloat; sy1: cfloat;
                  sparam: ptr cfloat) {.stdcall, importc: "cblas_srotmg",
                                     dynlib: dynlibclblast_netlib_c.}
proc cblas_drotmg*(sd1: ptr cdouble; sd2: ptr cdouble; sx1: ptr cdouble; sy1: cdouble;
                  sparam: ptr cdouble) {.stdcall, importc: "cblas_drotmg",
                                      dynlib: dynlibclblast_netlib_c.}
proc cblas_srot*(n: cint; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint;
                cos: cfloat; sin: cfloat) {.stdcall, importc: "cblas_srot",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_drot*(n: cint; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint;
                cos: cdouble; sin: cdouble) {.stdcall, importc: "cblas_drot",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_srotm*(n: cint; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint;
                 sparam: ptr cfloat) {.stdcall, importc: "cblas_srotm",
                                    dynlib: dynlibclblast_netlib_c.}
proc cblas_drotm*(n: cint; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint;
                 sparam: ptr cdouble) {.stdcall, importc: "cblas_drotm",
                                     dynlib: dynlibclblast_netlib_c.}
proc cblas_sswap*(n: cint; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint) {.stdcall,
    importc: "cblas_sswap", dynlib: dynlibclblast_netlib_c.}
proc cblas_dswap*(n: cint; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint) {.
    stdcall, importc: "cblas_dswap", dynlib: dynlibclblast_netlib_c.}
proc cblas_cswap*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_cswap", dynlib: dynlibclblast_netlib_c.}
proc cblas_zswap*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_zswap", dynlib: dynlibclblast_netlib_c.}
proc cblas_sscal*(n: cint; alpha: cfloat; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_sscal", dynlib: dynlibclblast_netlib_c.}
proc cblas_dscal*(n: cint; alpha: cdouble; x: ptr cdouble; x_inc: cint) {.stdcall,
    importc: "cblas_dscal", dynlib: dynlibclblast_netlib_c.}
proc cblas_cscal*(n: cint; alpha: pointer; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_cscal", dynlib: dynlibclblast_netlib_c.}
proc cblas_zscal*(n: cint; alpha: pointer; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_zscal", dynlib: dynlibclblast_netlib_c.}
proc cblas_scopy*(n: cint; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint) {.stdcall,
    importc: "cblas_scopy", dynlib: dynlibclblast_netlib_c.}
proc cblas_dcopy*(n: cint; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint) {.
    stdcall, importc: "cblas_dcopy", dynlib: dynlibclblast_netlib_c.}
proc cblas_ccopy*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_ccopy", dynlib: dynlibclblast_netlib_c.}
proc cblas_zcopy*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_zcopy", dynlib: dynlibclblast_netlib_c.}
proc cblas_saxpy*(n: cint; alpha: cfloat; x: ptr cfloat; x_inc: cint; y: ptr cfloat;
                 y_inc: cint) {.stdcall, importc: "cblas_saxpy",
                              dynlib: dynlibclblast_netlib_c.}
proc cblas_daxpy*(n: cint; alpha: cdouble; x: ptr cdouble; x_inc: cint; y: ptr cdouble;
                 y_inc: cint) {.stdcall, importc: "cblas_daxpy",
                              dynlib: dynlibclblast_netlib_c.}
proc cblas_caxpy*(n: cint; alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint) {.
    stdcall, importc: "cblas_caxpy", dynlib: dynlibclblast_netlib_c.}
proc cblas_zaxpy*(n: cint; alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint) {.
    stdcall, importc: "cblas_zaxpy", dynlib: dynlibclblast_netlib_c.}
proc cblas_sdot*(n: cint; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint): cfloat {.
    stdcall, importc: "cblas_sdot", dynlib: dynlibclblast_netlib_c.}
proc cblas_ddot*(n: cint; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint): cdouble {.
    stdcall, importc: "cblas_ddot", dynlib: dynlibclblast_netlib_c.}
proc cblas_cdotu_sub*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                     dot: pointer) {.stdcall, importc: "cblas_cdotu_sub",
                                   dynlib: dynlibclblast_netlib_c.}
proc cblas_zdotu_sub*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                     dot: pointer) {.stdcall, importc: "cblas_zdotu_sub",
                                   dynlib: dynlibclblast_netlib_c.}
proc cblas_cdotc_sub*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                     dot: pointer) {.stdcall, importc: "cblas_cdotc_sub",
                                   dynlib: dynlibclblast_netlib_c.}
proc cblas_zdotc_sub*(n: cint; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                     dot: pointer) {.stdcall, importc: "cblas_zdotc_sub",
                                   dynlib: dynlibclblast_netlib_c.}
proc cblas_snrm2*(n: cint; x: ptr cfloat; x_inc: cint): cfloat {.stdcall,
    importc: "cblas_snrm2", dynlib: dynlibclblast_netlib_c.}
proc cblas_dnrm2*(n: cint; x: ptr cdouble; x_inc: cint): cdouble {.stdcall,
    importc: "cblas_dnrm2", dynlib: dynlibclblast_netlib_c.}
proc cblas_scnrm2*(n: cint; x: pointer; x_inc: cint): cfloat {.stdcall,
    importc: "cblas_scnrm2", dynlib: dynlibclblast_netlib_c.}
proc cblas_dznrm2*(n: cint; x: pointer; x_inc: cint): cdouble {.stdcall,
    importc: "cblas_dznrm2", dynlib: dynlibclblast_netlib_c.}
proc cblas_sasum*(n: cint; x: ptr cfloat; x_inc: cint): cfloat {.stdcall,
    importc: "cblas_sasum", dynlib: dynlibclblast_netlib_c.}
proc cblas_dasum*(n: cint; x: ptr cdouble; x_inc: cint): cdouble {.stdcall,
    importc: "cblas_dasum", dynlib: dynlibclblast_netlib_c.}
proc cblas_scasum*(n: cint; x: pointer; x_inc: cint): cfloat {.stdcall,
    importc: "cblas_scasum", dynlib: dynlibclblast_netlib_c.}
proc cblas_dzasum*(n: cint; x: pointer; x_inc: cint): cdouble {.stdcall,
    importc: "cblas_dzasum", dynlib: dynlibclblast_netlib_c.}
proc cblas_ssum*(n: cint; x: ptr cfloat; x_inc: cint): cfloat {.stdcall,
    importc: "cblas_ssum", dynlib: dynlibclblast_netlib_c.}
proc cblas_dsum*(n: cint; x: ptr cdouble; x_inc: cint): cdouble {.stdcall,
    importc: "cblas_dsum", dynlib: dynlibclblast_netlib_c.}
proc cblas_scsum*(n: cint; x: pointer; x_inc: cint): cfloat {.stdcall,
    importc: "cblas_scsum", dynlib: dynlibclblast_netlib_c.}
proc cblas_dzsum*(n: cint; x: pointer; x_inc: cint): cdouble {.stdcall,
    importc: "cblas_dzsum", dynlib: dynlibclblast_netlib_c.}
proc cblas_isamax*(n: cint; x: ptr cfloat; x_inc: cint): cint {.stdcall,
    importc: "cblas_isamax", dynlib: dynlibclblast_netlib_c.}
proc cblas_idamax*(n: cint; x: ptr cdouble; x_inc: cint): cint {.stdcall,
    importc: "cblas_idamax", dynlib: dynlibclblast_netlib_c.}
proc cblas_icamax*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_icamax", dynlib: dynlibclblast_netlib_c.}
proc cblas_izamax*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_izamax", dynlib: dynlibclblast_netlib_c.}
proc cblas_isamin*(n: cint; x: ptr cfloat; x_inc: cint): cint {.stdcall,
    importc: "cblas_isamin", dynlib: dynlibclblast_netlib_c.}
proc cblas_idamin*(n: cint; x: ptr cdouble; x_inc: cint): cint {.stdcall,
    importc: "cblas_idamin", dynlib: dynlibclblast_netlib_c.}
proc cblas_icamin*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_icamin", dynlib: dynlibclblast_netlib_c.}
proc cblas_izamin*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_izamin", dynlib: dynlibclblast_netlib_c.}
proc cblas_ismax*(n: cint; x: ptr cfloat; x_inc: cint): cint {.stdcall,
    importc: "cblas_ismax", dynlib: dynlibclblast_netlib_c.}
proc cblas_idmax*(n: cint; x: ptr cdouble; x_inc: cint): cint {.stdcall,
    importc: "cblas_idmax", dynlib: dynlibclblast_netlib_c.}
proc cblas_icmax*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_icmax", dynlib: dynlibclblast_netlib_c.}
proc cblas_izmax*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_izmax", dynlib: dynlibclblast_netlib_c.}
proc cblas_ismin*(n: cint; x: ptr cfloat; x_inc: cint): cint {.stdcall,
    importc: "cblas_ismin", dynlib: dynlibclblast_netlib_c.}
proc cblas_idmin*(n: cint; x: ptr cdouble; x_inc: cint): cint {.stdcall,
    importc: "cblas_idmin", dynlib: dynlibclblast_netlib_c.}
proc cblas_icmin*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_icmin", dynlib: dynlibclblast_netlib_c.}
proc cblas_izmin*(n: cint; x: pointer; x_inc: cint): cint {.stdcall,
    importc: "cblas_izmin", dynlib: dynlibclblast_netlib_c.}
proc cblas_sgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; alpha: cfloat; a: ptr cfloat; a_ld: cint; x: ptr cfloat;
                 x_inc: cint; beta: cfloat; y: ptr cfloat; y_inc: cint) {.stdcall,
    importc: "cblas_sgemv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; alpha: cdouble; a: ptr cdouble; a_ld: cint; x: ptr cdouble;
                 x_inc: cint; beta: cdouble; y: ptr cdouble; y_inc: cint) {.stdcall,
    importc: "cblas_dgemv", dynlib: dynlibclblast_netlib_c.}
proc cblas_cgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; alpha: pointer; a: pointer; a_ld: cint; x: pointer; x_inc: cint;
                 beta: pointer; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_cgemv", dynlib: dynlibclblast_netlib_c.}
proc cblas_zgemv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; alpha: pointer; a: pointer; a_ld: cint; x: pointer; x_inc: cint;
                 beta: pointer; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_zgemv", dynlib: dynlibclblast_netlib_c.}
proc cblas_sgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; kl: cint; ku: cint; alpha: cfloat; a: ptr cfloat; a_ld: cint;
                 x: ptr cfloat; x_inc: cint; beta: cfloat; y: ptr cfloat; y_inc: cint) {.
    stdcall, importc: "cblas_sgbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; kl: cint; ku: cint; alpha: cdouble; a: ptr cdouble; a_ld: cint;
                 x: ptr cdouble; x_inc: cint; beta: cdouble; y: ptr cdouble; y_inc: cint) {.
    stdcall, importc: "cblas_dgbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_cgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; kl: cint; ku: cint; alpha: pointer; a: pointer; a_ld: cint;
                 x: pointer; x_inc: cint; beta: pointer; y: pointer; y_inc: cint) {.
    stdcall, importc: "cblas_cgbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_zgbmv*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                 n: cint; kl: cint; ku: cint; alpha: pointer; a: pointer; a_ld: cint;
                 x: pointer; x_inc: cint; beta: pointer; y: pointer; y_inc: cint) {.
    stdcall, importc: "cblas_zgbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_chemv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; a: pointer; a_ld: cint; x: pointer; x_inc: cint;
                 beta: pointer; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_chemv", dynlib: dynlibclblast_netlib_c.}
proc cblas_zhemv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; a: pointer; a_ld: cint; x: pointer; x_inc: cint;
                 beta: pointer; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_zhemv", dynlib: dynlibclblast_netlib_c.}
proc cblas_chbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint; k: cint;
                 alpha: pointer; a: pointer; a_ld: cint; x: pointer; x_inc: cint;
                 beta: pointer; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_chbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_zhbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint; k: cint;
                 alpha: pointer; a: pointer; a_ld: cint; x: pointer; x_inc: cint;
                 beta: pointer; y: pointer; y_inc: cint) {.stdcall,
    importc: "cblas_zhbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_chpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; ap: pointer; x: pointer; x_inc: cint; beta: pointer;
                 y: pointer; y_inc: cint) {.stdcall, importc: "cblas_chpmv",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_zhpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; ap: pointer; x: pointer; x_inc: cint; beta: pointer;
                 y: pointer; y_inc: cint) {.stdcall, importc: "cblas_zhpmv",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_ssymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cfloat; a: ptr cfloat; a_ld: cint; x: ptr cfloat; x_inc: cint;
                 beta: cfloat; y: ptr cfloat; y_inc: cint) {.stdcall,
    importc: "cblas_ssymv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dsymv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cdouble; a: ptr cdouble; a_ld: cint; x: ptr cdouble; x_inc: cint;
                 beta: cdouble; y: ptr cdouble; y_inc: cint) {.stdcall,
    importc: "cblas_dsymv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ssbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint; k: cint;
                 alpha: cfloat; a: ptr cfloat; a_ld: cint; x: ptr cfloat; x_inc: cint;
                 beta: cfloat; y: ptr cfloat; y_inc: cint) {.stdcall,
    importc: "cblas_ssbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dsbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint; k: cint;
                 alpha: cdouble; a: ptr cdouble; a_ld: cint; x: ptr cdouble; x_inc: cint;
                 beta: cdouble; y: ptr cdouble; y_inc: cint) {.stdcall,
    importc: "cblas_dsbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_sspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cfloat; ap: ptr cfloat; x: ptr cfloat; x_inc: cint; beta: cfloat;
                 y: ptr cfloat; y_inc: cint) {.stdcall, importc: "cblas_sspmv",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_dspmv*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cdouble; ap: ptr cdouble; x: ptr cdouble; x_inc: cint;
                 beta: cdouble; y: ptr cdouble; y_inc: cint) {.stdcall,
    importc: "cblas_dspmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_strmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: ptr cfloat; a_ld: cint; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_strmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: ptr cdouble; a_ld: cint; x: ptr cdouble; x_inc: cint) {.stdcall,
    importc: "cblas_dtrmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ctrmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztrmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ztrmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_stbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: ptr cfloat; a_ld: cint; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_stbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: ptr cdouble; a_ld: cint; x: ptr cdouble; x_inc: cint) {.
    stdcall, importc: "cblas_dtbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ctbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztbmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ztbmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_stpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: ptr cfloat; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_stpmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: ptr cdouble; x: ptr cdouble; x_inc: cint) {.stdcall,
    importc: "cblas_dtpmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: pointer; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ctpmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztpmv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: pointer; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ztpmv", dynlib: dynlibclblast_netlib_c.}
proc cblas_strsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: ptr cfloat; a_ld: cint; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_strsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: ptr cdouble; a_ld: cint; x: ptr cdouble; x_inc: cint) {.stdcall,
    importc: "cblas_dtrsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ctrsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztrsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ztrsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_stbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: ptr cfloat; a_ld: cint; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_stbsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: ptr cdouble; a_ld: cint; x: ptr cdouble; x_inc: cint) {.
    stdcall, importc: "cblas_dtbsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ctbsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztbsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 k: cint; a: pointer; a_ld: cint; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ztbsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_stpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: ptr cfloat; x: ptr cfloat; x_inc: cint) {.stdcall,
    importc: "cblas_stpsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: ptr cdouble; x: ptr cdouble; x_inc: cint) {.stdcall,
    importc: "cblas_dtpsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: pointer; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ctpsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztpsv*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; diagonal: CLBlastDiagonal; n: cint;
                 ap: pointer; x: pointer; x_inc: cint) {.stdcall,
    importc: "cblas_ztpsv", dynlib: dynlibclblast_netlib_c.}
proc cblas_sger*(layout: CLBlastLayout; m: cint; n: cint; alpha: cfloat; x: ptr cfloat;
                x_inc: cint; y: ptr cfloat; y_inc: cint; a: ptr cfloat; a_ld: cint) {.
    stdcall, importc: "cblas_sger", dynlib: dynlibclblast_netlib_c.}
proc cblas_dger*(layout: CLBlastLayout; m: cint; n: cint; alpha: cdouble; x: ptr cdouble;
                x_inc: cint; y: ptr cdouble; y_inc: cint; a: ptr cdouble; a_ld: cint) {.
    stdcall, importc: "cblas_dger", dynlib: dynlibclblast_netlib_c.}
proc cblas_cgeru*(layout: CLBlastLayout; m: cint; n: cint; alpha: pointer; x: pointer;
                 x_inc: cint; y: pointer; y_inc: cint; a: pointer; a_ld: cint) {.stdcall,
    importc: "cblas_cgeru", dynlib: dynlibclblast_netlib_c.}
proc cblas_zgeru*(layout: CLBlastLayout; m: cint; n: cint; alpha: pointer; x: pointer;
                 x_inc: cint; y: pointer; y_inc: cint; a: pointer; a_ld: cint) {.stdcall,
    importc: "cblas_zgeru", dynlib: dynlibclblast_netlib_c.}
proc cblas_cgerc*(layout: CLBlastLayout; m: cint; n: cint; alpha: pointer; x: pointer;
                 x_inc: cint; y: pointer; y_inc: cint; a: pointer; a_ld: cint) {.stdcall,
    importc: "cblas_cgerc", dynlib: dynlibclblast_netlib_c.}
proc cblas_zgerc*(layout: CLBlastLayout; m: cint; n: cint; alpha: pointer; x: pointer;
                 x_inc: cint; y: pointer; y_inc: cint; a: pointer; a_ld: cint) {.stdcall,
    importc: "cblas_zgerc", dynlib: dynlibclblast_netlib_c.}
proc cblas_cher*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cfloat; x: pointer; x_inc: cint; a: pointer; a_ld: cint) {.stdcall,
    importc: "cblas_cher", dynlib: dynlibclblast_netlib_c.}
proc cblas_zher*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cdouble; x: pointer; x_inc: cint; a: pointer; a_ld: cint) {.
    stdcall, importc: "cblas_zher", dynlib: dynlibclblast_netlib_c.}
proc cblas_chpr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cfloat; x: pointer; x_inc: cint; ap: pointer) {.stdcall,
    importc: "cblas_chpr", dynlib: dynlibclblast_netlib_c.}
proc cblas_zhpr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cdouble; x: pointer; x_inc: cint; ap: pointer) {.stdcall,
    importc: "cblas_zhpr", dynlib: dynlibclblast_netlib_c.}
proc cblas_cher2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                 a: pointer; a_ld: cint) {.stdcall, importc: "cblas_cher2",
                                       dynlib: dynlibclblast_netlib_c.}
proc cblas_zher2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                 a: pointer; a_ld: cint) {.stdcall, importc: "cblas_zher2",
                                       dynlib: dynlibclblast_netlib_c.}
proc cblas_chpr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                 ap: pointer) {.stdcall, importc: "cblas_chpr2",
                              dynlib: dynlibclblast_netlib_c.}
proc cblas_zhpr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                 ap: pointer) {.stdcall, importc: "cblas_zhpr2",
                              dynlib: dynlibclblast_netlib_c.}
proc cblas_ssyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cfloat; x: ptr cfloat; x_inc: cint; a: ptr cfloat; a_ld: cint) {.
    stdcall, importc: "cblas_ssyr", dynlib: dynlibclblast_netlib_c.}
proc cblas_dsyr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cdouble; x: ptr cdouble; x_inc: cint; a: ptr cdouble; a_ld: cint) {.
    stdcall, importc: "cblas_dsyr", dynlib: dynlibclblast_netlib_c.}
proc cblas_sspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cfloat; x: ptr cfloat; x_inc: cint; ap: ptr cfloat) {.stdcall,
    importc: "cblas_sspr", dynlib: dynlibclblast_netlib_c.}
proc cblas_dspr*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                alpha: cdouble; x: ptr cdouble; x_inc: cint; ap: ptr cdouble) {.stdcall,
    importc: "cblas_dspr", dynlib: dynlibclblast_netlib_c.}
proc cblas_ssyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cfloat; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint;
                 a: ptr cfloat; a_ld: cint) {.stdcall, importc: "cblas_ssyr2",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_dsyr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cdouble; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint;
                 a: ptr cdouble; a_ld: cint) {.stdcall, importc: "cblas_dsyr2",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_sspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cfloat; x: ptr cfloat; x_inc: cint; y: ptr cfloat; y_inc: cint;
                 ap: ptr cfloat) {.stdcall, importc: "cblas_sspr2",
                                dynlib: dynlibclblast_netlib_c.}
proc cblas_dspr2*(layout: CLBlastLayout; triangle: CLBlastTriangle; n: cint;
                 alpha: cdouble; x: ptr cdouble; x_inc: cint; y: ptr cdouble; y_inc: cint;
                 ap: ptr cdouble) {.stdcall, importc: "cblas_dspr2",
                                 dynlib: dynlibclblast_netlib_c.}
proc cblas_sgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                 b_transpose: CLBlastTranspose; m: cint; n: cint; k: cint;
                 alpha: cfloat; a: ptr cfloat; a_ld: cint; b: ptr cfloat; b_ld: cint;
                 beta: cfloat; c: ptr cfloat; c_ld: cint) {.stdcall,
    importc: "cblas_sgemm", dynlib: dynlibclblast_netlib_c.}
proc cblas_dgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                 b_transpose: CLBlastTranspose; m: cint; n: cint; k: cint;
                 alpha: cdouble; a: ptr cdouble; a_ld: cint; b: ptr cdouble; b_ld: cint;
                 beta: cdouble; c: ptr cdouble; c_ld: cint) {.stdcall,
    importc: "cblas_dgemm", dynlib: dynlibclblast_netlib_c.}
proc cblas_cgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                 b_transpose: CLBlastTranspose; m: cint; n: cint; k: cint;
                 alpha: pointer; a: pointer; a_ld: cint; b: pointer; b_ld: cint;
                 beta: pointer; c: pointer; c_ld: cint) {.stdcall,
    importc: "cblas_cgemm", dynlib: dynlibclblast_netlib_c.}
proc cblas_zgemm*(layout: CLBlastLayout; a_transpose: CLBlastTranspose;
                 b_transpose: CLBlastTranspose; m: cint; n: cint; k: cint;
                 alpha: pointer; a: pointer; a_ld: cint; b: pointer; b_ld: cint;
                 beta: pointer; c: pointer; c_ld: cint) {.stdcall,
    importc: "cblas_zgemm", dynlib: dynlibclblast_netlib_c.}
proc cblas_ssymm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; m: cint; n: cint; alpha: cfloat;
                 a: ptr cfloat; a_ld: cint; b: ptr cfloat; b_ld: cint; beta: cfloat;
                 c: ptr cfloat; c_ld: cint) {.stdcall, importc: "cblas_ssymm",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_dsymm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; m: cint; n: cint; alpha: cdouble;
                 a: ptr cdouble; a_ld: cint; b: ptr cdouble; b_ld: cint; beta: cdouble;
                 c: ptr cdouble; c_ld: cint) {.stdcall, importc: "cblas_dsymm",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_csymm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: pointer;
                 c: pointer; c_ld: cint) {.stdcall, importc: "cblas_csymm",
                                       dynlib: dynlibclblast_netlib_c.}
proc cblas_zsymm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: pointer;
                 c: pointer; c_ld: cint) {.stdcall, importc: "cblas_zsymm",
                                       dynlib: dynlibclblast_netlib_c.}
proc cblas_chemm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: pointer;
                 c: pointer; c_ld: cint) {.stdcall, importc: "cblas_chemm",
                                       dynlib: dynlibclblast_netlib_c.}
proc cblas_zhemm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: pointer;
                 c: pointer; c_ld: cint) {.stdcall, importc: "cblas_zhemm",
                                       dynlib: dynlibclblast_netlib_c.}
proc cblas_ssyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; n: cint; k: cint; alpha: cfloat;
                 a: ptr cfloat; a_ld: cint; beta: cfloat; c: ptr cfloat; c_ld: cint) {.
    stdcall, importc: "cblas_ssyrk", dynlib: dynlibclblast_netlib_c.}
proc cblas_dsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; n: cint; k: cint; alpha: cdouble;
                 a: ptr cdouble; a_ld: cint; beta: cdouble; c: ptr cdouble; c_ld: cint) {.
    stdcall, importc: "cblas_dsyrk", dynlib: dynlibclblast_netlib_c.}
proc cblas_csyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; n: cint; k: cint; alpha: pointer;
                 a: pointer; a_ld: cint; beta: pointer; c: pointer; c_ld: cint) {.stdcall,
    importc: "cblas_csyrk", dynlib: dynlibclblast_netlib_c.}
proc cblas_zsyrk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; n: cint; k: cint; alpha: pointer;
                 a: pointer; a_ld: cint; beta: pointer; c: pointer; c_ld: cint) {.stdcall,
    importc: "cblas_zsyrk", dynlib: dynlibclblast_netlib_c.}
proc cblas_cherk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; n: cint; k: cint; alpha: cfloat;
                 a: pointer; a_ld: cint; beta: cfloat; c: pointer; c_ld: cint) {.stdcall,
    importc: "cblas_cherk", dynlib: dynlibclblast_netlib_c.}
proc cblas_zherk*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                 a_transpose: CLBlastTranspose; n: cint; k: cint; alpha: cdouble;
                 a: pointer; a_ld: cint; beta: cdouble; c: pointer; c_ld: cint) {.stdcall,
    importc: "cblas_zherk", dynlib: dynlibclblast_netlib_c.}
proc cblas_ssyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  ab_transpose: CLBlastTranspose; n: cint; k: cint; alpha: cfloat;
                  a: ptr cfloat; a_ld: cint; b: ptr cfloat; b_ld: cint; beta: cfloat;
                  c: ptr cfloat; c_ld: cint) {.stdcall, importc: "cblas_ssyr2k",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_dsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  ab_transpose: CLBlastTranspose; n: cint; k: cint; alpha: cdouble;
                  a: ptr cdouble; a_ld: cint; b: ptr cdouble; b_ld: cint; beta: cdouble;
                  c: ptr cdouble; c_ld: cint) {.stdcall, importc: "cblas_dsyr2k",
    dynlib: dynlibclblast_netlib_c.}
proc cblas_csyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  ab_transpose: CLBlastTranspose; n: cint; k: cint; alpha: pointer;
                  a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: pointer;
                  c: pointer; c_ld: cint) {.stdcall, importc: "cblas_csyr2k",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_zsyr2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  ab_transpose: CLBlastTranspose; n: cint; k: cint; alpha: pointer;
                  a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: pointer;
                  c: pointer; c_ld: cint) {.stdcall, importc: "cblas_zsyr2k",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_cher2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  ab_transpose: CLBlastTranspose; n: cint; k: cint; alpha: pointer;
                  a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: cfloat;
                  c: pointer; c_ld: cint) {.stdcall, importc: "cblas_cher2k",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_zher2k*(layout: CLBlastLayout; triangle: CLBlastTriangle;
                  ab_transpose: CLBlastTranspose; n: cint; k: cint; alpha: pointer;
                  a: pointer; a_ld: cint; b: pointer; b_ld: cint; beta: cdouble;
                  c: pointer; c_ld: cint) {.stdcall, importc: "cblas_zher2k",
                                        dynlib: dynlibclblast_netlib_c.}
proc cblas_strmm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: cfloat;
                 a: ptr cfloat; a_ld: cint; b: ptr cfloat; b_ld: cint) {.stdcall,
    importc: "cblas_strmm", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtrmm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: cdouble;
                 a: ptr cdouble; a_ld: cint; b: ptr cdouble; b_ld: cint) {.stdcall,
    importc: "cblas_dtrmm", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctrmm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint) {.stdcall,
    importc: "cblas_ctrmm", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztrmm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint) {.stdcall,
    importc: "cblas_ztrmm", dynlib: dynlibclblast_netlib_c.}
proc cblas_strsm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: cfloat;
                 a: ptr cfloat; a_ld: cint; b: ptr cfloat; b_ld: cint) {.stdcall,
    importc: "cblas_strsm", dynlib: dynlibclblast_netlib_c.}
proc cblas_dtrsm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: cdouble;
                 a: ptr cdouble; a_ld: cint; b: ptr cdouble; b_ld: cint) {.stdcall,
    importc: "cblas_dtrsm", dynlib: dynlibclblast_netlib_c.}
proc cblas_ctrsm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint) {.stdcall,
    importc: "cblas_ctrsm", dynlib: dynlibclblast_netlib_c.}
proc cblas_ztrsm*(layout: CLBlastLayout; side: CLBlastSide;
                 triangle: CLBlastTriangle; a_transpose: CLBlastTranspose;
                 diagonal: CLBlastDiagonal; m: cint; n: cint; alpha: pointer;
                 a: pointer; a_ld: cint; b: pointer; b_ld: cint) {.stdcall,
    importc: "cblas_ztrsm", dynlib: dynlibclblast_netlib_c.}
proc cblas_shad*(n: cint; alpha: cfloat; x: ptr cfloat; x_inc: cint; y: ptr cfloat;
                y_inc: cint; beta: cfloat; z: ptr cfloat; z_inc: cint) {.stdcall,
    importc: "cblas_shad", dynlib: dynlibclblast_netlib_c.}
proc cblas_dhad*(n: cint; alpha: cdouble; x: ptr cdouble; x_inc: cint; y: ptr cdouble;
                y_inc: cint; beta: cdouble; z: ptr cdouble; z_inc: cint) {.stdcall,
    importc: "cblas_dhad", dynlib: dynlibclblast_netlib_c.}
proc cblas_chad*(n: cint; alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                beta: pointer; z: pointer; z_inc: cint) {.stdcall,
    importc: "cblas_chad", dynlib: dynlibclblast_netlib_c.}
proc cblas_zhad*(n: cint; alpha: pointer; x: pointer; x_inc: cint; y: pointer; y_inc: cint;
                beta: pointer; z: pointer; z_inc: cint) {.stdcall,
    importc: "cblas_zhad", dynlib: dynlibclblast_netlib_c.}
proc cblas_somatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                     n: cint; alpha: cfloat; a: ptr cfloat; a_ld: cint; b: ptr cfloat;
                     b_ld: cint) {.stdcall, importc: "cblas_somatcopy",
                                 dynlib: dynlibclblast_netlib_c.}
proc cblas_domatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                     n: cint; alpha: cdouble; a: ptr cdouble; a_ld: cint; b: ptr cdouble;
                     b_ld: cint) {.stdcall, importc: "cblas_domatcopy",
                                 dynlib: dynlibclblast_netlib_c.}
proc cblas_comatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                     n: cint; alpha: pointer; a: pointer; a_ld: cint; b: pointer;
                     b_ld: cint) {.stdcall, importc: "cblas_comatcopy",
                                 dynlib: dynlibclblast_netlib_c.}
proc cblas_zomatcopy*(layout: CLBlastLayout; a_transpose: CLBlastTranspose; m: cint;
                     n: cint; alpha: pointer; a: pointer; a_ld: cint; b: pointer;
                     b_ld: cint) {.stdcall, importc: "cblas_zomatcopy",
                                 dynlib: dynlibclblast_netlib_c.}
proc cblas_sim2col*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; im: ptr cfloat; col: ptr cfloat) {.stdcall,
    importc: "cblas_sim2col", dynlib: dynlibclblast_netlib_c.}
proc cblas_dim2col*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; im: ptr cdouble; col: ptr cdouble) {.stdcall,
    importc: "cblas_dim2col", dynlib: dynlibclblast_netlib_c.}
proc cblas_cim2col*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; im: pointer; col: pointer) {.stdcall,
    importc: "cblas_cim2col", dynlib: dynlibclblast_netlib_c.}
proc cblas_zim2col*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; im: pointer; col: pointer) {.stdcall,
    importc: "cblas_zim2col", dynlib: dynlibclblast_netlib_c.}
proc cblas_scol2im*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; col: ptr cfloat; im: ptr cfloat) {.stdcall,
    importc: "cblas_scol2im", dynlib: dynlibclblast_netlib_c.}
proc cblas_dcol2im*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; col: ptr cdouble; im: ptr cdouble) {.stdcall,
    importc: "cblas_dcol2im", dynlib: dynlibclblast_netlib_c.}
proc cblas_ccol2im*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; col: pointer; im: pointer) {.stdcall,
    importc: "cblas_ccol2im", dynlib: dynlibclblast_netlib_c.}
proc cblas_zcol2im*(kernel_mode: CLBlastKernelMode; channels: cint; height: cint;
                   width: cint; kernel_h: cint; kernel_w: cint; pad_h: cint;
                   pad_w: cint; stride_h: cint; stride_w: cint; dilation_h: cint;
                   dilation_w: cint; col: pointer; im: pointer) {.stdcall,
    importc: "cblas_zcol2im", dynlib: dynlibclblast_netlib_c.}