%% EXPERIMENTS GMM DATA SET 
% Requiered: CVX toolbox from http://cvxr.com/cvx/
% Requiered:  MONQP  from http://asi.insa-rouen.fr/enseignants/~arakoto/toolbox/

run /Users/jorgeluisguevaradiaz/Documents/GITProjects/cvx/cvx_startup.m
addpath ./SVM-KM/
addpath ./datasets/
addpath ./experiments/
addpath ./models/
addpath ./kernels/
addpath ./utils/
addpath ./output/

%Point-based group anomaly detection
%--------------
N=300;
percentAnomalies=10;
experimentsGADGMM(1,percentAnomalies,N)
experimentsGADGMM(2,percentAnomalies,N)
experimentsGADGMM(3,percentAnomalies,N)
experimentsGADGMM(4,percentAnomalies,N)


%Distribution-based group anomaly detection
%------------
N=300;
percentAnomalies=10;
experimentsGADGMM(5,percentAnomalies,N)


%% EXPERIMENTS SLOAN DATA SET

experimentSloan(1)
experimentSloan(2)
experimentSloan(3)



