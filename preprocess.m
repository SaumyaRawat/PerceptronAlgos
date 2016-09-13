%% Creates an augmented feature of class 1 and class 2
function[X,org_X] = preprocess(c1,c2)
	org_X = [c1;c2];
	X =  [c1 ,  ones( 1,size(c1,1) )' ];
	X =  [ X; -c1 , -ones( 1,size(c2,1) )' ];
end