
%% Implement : %%%%%%%%%%%%%%%%%%%%%%%
%% Single-sample perceptron
%% Single-sample perceptron with margin
%% Relaxation algorithm with margin
%% Widrow-Hoff or Least Mean Squared  LMS  Rule
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


C1 = [2, 7; 8, 1; 7, 5;  6, 3 ;  7, 8 ;  5, 9 ;  4, 5 ];   			%% class +1
C2 = [ 4, 2 ;  -1, -1 ;  1, 3 ;  3, -2 ;  5, 3.25 ;  2, 4 ;  7, 1  ]; 		%% class -1

[X,org_X] = preprocess(C1,C2);
[no_of_samples, dim] = size( X );

%% Single Sample

init_wts = [(1/no_of_samples) * ones(1,dim)];
eta = 0.0005;
res = single_sample(X,init_wts,eta);
[class1,class2] = classify(org_X,res,no_of_samples,dim);

%% Batch Sample

init_wts = [(1/no_of_samples) * ones(1,dim)];
eta = 0.0005;
margin = 0.05
res = batch_sample(X,init_wts,eta,margin);
