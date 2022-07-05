function [output_args] = interlayer_link_prediction_CN(lay1_linklist,filename_lay2,filename_lay1_2_rela,theknown_rate,krIntval,thereptime)
precesionN=30;
lay2_linklist=textread(filename_lay2);
lay1_2_relation=textread(filename_lay1_2_rela);
lay1_linklist=FormNet(lay1_linklist);
lay2_linklist=FormNet(lay2_linklist);
lay1_node_num=size(lay1_linklist,1);
lay2_node_num=size(lay2_linklist,2);
lay1_degree(:,1)=1:size(lay1_linklist,1);
lay2_degree(:,1)=1:size(lay2_linklist,1);
lay1_degree(:,2)=full(sum(lay1_linklist,2));
lay2_degree(:,2)=full(sum(lay2_linklist,2));

lay1_2_relation1=lay1_2_relation;
lay1_2_relation1(:,3)=lay1_degree(lay1_2_relation(:,1),2);
lay1_2_relation1(:,4)=lay2_degree(lay1_2_relation(:,2),2);
lay1_2_relation1(:,5)=lay1_2_relation1(:,3).*lay1_2_relation1(:,4);
row=find(lay1_2_relation1(:,5)==0);
lay1_2_relation(row,:)=[];
clear lay1_2_relation1;
lay1_2_relation1=lay1_2_relation;

lay1_degree(:,2)=lay1_degree(:,2)+1;
lay2_degree(:,2)=lay2_degree(:,2)+1;

repetitiontimes=1;
for experi_times=1:1:repetitiontimes
    lay1_2_relation=lay1_2_relation(:,1:2);
    lay1_2_relation(:,3)=lay1_2_relation1(:,thereptime+2);
    
    precisionN_rate=zeros(precesionN,size(theknown_rate,2));
    map_rate=zeros(1,size(theknown_rate,2));
    
    for known_rate=theknown_rate
        tic
        for testlabel=known_rate*100
            kno_num=0;
            unkno_num=0;
             lay1_2_rela_kno=zeros(lay1_node_num,2);
             lay1_2_rela_unkno=zeros(lay2_node_num,2);
            for i=1:size(lay1_2_relation)
                if lay1_2_relation(i,3)<=testlabel
                   kno_num=kno_num+1;
                   lay1_2_rela_kno(kno_num,1)=lay1_2_relation(i,1);
                   lay1_2_rela_kno(kno_num,2)=lay1_2_relation(i,2);
                else
                   unkno_num=unkno_num+1;
                   lay1_2_rela_unkno(unkno_num,1)=lay1_2_relation(i,1);
                   lay1_2_rela_unkno(unkno_num,2)=lay1_2_relation(i,2);
                end
            end
            lay1_2_rela_kno=lay1_2_rela_kno(1:kno_num,1:2);
            lay1_2_rela_unkno=lay1_2_rela_unkno(1:unkno_num,1:2);

            lay1_2_rela_kno(:,3)=1:kno_num;
            lay1_kno_new_oldID=lay1_2_rela_kno(:,[3,1]);
            lay2_kno_new_oldID=lay1_2_rela_kno(:,[3,2]);
            lay1_unkno_new_oldID(:,1)=1:(size(lay1_linklist,1)-kno_num);
            lay1_unkno_new_oldID(:,2)=setdiff(lay1_degree(:,1),lay1_kno_new_oldID(:,2)); 
            lay2_unkno_new_oldID(:,1)=1:(size(lay2_linklist,1)-kno_num);
            lay2_unkno_new_oldID(:,2)=setdiff(lay2_degree(:,1),lay2_kno_new_oldID(:,2)); 
            lay1_unkno_new_oldID(:,3)=lay1_degree(lay1_unkno_new_oldID(:,2),2);
            lay2_unkno_new_oldID(:,3)=lay2_degree(lay2_unkno_new_oldID(:,2),2);
            lay2_kno_new_oldID_sortnew=sortrows(lay2_kno_new_oldID,1);
            lay1_unkno_kno_spmat_list=lay1_linklist(lay1_unkno_new_oldID(:,2),lay1_kno_new_oldID(:,2));
            lay2_kno_unkno_spmat_list=lay2_linklist(lay2_kno_new_oldID_sortnew(:,2),lay2_unkno_new_oldID(:,2));

            disp('layer1 spmat times layer2 spmat')
            lay1_times_lay2=lay1_unkno_kno_spmat_list*lay2_kno_unkno_spmat_list;
            
            size_lay1_2_rela_unkno=size(lay1_2_rela_unkno,1);
            
            rank=zeros(unkno_num,1);
            thisturn_patN=zeros(precesionN,1);
            [~,sortloc]=sort(lay1_times_lay2,2,'descend');
            for i=1:1:size_lay1_2_rela_unkno
                loci=find(lay1_unkno_new_oldID(:,2)==lay1_2_rela_unkno(i,1));
                locj=find(lay2_unkno_new_oldID(:,2)==lay1_2_rela_unkno(i,2));
                rank(loci)=find(sortloc(loci,:)==locj);
            end
            row=find(rank(:,1)==0);
            rank(row,:)=[];
            thisturn_patN(1)=size(find(rank==1),1)/size_lay1_2_rela_unkno;
            for pi=2:1:precesionN
                thisturn_patN(pi)=thisturn_patN(pi-1)+size(find(rank==pi),1)/size_lay1_2_rela_unkno;
            end

            map=0;
            for mapi=1:1:size_lay1_2_rela_unkno
                m_i=1/rank(mapi);
                map=map+m_i;
            end
            map=map/size_lay1_2_rela_unkno;
            
            precisionN_rate(:,int8(known_rate/krIntval))=precisionN_rate(:,int8(known_rate/krIntval))+thisturn_patN(:,1);
            map_rate(1,int8(known_rate/krIntval))=map;
        
            clear thisturn_patN;
            clear temp_sort;
            clear sortloc;
            clear rank;
            clear lay1_2_rela_kno;
            clear lay1_2_rela_unkno;
            clear lay1_kno_new_oldID;
            clear lay1_times_lay2;
            clear lay1_unkno_kno_spmat_list;
            clear lay1_unkno_new_oldID;
            clear lay2_kno_new_oldID;
            clear lay2_kno_new_oldID_sortnew;
            clear lay2_kno_unkno_spmat_list;
            clear lay2_unkno_new_oldID;
        end       
    end
end

output_args.patN=precisionN_rate;
output_args.map=map_rate;


