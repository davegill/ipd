
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <err.h>
#include <sysexits.h>

#include "fcall.h"

int
ipd_fcall(const char *scheme, void *sink)
{
	void *hdl = NULL;
	void (*f_ptr)(void *) = NULL;
	int i = 0;
	int n = 0;
	char scheme_lc[128]  = {0};
	char scheme_cap[128] = {0};
	char *error = NULL;

	/* Generate the scheme cap function name */
	n = strlen(scheme);
	for (i=0; i < n; ++i) {
		scheme_lc[i] = tolower(scheme[i]);
	}

	snprintf(scheme_cap, 128, "%s_%s", scheme_lc, "cap");

	/* Open a handle to ourself */
	hdl = dlopen(NULL, RTLD_NOW);
	if (!hdl) {
		errx(EX_SOFTWARE, "%s", dlerror());
	}

	*(void **) (&f_ptr) = dlsym(hdl, scheme_cap);
	if ((error = dlerror()) != NULL)  {
		errx(EX_SOFTWARE, "%s", error);
	}

	/* Call the schemes cap subroutine */
	f_ptr(sink);

	dlclose(hdl);

	return(EXIT_SUCCESS);
}


