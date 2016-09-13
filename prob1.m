
%% Implement : %%%%%%%%%%%%%%%%%%%%%%%
%% Single-sample perceptron
%% Single-sample perceptron with margin
%% Relaxation algorithm with margin
%% Widrow-Hoff or Least Mean Squared  LMS  Rule
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


C1 = [2, 7,1; 8, 1,1; 7, 5,1;  6, 3,1 ;  7, 8,1 ;  5, 9,1 ;  4, 5,1 ];   			%% class +1
C2 = [ 4, 2,1 ;  -1, -1,1 ;  1, 3 ,1;  3, -2 ,1;  5, 3.25 ,1;  2, 4 ,1;  7, 1 ,1 ]; 		%% class -1

X =[ C1;C2.*-1 ];
org_X = [C1;C2];
[no_of_samples, dim] = size( X );

%% Single Sample
figure;
plot (org_X(1:7,1), org_X(1:7,2), 'ro', org_X(7:14,1), org_X(7:14,2), 'bo','MarkerSize',10)
hold on
init_wts = [(1/no_of_samples) * ones(1,dim)];
eta = 1;
res = single_sample(X,init_wts,eta);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
plot (class1(:,1), class1(:,2), 'r*', class2(:,1), class2(:,2), 'b*');hold on;

%% plot solution a
Xpts = [1:9];
Ypts =( res(1)* Xpts + res(3) )/ res(2) ;
plot(Xpts,-Ypts)

title('Single Sample Perceptron : o - original , * - perceptron o/p ')
 
 %% Single Sample w/ margin\
figure;
plot (org_X(1:7,1), org_X(1:7,2), 'ro', org_X(7:14,1), org_X(7:14,2), 'bo','MarkerSize',10)
init_wts = [(1/no_of_samples) * ones(1,dim)];
eta = 0.0005;
margin = 0.05;
res = single_sample_margin(X,init_wts,eta,margin,no_of_samples,dim);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
plot (class1(:,1), class1(:,2), 'r*', class2(:,1), class2(:,2), 'b*')
title('Single Sample W/ MARGING Perceptron : o - original , * - perceptron o/p ')

%% Relaxation with margin
figure;
plot (org_X(1:7,1), org_X(1:7,2), 'ro', org_X(7:14,1), org_X(7:14,2), 'bo','MarkerSize',10)
init_wts = [(1/no_of_samples) * ones(1,dim)];
eta = 0.0005;
margin = 0.05;
res = relaxation_margin(X,init_wts,eta,margin,no_of_samples,dim);
[class1,class2] = classify(org_X,res,no_of_samples,dim);
plot (class1(:,1), class1(:,2), 'r*', class2(:,1), class2(:,2), 'b*')
title('Relaxation with margin: o - original , * - perceptron o/p ')
