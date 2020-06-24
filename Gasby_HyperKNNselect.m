function[A1, An, B1, Bn] = Gasby_HyperKNNselect(B,n)
%This function calculates KNN score Distance with k=1 (A1) and KNN scores
%Distance with k=n for a specific dataset(B). Once found the KNN scores
%distance of samples, it calculates the good candidates to be included in
%the dataset B: B1, good candidates evaluated for KNN score Distance with
%k=1 and Bn good candidates evaluated for KNN score Distance with k=n. The
%good candidates are calculated with the local minima of KNN score Distance. 
% 
% INPUTS:
% % B= dataset; 
% % n= number of replicates for each class in dataset B.
% OUTPUTS: 
% % A1= KNN Distance with k=1 is equivalent to the Nearest
% % Neighbor Distance described in the ASTM standard D6122-06 % "Standard
% % Practice for Validation of the Performance of Multivariate % Process
% % Infrared Spectrophotometers" Section A3 Outlier Detection Methods %
% % sub-section A3.4 Nearest Neighbor Distance.
% % An= KNN Distance with k=n
% 
% Copyright 2020 @ Riccardo Gasbarrone (riccardo.gasbarrone@uniroma1.it)
% 
% 
s=length(B);
%Calculate KNN score distance for vector A with k
%KNN Calculation is based on Knnscoredistance

A1=knnscoredistance(B,1); %KNN score Distance with k=1 
An=knnscoredistance(B,n); %KNN score Distance with k=n 
A1_r=A1
An_r=An
%uncomment the two following lines if you want to round digits
% A1_r=round(A1, 3);
% An_r=round(An, 3);

 % calculate local minima of KNN score Distance with k=1 
 b1 = islocalmin(A1_r, 'FlatSelection', 'first');
%repeat row n times

 % calculate local minima of KNN score Distance with k=n 
 bn = islocalmin(An_r, 'FlatSelection', 'first');


FComp=b1==bn; 
%Compare the two logic vector of minima values

B1=B(b1) 
%select data based on the good candidates evaluated for KNN Distance with
%k=1
Bn=B(bn) 
%select data based on the good candidates evaluated for KNN Distance with
%k=n
end
