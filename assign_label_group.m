function label_pre = assign_label_group(B,Wg,Xg,Yl)

E = unique(Yl);
numClass = length(E);
residuals=zeros(numClass,1);
%
for i = 1:numClass
    
    inx =find(Yl==E(i));
    Wg2 = Wg(inx,:);
    B2 = B(:,inx);

    residuals(i) = norm((Xg - B2*Wg2),2);
end
%
[~, inx] = min(residuals);
label_pre = E(inx);
end