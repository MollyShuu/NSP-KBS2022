function trainNetN=local_purterbation(trainNet,nfrac,alpha)
trainNetN=trainNet;
degree=sum(trainNetN,2);
degree_alpha=degree.^alpha;
degreeProd=degree_alpha+degree_alpha';
node_num=length(degree);
index_x=randsample(node_num,1);
del_edge_num=0;

while del_edge_num<=nfrac
    while degree(index_x)==0
        index_x=randsample(node_num,1);
    end

    thissum=trainNetN(index_x,:)*degreeProd(index_x,:)';

    weight=(trainNetN(index_x,:).*degreeProd(index_x,:))/thissum;
    weight=full(weight');
    weight(isnan(weight))=0;
    weight(isinf(weight))=0;

    index_y=randsample(1:length(weight), 1, true, weight);
    trainNetN(index_x,index_y)=0;
    trainNetN(index_y,index_x)=0;
    degree(index_x)=degree(index_x)-1;
    degree(index_y)=degree(index_y)-1;
    
    degree_alpha(index_x)=degree(index_x).^alpha;
    degree_alpha(index_y)=degree(index_y).^alpha;
    degreeProd=degree_alpha+degree_alpha';

    index_x=index_y;
    del_edge_num=del_edge_num+1;
end


