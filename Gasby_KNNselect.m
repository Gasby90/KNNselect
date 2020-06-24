function[A1, An, B1, Bn] = Gasby_KNNselect(B,n)
%This function calculates KNN score Distance with k=1 (A1) and KNN scores
%Distance with k=n for a specific dataset(B), based on the number of
%replicates (n) for eachclass do you have. Once found the KNN scores
%distance of samples, it calculates the good candidates to be included in
%the dataset B: B1, good candidates evaluated for KNN score Distance with
%k=1 and Bn good candidates evaluated for KNN score Distance with k=n. The
%good candidates are calculated on the minimum KNN score Distance of each
%class. 
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
s=length(B);
%Calculate KNN score distance for vector A with k
%KNN Calculation is based on Knnscoredistance

A1=knnscoredistance(B,1); %KNN Distance with k=1 
An=knnscoredistance(B,n); %KNN Distance with k=n 
A1_r=A1
An_r=An
%uncomment the two following lines if you want to round digits
% A1_r=round(A1, 3);
% An_r=round(An, 3);

s1=length(A1_r);
 % calculate min every n values
b1 = arrayfun(@(i) min(A1_r(i:i+n-1)),1:n:s1-n+1)'; 
% the minima vector of KNN Distance with k=1
u1 = repelem(b1,n); 
%repeat row n times
Comp1=u1==A1_r; 
%logic vector: returns true if the sample is a good candidate for k=1

sn=length(An_r);
 % calculate min every n values
bn = arrayfun(@(i) min(An_r(i:i+n-1)),1:n:sn-n+1)'; 
% the minima vector of KNN Distance with k=n
un = repelem(bn,n); 
%repeat row n times
Compn=un==An_r; 
%logic vector: returns true if the sample is a good candidate for k=n

FComp=Comp1==Compn; 
%Compare the two logic vector of KNN Distance with k=1 and KNN Distance
%with k=n

B1=B(Comp1) 
%select data based on the good candidates evaluated for KNN Distance with
%k=1
Bn=B(Compn) 
%select data based on the good candidates evaluated for KNN Distance with
%k=n


boxplot(B)
legend
xlabel('Sample')
ylabel('Magnitude')
pbaspect([2 1 1])

figure
plot(A1, 'MarkerSize', 4, 'Marker','o', 'LineStyle', 'none')
ylabel('KNN score distance')
% xticks=(0:n:s)
% xticklabels(B.classid{1})

xlabel('Sample')
hold on

plot(An, 'MarkerSize', 4, 'Marker','*','LineStyle', 'none' )
pbaspect([2 1 1])

legend('KNN Distance (k=1)','KNN Distance with k=n')
set(gca,'FontSize',12); 


hold off

end
