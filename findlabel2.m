function [indices_choose,indices_remain]=findlabel2(per,labels)
%input:
%     per:每类选取的比例 ,必须在0～1之间选取
%     labels:标签 
indices_choose=[];
indices_remain=[];
Class=max(labels);
for i=1:Class
    ind=find(labels==i);
    L=length(ind);
    p=randperm(L);
    num=round(L*per);
    indices_choose=[indices_choose,ind(p(1:num))];
    indices_remain=[indices_remain,ind(p(num+1:end))];
end