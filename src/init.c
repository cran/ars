/*
File auto-generated with the following R code:
tools::package_native_routine_registration_skeleton("/home/pperez/ars")
*/

#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* .C calls */
extern void initial_(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void sample_(void *, void *, void *, void *, void *, void *, void *);

static const R_CMethodDef CEntries[] = {
    {"initial_", (DL_FUNC) &initial_, 13},
    {"sample_",  (DL_FUNC) &sample_,   7},
    {NULL, NULL, 0}
};

void R_init_ars(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}

