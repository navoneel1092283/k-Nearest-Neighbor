function [final,k]=recursive(dis,k,y,m,index)
	l=1;
	for i=1:m
		if(dis(i)>index)
			d(l)=dis(i);
			l=l+1;
		end;
	end;
	if(l>1)
		index=min(d);
		major2=find(dis==index);
		c=(size(major2))(1);
		if(c>1)
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
				for j=1:c
					if (y(major2(j))==1)
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
	else
		disp(sprintf('KNN fails!!!!!'));
		final=0;
		k=0;
	end;
end




