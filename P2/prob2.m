[Tc0,Tc1,Tc7,target] = readData();
input = [ones(291,1),[Tc0;Tc1;Tc7]];
d = size(input,1);
size(input);
layer1 = 65;
layer2 = 14;
layer3 = 2;

Wij = rand(1)*ones(layer1,layer2);
Wjo = zeros(1,layer2);
Yj = zeros(1,layer2);

Wjk = rand(1)*ones(layer2+1,layer3);
Wko = zeros(1,layer3);
Zk = zeros(d,layer3);

Tc = zeros(length(input),2);

for i=1:length(Tc1)
    Tc(i,1) = 1;
    Tc(i,2) = 0;
end

for i=length(Tc1)+1:length(Tc1)+length(Tc7)
    Tc(i,1) = 0;
    Tc(i,2) = 1;
end

for i=length(Tc1)+length(Tc7)+1:length(Tc1)+length(Tc7)+length(Tc0)
    Tc(i,1) = 1;
    Tc(i,2) = 1;
end

no_of_epochs = 200;

theta = 8.045;
eta = 0.5;
r = 0;


for index = 1:no_of_epochs
       %% Backpropagation Training

        %Forward Pass - Feed Forward Operation
	for t = 1:d
		netj = zeros(1,layer2);
	      	for j=1:layer2
	            	for i=1:layer1
	                		netj(j) = netj(j) + (Wjo(j) + (input(t,i) * Wij(i,j))); %% net j
	            	end
	            	Yj(j) = sigmf(netj(j),[-1,0]); %%Yj 
	        	end
	        	Yj = [1 Yj]; %Adding the bias weights input

	        	netk = zeros(1,layer3);
		for k=1:layer3
			for j=1:layer2+1
		                netk(k) = netk(k) + (Wko(k) + Yj(j)*Wjk(j,k));  %% net k
		            end
			Zk(t,k) = sigmf(netk(k),[-1,0]); %% Zk
		end

		%%%% Update rule
	            for j=1:layer2
	            	for k=1:layer3
	                		Wjk(j,k) = Wjk(j,k) + eta*(Tc(t,k)-Zk(t,k))*Zk(t,k)*Yj(j);
	            	end
	        	end
	        
	        	for i=1:layer1
	            	for j=1:layer2
	            		term = 0;
	                		for k=1:layer3
	                    			term = term + Wjk(j,k)*(Tc(t,k)-Zk(t,k))*(Zk(t,k));
	                		end
	            		Wij(i,j) = Wij(i,j) + eta*input(t,i)*Yj(j)*term;	
	            	end
	        	end
	end
	%disp(index);
	error =0.5*norm(Tc-Zk);
	error
	if(error<theta)
		break;
	end
end
save('nn.mat');
		    	        
	     


%%while(1)
%%	r = r+1;
%%	m = 0;
%%	while(m~=n)
%%		m =  m + 1;
%%		xm = select_pattern(input);
%%		dwij = dwij + eta*delta_j(j)*i ;
%%		dwjk = dwjk + eta*delta_k(k)*yj;
%%		if m == n
%%			break;
%%		end
%%		wij = wij + dwij ; wjk = wjk + dwjk;
%%	end
%%	if(norm(w)<theta)
%%		break;
%%	end
%%end
