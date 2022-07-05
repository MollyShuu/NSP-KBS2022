clear;
etastep=1;%delta eta
etaVect=-20:etastep:20;%the value of eta
xistep=0.02;%delta xi
xifrac=0:xistep:0.4;% the value of xi
known_rate=0.9;% the percentage of observed interlayer links
knownInterval=0.9;

for thereptime=1:1:10 % Taking the experiments ten times.
    for dataset=[1,2,3,4]
        if dataset==1
            fname='TF_full';
        elseif dataset==2
            fname='TF_zf';
        elseif dataset==3
            fname='Higgs_FSMT_deg5';
        else
            fname='Higgs_FSRT_deg5';
        end
        for premethod=[2,1]% Choosing the interlayer link prediction algorithms. Taking 1 to choose CN and taking 2 to choose IDP.
            for edgedeletemethod=[1,2]% Choosing the perturbation strategy. Taking 1 to choose the global perturbation strategy and taking 2 to choose the local perturbation strategy.
                get_result(fname,etaVect,xistep,xifrac,known_rate,knownInterval,thereptime,premethod,edgedeletemethod,etastep)
            end
        end
    end
end

