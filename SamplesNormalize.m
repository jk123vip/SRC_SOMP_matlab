function fea = SamplesNormalize(fea)

[nDim nSmp] = size(fea);

  for i=1:nSmp
      fea(:,i) = fea(:,i)/norm(fea(:,i));
  end

end