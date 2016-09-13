function[res] = batch_sample(X,init_wts,eta,margin)
	[no_of_samples,dim] = size(X);
	a = init_wts;
	prev_a = zeros(1,dim);
	%misclassified = ones(1,no_of_samples); % assuming all are misclassified
	check = ones(no_of_samples,1); % if misclassified * check = 0 then all are correctly classified
	theta = 0.005;
	misclassified = 1

	while(1)
		misclassified = 0;
		for k = 1:no_of_samples
			Y = X(k,:);
			if a*Y' < margin							%'
				prev_a = a;
				a = a + (eta.*Y);
				misclassified = 1;
				disp (Y)
				break;
			end
		end
		if ((pdist([a;prev_a])<theta)||(misclassified==0))
			break;
		end
	end
	res = a;
end


