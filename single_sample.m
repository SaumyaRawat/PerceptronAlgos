function[res] = single_sample(X,init_wts,eta)
	[no_of_samples,dim] = size(X);
	a = init_wts;
	prev_a = zeros(1,dim);
	check = ones(no_of_samples,1); % if misclassified * check = 0 then all are correctly classified
	theta = 0.005;
	misclassified = 1
	k =1
	counter = 0

	while(1)
		misclassified = 0;
		while(k<=no_of_samples)
			counter = counter + 1
			Y = X(k,:);
			if a*Y' <0							%'
				prev_a = a;
				a = a + (eta.*Y);
				misclassified = 1;
				counter = 0;
				disp (Y)
				break;
			end
			k = mod(k+1,no_of_samples);
			if k == 0
				k=14;
			end
			if (counter==14&&misclassified==0)
				break;
			end
		end
		if ((pdist([a;prev_a])<theta)||(misclassified==0))
			break;
		end
	end
	res = a;
end


