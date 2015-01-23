function [S, IndexAtom] = SOMP(X, B, K)
% Input:
% X - samples matrix, one sample each column, with unit norm
% B - dictionary, each column with unit norm
% K - spasity degree
% Output:
% S - sparse coding matrix

% 

global BtB;

BtX = B'*X;% ‘§º∆À„
% initial

[numDim numBase] = size(B);
numSmp = size(X,2);
S = sparse(numBase, numSmp);

R = X;
IndexAtom = [];

% main loop

for k = 1:K
    
    % project residual onto dictioanry and select atom as arg max
    [val IndexAtom(k)] =  max(max(abs(R'*B),[],1)); % inf norm

    % Orthogonal projection on the subspace spanned by all previously selected atoms

    Bk = B(:,IndexAtom);
    P =  BtB(IndexAtom,IndexAtom)\BtX(IndexAtom,:); % (Bk'*Bk)\Bk'*X; % pinv(Bk)*X;%
%P =  invChol_mex(BtB(IndexAtom,IndexAtom))*BtX(IndexAtom,:);
% P = inv1(BtB(IndexAtom,IndexAtom))*BtX(IndexAtom,:);
% P = MatrixInverse(BtB(IndexAtom,IndexAtom))*BtX(IndexAtom,:);
    
    % update residual
    
    R = X - Bk*P;
    %

end

S(IndexAtom,:) = P;

end