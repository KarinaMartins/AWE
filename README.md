AWE
===

This repository contains files to replicate Anna Di Rienzo's analysis that studied Environmental correlations 
that highlighted the adaptations in the Human Genome. The population set considered is the Africa and Western 
Eurasia subset of the population set used. It aims to highlight the variations within these populations and 
present the results with more clarity.

The folder bin contains the code to:
* Convert ADR input to bayenv input for 10k randomly selected SNPs. *bayenv* doesn't support more than that data.
* Get the covariance matrix(/ces) from the input. via *bayenv*
* Get the correlation matrix from the covariance matrix as a heatmap
* Take the mean covariance matrix for further analysis
* Get the SNPfiles for the data in **bayenv** input format
* Get the environment file from the available data in bayenv format
* Use *bayenv* to obtain the bayes' factors from the covariance matrix, SNPfiles and environment file.

The follwing code is yet to be generated. 
* Converting bayes factors to get the transformed rank statistics (empirical p-value)
* Comparison of the bf's from our results to the ones provided in dbCLINE.
* Comparison of the transformed rank statistics to dbCLINE.
