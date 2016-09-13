function[class1,class2] = classify(X,a,no_of_samples,dim)
	class1=[];
	class2=[];
	for i=1:no_of_samples
		val=X(i,:)*a(1:dim)';
		if val >= 0
			class1 = [ class1; X(i,:) ];
		else
			class2 =  [ class2; X(i,:) ];
	end
end
