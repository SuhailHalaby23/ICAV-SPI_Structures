% function forces = matrixmult(k_1,k_2,k_0,span,mass,)
% 

airfoil=readmatrix("lednicerdatfile.txt");
airfoil=airfoil(2:end,:);

A=PolygonMoments(airfoil,[],0);

%Setting up the constants
Mass=0.2;
k_1=500;
k_2=500;
k_0=500;

%Generating Matrices
Mass_matrix = [Mass,Mass,A.MAx;Mass,Mass,A.MAy;A.MAx,A.MAy,A.Ixy];

Spring_matrix=[k_1,0,0;0,k_2,0;0,0,k_0];

C=zeros(3,3);


%
[X,e,s]=polyeig(Spring_matrix,C,Mass_matrix);


%Modal spring and mass used for the linear ODEs
k=X'*Spring_matrix*X
m=X'*Mass_matrix*X


