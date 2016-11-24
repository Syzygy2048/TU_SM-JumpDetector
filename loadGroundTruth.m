function [filenames, hands, feet, empty, jump1, jump2] = loadGroundTrush
  [numarr, txtarr, rawarr] = xlsread('dataset/ground-truth.xlsx',-1);

  filenames = strcat('dataset/', rawarr([2:end],2));
  hands = rawarr([2:end],3);
  feet = rawarr([2:end],4);
  empty = rawarr([2:end],5);

  numarr(isnan(numarr)) = 0;
  jump1 = datestr(numarr(:,6),'MM:SS');
  jump2 = datestr(numarr(:,7),'MM:SS');

end