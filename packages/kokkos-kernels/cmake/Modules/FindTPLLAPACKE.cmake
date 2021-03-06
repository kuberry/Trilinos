IF (NOT LAPACKE_ROOT)
  SET(LAPACKE_ROOT $ENV{LAPACKE_ROOT})
ENDIF()
IF (NOT LAPACKE_ROOT)
  SET(LAPACKE_ROOT $ENV{OPENBLAS_ROOT})
ENDIF()
IF (LAPACKE_LIBRARIES)
  #we were given the exact list of libraries to find
  KOKKOSKERNELS_FIND_IMPORTED(LAPACKE INTERFACE
    LIBRARIES ${LAPACKE_LIBRARIES}
    LIBRARY_PATHS ${LAPACKE_LIBRARY_DIRS}
    HEADERS lapacke.h
    HEADER_PATHS ${LAPACKE_INCLUDE_DIRS})
ELSE()
  #we need to find one of the valid versions from the list below
  KOKKOSKERNELS_FIND_IMPORTED(LAPACKE
    LIBRARY lapacke openblas
    LIBRARY_PATHS ${LAPACKE_LIBRARY_DIRS}
    HEADERS lapacke.h
    HEADER_PATHS ${LAPACKE_INCLUDE_DIRS})
ENDIF()
