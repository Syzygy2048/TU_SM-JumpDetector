clear
close all

[filename, hands, feet, empty, jump1, jump2] = loadGroundTruth();

path = filename(1,:);
video = loadVideo(path);
