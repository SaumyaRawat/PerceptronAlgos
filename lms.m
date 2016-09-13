function[a] = lms(X,a,b,theta,eta,no_of_samples,dim)
	k = 1;
	while(1)
		k = mod(k+1,no_of_samples);
		if k==0
			k = 14;
		end
		Yk = X(k,:);
		Bk = b(k);
		term = (eta*(Bk - a*Yk')*Yk);
		a = a + term;
		if term'<theta
			break
		end
	end
end