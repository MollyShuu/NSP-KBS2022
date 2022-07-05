function [ net ] = FormNet( linklist )
%% ���������б�linklist�����������ڽӾ���net
    %---- ���ڵ��Ŵ�0��ʼ�������нڵ��ż�1��matlab���±��1��ʼ��
    if ~all(all(linklist(:,1:2)))
        linklist(:,1:2) = linklist(:,1:2)+1;
    end
    
    %----������ͼ����������Ԫ����Ϊ1
    linklist(:,3) = 1;
    net = spconvert(linklist);
    nodenum = length(net);
    net(nodenum,nodenum) = 0;                               
    % �˴�ɾ���Ի����Խ�ԪΪ0�Ա�֤Ϊ����
    net = net-diag(diag(net));
    net = spones(net + net'); 
    % ȷ���ڽӾ���Ϊ�Գƾ��󣬼���Ӧ����������
end 
% ת�������ڽӾ���ffff