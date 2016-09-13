% input samples
no_of_samples = 14
dim = 2
X1=[1,2,7;1,8,1;1,7,5;1,6,3;1,7,8;1,5,9;1,4,5];   % class '+1'
X2=[ 1,4, 2;1, -1, -1;1, 1, 3;1, 3, -2;1, 5, 3.25;1, 2, 4;1, 7, 1]; % class '-1'
X=[X1;X2];

% output class [-1,+1];
Y=[-ones(1,7),ones(1,7)];

% init weigth vector
w=[.5 , .5,.5 , .5,.5 , .5,.5 , .5,.5 , .5,.5 , .5,.5 , .5 ]';

% call perceptron
wtag=perceptron(X,Y,w);
% predict
ytag=wtag'*X;


% plot prediction over origianl data
figure;hold on
plot(X1(1,:),X1(2,:),'b.')
plot(X2(1,:),X2(2,:),'r.')

plot(X(1,ytag<0),X(2,ytag<0),'bo')
plot(X(1,ytag>0),X(2,ytag>0),'ro')
legend('class -1','class +1','pred -1','pred +1')