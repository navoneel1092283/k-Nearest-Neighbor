function [predict,ytest,mtest,k]=traintest(X1,y,m,n,data)
	% data = load('test.txt');
	Xtest = data(:,1:n);
	ytest = data(:, n+1);
	[mtest,abc] = size(ytest);
	for i=1:mtest
		[predict(i),k(i)]=kNN(X1,Xtest(i,:),y,m,n);
	end;
	k=max(k);
end



