close all;
clear;
clc;
load Indiana_16class.mat;
load IndexNeighbors\IndexNeighbors9x9.mat;

% πÊ∑∂ªØ 
fea = SamplesNormalize(fea);

[IndexTrainSet, IndexTestSet] = findlabel2(0.1,labels);


Xl = fea(:,IndexTrainSet);
Yl = labels(IndexTrainSet);

num_test = length(IndexTestSet);
num_train = length(IndexTrainSet);

S = sparse(num_train, num_test);
predict_label = zeros(1,num_test);
B = Xl;

h_waitbar = waitbar(0);

global BtB; BtB = B'*B; % ‘§º∆À„


tic;
for j = 1:num_test
  
    T = 30; 
    Xg =  fea(:,[IndexTestSet(j) IndexNeighbors{IndexTestSet(j)}]);

    [Sg, indSet] = SOMP(Xg, B, T);
    
    S(:,j) = Sg(:,1);
    
    predict_label(j) = assign_label_group(B(:,indSet),Sg(indSet,:),Xg,Yl(indSet));
    
   if mod(j,100)==0 waitbar(j/num_test, h_waitbar, num2str(j/num_test)); 
   end 
end
toc;
test_accuracy = sum(predict_label==labels(IndexTestSet))/num_test;

