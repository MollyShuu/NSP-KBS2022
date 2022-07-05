function thisans=calprecision_allmethod(Foldername,lay1Net,known_rate,knownInterval,thereptime,premethod)
for thre=1
    for m=10
        for KNRate=0.5
            for subBA=1:1:1
                  filename_lay2=['./dataset/real/' Foldername '/lay2.txt'];
                  filename_lay1_2_rela=['./dataset/real/' Foldername '/groundtruth.txt'];
                  if premethod==1
                      theans=interlayer_link_prediction_CN(lay1Net,filename_lay2,filename_lay1_2_rela,known_rate,knownInterval,thereptime);
                  elseif premethod==2
                      theans=interlayer_link_prediction_IDP_oneiter(lay1Net,filename_lay2,filename_lay1_2_rela,known_rate,knownInterval,thereptime);
                  end
                  thisans.p30=theans.patN(30,1);
                  thisans.map=theans.map;
            end
        end
    end
end


