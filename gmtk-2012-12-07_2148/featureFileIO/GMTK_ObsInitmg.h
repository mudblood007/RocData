#ifndef GMTK_OBSINITMG_H
#define GMTK_OBSINITMG_H

#include "GMTK_FileSource.h"

void initmg(FileSource *obs_mat,
	    FILE *out_fp,
	    Range& srrng,
	    Range& cfrrng,
	    const char *pr_str,
	    const int num_clusters,
	    const int maxReInits,
	    const int minSamplesPerCluster,
	    const int numRandomReStarts,
	    const bool quiet_mode,
	    const float conv_thres);

#endif
