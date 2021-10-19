clear
load('FaceNonFace.mat')

face = X(:,1);
face = reshape(face,19,19);

nonface = X(:,5);
nonface = reshape(nonface,19,19);

imagesc(nonface);