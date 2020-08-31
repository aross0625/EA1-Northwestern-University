function minPos = findMinimumErrorPosition(imgVec, imageDatabase)

Vector1 = [];
for ii = 1:size(imageDatabase,2)
   MSE = calcMSE(imgVec, imageDatabase(:,ii));
   Vector1 = [Vector1 MSE];
end
[~, index] = ismember(min(Vector1), Vector1);
minPos = index;