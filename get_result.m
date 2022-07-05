function get_result(fname,alphaVect,nStep,nfrac,known_rate,knownInterval,thereptime,premethod,edgedeletemethod,alphastep)

adj=load(['./dataset/real/' fname,'/lay1.txt']);
N=length(adj);

% make the network symmetry simple graphs
adj(N+1:2*N,1)=adj(1:N,2);
adj(N+1:2*N,2)=adj(1:N,1);
adj(1:end,3)=1;
adj=spconvert(adj);
adj=adj-diag(diag(adj));
adj(find(adj))=1;
N=length(adj);

preCNDegree=zeros(length(nfrac),length(alphaVect));
mapCNDegree=zeros(length(nfrac),length(alphaVect));

trainNet=adj;
calresult=calprecision_allmethod(fname,trainNet,known_rate,knownInterval,thereptime,premethod);
preCNDegree(1,1:length(alphaVect))=calresult.p30;
mapCNDegree(1,1:length(alphaVect))=calresult.map;
for al=1:length(alphaVect)
    alpha=alphaVect(al);
    trainNetN=trainNet;
    for i=2:(length(nfrac))
        if edgedeletemethod==1
            trainNetN=global_purterbation(trainNetN,ceil(nStep.*nnz(trainNet)/2),alpha);
        else
            trainNetN=local_purterbation(trainNetN,ceil(nStep.*nnz(trainNet)/2),alpha);
        end
        calresult=calprecision_allmethod(fname,trainNetN,known_rate,knownInterval,thereptime,premethod);
        preCNDegree(i,al)=preCNDegree(i,al)+calresult.p30;
        mapCNDegree(i,al)=mapCNDegree(i,al)+calresult.map;
    end
end

dlmwrite(['./results/' fname '_knr' mat2str(known_rate*10) '_rtime' mat2str(thereptime) '_p_pmeth' mat2str(premethod) '_dmeth' mat2str(edgedeletemethod) '_nst' mat2str(nStep*100) '_alst' mat2str(alphastep) '.txt'],preCNDegree)
dlmwrite(['./results/' fname '_knr' mat2str(known_rate*10) '_rtime' mat2str(thereptime) '_m_pmeth' mat2str(premethod) '_dmeth' mat2str(edgedeletemethod) '_nst' mat2str(nStep*100) '_alst' mat2str(alphastep) '.txt'],mapCNDegree)