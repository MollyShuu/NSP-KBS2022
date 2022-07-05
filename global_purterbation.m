function result=global_purterbation(lastNet,nfrac,alpha)
trainNetN=lastNet;
for i=1:nfrac
    degree=sum(trainNetN,2);
    degree=degree.^alpha;
    degreeProd=degree+degree';
    degreeProd=degreeProd.*trainNetN;
    [row,col,weight]=find(tril(degreeProd,-1));
    weight(find(isnan(weight)))=0;
    weight(find(isinf(weight)))=0; 
    weight=weight./sum(weight);
    ind=randsample(1:length(weight), 1, true, weight);
    if trainNetN(row(ind),col(ind))==0
        ind=randsample(1:length(weight), 1, true, weight);
    end
    trainNetN(row(ind),col(ind))=0;
    trainNetN(col(ind),row(ind))=0;
end
result=trainNetN;
