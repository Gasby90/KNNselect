# KNNselect
This repository contains MATLAB functions allowing the selection of samples based on the minimum of the average distance to the k-Nearest Neighbors in score space.
The functions included in the repository are based on the 'Knnscoredistance.m' function that calculates the average distance to the k-Nearest Neighbors in score space. he KNN distance provides an estimate of how unique a sample in the score space of a model (https://wiki.eigenvector.com/index.php?title=Knnscoredistance). High distance indicates samples which may have high leverage and/or are otherwise unique in the score space. k = number of neighbors to which distance should be calculated and averaged over. 

What does it 'Gasby_KNNselect.m' do? It calculates KNN scores distances for k=1 and k=n then calculates the minimum every n samples (i.e. replicated). Once the minima of the KNN distance with K = 1 and the minima of the KNN distance with K = n on the data set have been calculated, it uses the logical vectors obtained to select the data (i.e. if the i-th sample is a minimum among the n samples is then included in the dataset, alternatively the sample is excluded). The function selects the most significant samples from the n replicates. Please note: it is recommended to use this function if the dataset is sorted in column in order to have the replicates close together. Samples must be ordered.

What does 'Gasby_HyperKNNselect.m' do? It calculates the KNN distance for K = 1 and K = n, then calculates the local minima for the whole dataset. Once the minima of the KNN distance with K = 1 and the minima of the KNN distance with K = n have been calculated, it uses the logical vectors obtained to select the data (i.e. if the i-th sample is a local minimum it is included alternatively the sample is excluded).  Please note: it is recommended to use this function for removing outliers. The function selects the most significant samples within the entire data set.

Functions were thought for working within MATLAB® 2020 and with the toolbox PLS_toolbox ver. 8.2 (Eigenvector Inc).

[![DOI](https://zenodo.org/badge/274704246.svg)](https://zenodo.org/badge/latestdoi/274704246)
