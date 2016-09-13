function[res] =  relaxation_margin(X,init_wts,eta,margin,no_of_samples,dim)
		k = 1;
		a = init_wts;
		Yk = [1];
		while(size(Yk)~=[0,0])
			Yk = [];
			j = 1;
			while(j~=no_of_samples+1)
				y = X(j,:);
				if a*y'<=margin
					Yk = [Yk;y];
				end
				j = j+1;
			end
			prev_a = a;
			term = 0;
			for i=1:size(Yk,1)
				y = Yk(i,:);
				term = term + ((margin- (a*y')) / norm(y) ) *y;
			end
			a = prev_a + (eta*term);
			k = k+1;
		end
		res = a;
end