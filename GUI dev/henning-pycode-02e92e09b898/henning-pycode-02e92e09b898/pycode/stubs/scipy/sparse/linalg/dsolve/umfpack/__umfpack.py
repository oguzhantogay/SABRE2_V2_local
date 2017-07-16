# encoding: utf-8
# module scipy.sparse.linalg.dsolve.umfpack.__umfpack calls itself __umfpack
# from /usr/lib/python2.7/dist-packages/scipy/sparse/linalg/dsolve/umfpack/__umfpack.so by generator 1.96
# no doc

# imports
from __umfpack import (SWIG_PyInstanceMethod_New, umfpack_di_col_to_triplet,
                       umfpack_di_defaults, umfpack_di_free_numeric, umfpack_di_free_symbolic,
                       umfpack_di_get_lunz, umfpack_di_get_numeric, umfpack_di_numeric,
                       umfpack_di_report_control, umfpack_di_report_info,
                       umfpack_di_report_numeric, umfpack_di_report_symbolic, umfpack_di_scale,
                       umfpack_di_solve, umfpack_di_symbolic, umfpack_di_transpose,
                       umfpack_di_triplet_to_col, umfpack_dl_col_to_triplet, umfpack_dl_defaults,
                       umfpack_dl_free_numeric, umfpack_dl_free_symbolic, umfpack_dl_get_lunz,
                       umfpack_dl_get_numeric, umfpack_dl_numeric, umfpack_dl_report_control,
                       umfpack_dl_report_info, umfpack_dl_report_numeric,
                       umfpack_dl_report_symbolic, umfpack_dl_scale, umfpack_dl_solve,
                       umfpack_dl_symbolic, umfpack_dl_transpose, umfpack_dl_triplet_to_col,
                       umfpack_zi_col_to_triplet, umfpack_zi_defaults, umfpack_zi_free_numeric,
                       umfpack_zi_free_symbolic, umfpack_zi_get_lunz, umfpack_zi_get_numeric,
                       umfpack_zi_numeric, umfpack_zi_report_control, umfpack_zi_report_info,
                       umfpack_zi_report_numeric, umfpack_zi_report_symbolic, umfpack_zi_scale,
                       umfpack_zi_solve, umfpack_zi_symbolic, umfpack_zi_transpose,
                       umfpack_zi_triplet_to_col, umfpack_zl_col_to_triplet, umfpack_zl_defaults,
                       umfpack_zl_free_numeric, umfpack_zl_free_symbolic, umfpack_zl_get_lunz,
                       umfpack_zl_get_numeric, umfpack_zl_numeric, umfpack_zl_report_control,
                       umfpack_zl_report_info, umfpack_zl_report_numeric,
                       umfpack_zl_report_symbolic, umfpack_zl_scale, umfpack_zl_solve,
                       umfpack_zl_symbolic, umfpack_zl_transpose, umfpack_zl_triplet_to_col)


# Variables with simple values

UMFPACK_2BY2_NWEAK = 51
UMFPACK_2BY2_NZDIAG = 55

UMFPACK_2BY2_NZ_PA_PLUS_PAT = 54

UMFPACK_2BY2_PATTERN_SYMMETRY = 53

UMFPACK_2BY2_TOLERANCE = 12
UMFPACK_2BY2_UNMATCHED = 52

UMFPACK_A = 0
UMFPACK_Aat = 2
UMFPACK_AGGRESSIVE = 19

UMFPACK_ALLOC_INIT = 6

UMFPACK_ALLOC_INIT_USED = 73

UMFPACK_ALL_LNZ = 77
UMFPACK_ALL_UNZ = 78

UMFPACK_AMD_DENSE = 14

UMFPACK_At = 1

UMFPACK_BLOCK_SIZE = 4

UMFPACK_COL_SINGLETONS = 56

UMFPACK_COMPILED_FOR_MATLAB = 9

UMFPACK_COMPILED_IN_DEBUG_MODE = 11

UMFPACK_COMPILED_WITH_BLAS = 8
UMFPACK_COMPILED_WITH_GETRUSAGE = 10

UMFPACK_COMPRESSED_PATTERN = 63

UMFPACK_CONTROL = 20
UMFPACK_COPYRIGHT = 'UMFPACK:  Copyright (c) 2005-2009 by Timothy A. Davis.  All Rights Reserved.\n'
UMFPACK_DATE = 'May 20, 2009'

UMFPACK_DEFAULT_2BY2_TOLERANCE = 0.01

UMFPACK_DEFAULT_AGGRESSIVE = 1

UMFPACK_DEFAULT_ALLOC_INIT = 0.7

UMFPACK_DEFAULT_BLOCK_SIZE = 32

UMFPACK_DEFAULT_DENSE_COL = 0.2
UMFPACK_DEFAULT_DENSE_ROW = 0.2

UMFPACK_DEFAULT_DROPTOL = 0
UMFPACK_DEFAULT_FIXQ = 0

UMFPACK_DEFAULT_FRONT_ALLOC_INIT = 0.5

UMFPACK_DEFAULT_IRSTEP = 2

UMFPACK_DEFAULT_PIVOT_TOLERANCE = 0.1

UMFPACK_DEFAULT_PRL = 1
UMFPACK_DEFAULT_SCALE = 1
UMFPACK_DEFAULT_STRATEGY = 0

UMFPACK_DEFAULT_SYM_PIVOT_TOLERANCE = 0.001

UMFPACK_DENSE_COL = 2
UMFPACK_DENSE_ROW = 1

UMFPACK_DIAG_PREFERRED = 32

UMFPACK_DROPTOL = 18

UMFPACK_ERROR_argument_missing = -5

UMFPACK_ERROR_different_pattern = -11

UMFPACK_ERROR_file_IO = -17

UMFPACK_ERROR_internal_error = -911

UMFPACK_ERROR_invalid_matrix = -8

UMFPACK_ERROR_invalid_Numeric_object = -3

UMFPACK_ERROR_invalid_permutation = -15

UMFPACK_ERROR_invalid_Symbolic_object = -4

UMFPACK_ERROR_invalid_system = -13

UMFPACK_ERROR_n_nonpositive = -6

UMFPACK_ERROR_out_of_memory = -1

UMFPACK_FIXQ = 13
UMFPACK_FLOPS = 42

UMFPACK_FLOPS_ESTIMATE = 22

UMFPACK_FORCED_UPDATES = 74

UMFPACK_FRONT_ALLOC_INIT = 17

UMFPACK_INFO = 90
UMFPACK_IRSTEP = 7

UMFPACK_IR_ATTEMPTED = 81
UMFPACK_IR_TAKEN = 80

UMFPACK_L = 4
UMFPACK_Lat = 8

UMFPACK_Lat_P = 6

UMFPACK_LICENSE_PART1 = '\nUMFPACK License:\n\n   UMFPACK is available under alternate licenses,\n   contact T. Davis for details.\n\n   Your use or distribution of UMFPACK or any modified version of\n   UMFPACK implies that you agree to this License.\n\n   This library is free software; you can redistribute it and/or\n   modify it under the terms of the GNU General Public\n   License as published by the Free Software Foundation; either\n   version 2 of the License, or (at your option) any later version.\n\n   This library is distributed in the hope that it will be useful,\n   but WITHOUT ANY WARRANTY; without even the implied warranty of\n   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU\n   General Public License for more details.\n\n   You should have received a copy of the GNU General Public\n   License along with this library; if not, write to the Free Software\n   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301\n   USA\n'
UMFPACK_LICENSE_PART2 = '\n   Permission is hereby granted to use or copy this program under the\n   terms of the GNU GPL, provided that the Copyright, this License,\n   and the Availability of the original version is retained on all copies.\n   User documentation of any code that uses this code or any modified\n   version of this code must cite the Copyright, this License, the\n   Availability note, and "Used by permission." Permission to modify\n   the code and to distribute modified code is granted, provided the\n   Copyright, this License, and the Availability note are retained,\n   and a notice that the code was modified is included.\n'
UMFPACK_LICENSE_PART3 = '\nAvailability: http://www.cise.ufl.edu/research/sparse/umfpack\n\n'

UMFPACK_LNZ = 43

UMFPACK_LNZ_ESTIMATE = 23

UMFPACK_Lt = 7

UMFPACK_Lt_P = 5

UMFPACK_LU_ENTRIES = 64

UMFPACK_MAIN_VERSION = 5

UMFPACK_MAX_FRONT_NCOLS = 50

UMFPACK_MAX_FRONT_NCOLS_ESTIMATE = 30

UMFPACK_MAX_FRONT_NROWS = 49

UMFPACK_MAX_FRONT_NROWS_ESTIMATE = 29

UMFPACK_MAX_FRONT_SIZE = 48

UMFPACK_MAX_FRONT_SIZE_ESTIMATE = 28

UMFPACK_N2 = 58
UMFPACK_NCOL = 16

UMFPACK_NDENSE_COL = 10
UMFPACK_NDENSE_ROW = 8

UMFPACK_NEMPTY_COL = 11
UMFPACK_NEMPTY_ROW = 9

UMFPACK_NOFF_DIAG = 76

UMFPACK_NROW = 1

UMFPACK_NUMERIC_COSTLY_REALLOC = 62

UMFPACK_NUMERIC_DEFRAG = 60
UMFPACK_NUMERIC_REALLOC = 61
UMFPACK_NUMERIC_SIZE = 40

UMFPACK_NUMERIC_SIZE_ESTIMATE = 20

UMFPACK_NUMERIC_TIME = 65
UMFPACK_NUMERIC_WALLTIME = 75

UMFPACK_NZ = 2
UMFPACK_NZDIAG = 35
UMFPACK_NZDROPPED = 79

UMFPACK_NZ_A_PLUS_AT = 34

UMFPACK_OK = 0
UMFPACK_OMEGA1 = 82
UMFPACK_OMEGA2 = 83

UMFPACK_ORDERING_AMD = 1
UMFPACK_ORDERING_COLAMD = 0
UMFPACK_ORDERING_GIVEN = 2
UMFPACK_ORDERING_USED = 19

UMFPACK_PATTERN_SYMMETRY = 33

UMFPACK_PEAK_MEMORY = 41

UMFPACK_PEAK_MEMORY_ESTIMATE = 21

UMFPACK_PIVOT_TOLERANCE = 3

UMFPACK_PRL = 0

UMFPACK_Pt_L = 3

UMFPACK_QFIXED = 31

UMFPACK_Q_Uat = 12
UMFPACK_Q_Ut = 11

UMFPACK_RCOND = 67

UMFPACK_ROW_SINGLETONS = 57

UMFPACK_RSMAX = 70
UMFPACK_RSMIN = 69
UMFPACK_SCALE = 16

UMFPACK_SCALE_MAX = 2
UMFPACK_SCALE_NONE = 0
UMFPACK_SCALE_SUM = 1

UMFPACK_SIZE_OF_ENTRY = 7
UMFPACK_SIZE_OF_INT = 4
UMFPACK_SIZE_OF_LONG = 5
UMFPACK_SIZE_OF_POINTER = 6
UMFPACK_SIZE_OF_UNIT = 3

UMFPACK_SOLVE_FLOPS = 84
UMFPACK_SOLVE_TIME = 85
UMFPACK_SOLVE_WALLTIME = 86

UMFPACK_STATUS = 0
UMFPACK_STRATEGY = 5

UMFPACK_STRATEGY_2BY2 = 2
UMFPACK_STRATEGY_AUTO = 0
UMFPACK_STRATEGY_SYMMETRIC = 3
UMFPACK_STRATEGY_UNSYMMETRIC = 1
UMFPACK_STRATEGY_USED = 18

UMFPACK_SUBSUB_VERSION = 0

UMFPACK_SUB_VERSION = 4

UMFPACK_SYMBOLIC_DEFRAG = 12

UMFPACK_SYMBOLIC_PEAK_MEMORY = 13

UMFPACK_SYMBOLIC_SIZE = 14
UMFPACK_SYMBOLIC_TIME = 15
UMFPACK_SYMBOLIC_WALLTIME = 17

UMFPACK_SYMMETRIC_DMAX = 39
UMFPACK_SYMMETRIC_FLOPS = 37
UMFPACK_SYMMETRIC_LUNZ = 36
UMFPACK_SYMMETRIC_NDENSE = 38

UMFPACK_SYM_PIVOT_TOLERANCE = 15

UMFPACK_S_SYMMETRIC = 59

UMFPACK_U = 10
UMFPACK_Uat = 14

UMFPACK_UDIAG_NZ = 66

UMFPACK_UMAX = 72
UMFPACK_UMIN = 71
UMFPACK_UNZ = 44

UMFPACK_UNZ_ESTIMATE = 24

UMFPACK_Ut = 13

UMFPACK_U_Qt = 9

UMFPACK_VARIABLE_FINAL = 47

UMFPACK_VARIABLE_FINAL_ESTIMATE = 27

UMFPACK_VARIABLE_INIT = 45

UMFPACK_VARIABLE_INIT_ESTIMATE = 25

UMFPACK_VARIABLE_PEAK = 46

UMFPACK_VARIABLE_PEAK_ESTIMATE = 26

UMFPACK_VER = 5004
UMFPACK_VERSION = 'UMFPACK V5.4.0 (May 20, 2009)'

UMFPACK_WARNING_determinant_overflow = 3
UMFPACK_WARNING_determinant_underflow = 2

UMFPACK_WARNING_singular_matrix = 1

UMFPACK_WAS_SCALED = 68

# no functions
# no classes
