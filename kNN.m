function [final,k]=kNN(X1,X,y,m,n)
	k=1;
	a1=0;
	a0=0;
	% Calculating distance matrix
	for i=1:m
		s=0;
		for j=1:n
			s=s+(X(j)-X1(i,j))^2;
		end;
		dis(i)=s^0.5;
	end;
	index=min(dis);
	major2=find(dis==index);
	c=(size(major2))(1);
	if(c>1)
		% 1) c=2 with different classes [RECURSIVE CALL REQUIRED]
		% 2) c=2 with same class
		% 3) c>2 
		if(c==2)
			y1=y(major2(2));
			y2=y(major2(1));
			% Same Class:
			if(y1==y2)
				final=y1;
			% Different Class:
			else
				k=k+1;
				[final,k]=recursive(dis,k,y,m,index);
			end;
		else
			% c>2
			for j=1:c
				if(y(major2(j))==1)
					a1=a1+1;
				else
					a0=a0+1;
				end;
			end;
			if(a1>a0)
				final=1;
			else
				final=0;
			end;
		end;
	else
		if(y(major2(1))==1)
			final=1;
		else
			final=0;
		end;
	end;
end




		




