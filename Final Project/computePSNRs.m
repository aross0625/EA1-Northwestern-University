function PSNRs = computePSNRs(imgVec, imageDatabase)

maxImg = max(imgVec);

PSNRs = [];
for ii = 1:size(imageDatabase,2)
    if(maxImg > max(imageDatabase(:,ii)))
        PSNR1 = calcPSNR(imgVec, imageDatabase(:,ii), maxImg);
    else
        PSNR1 = calcPSNR(imgVec, imageDatabase(:,ii), max(imageDatabase(:,ii)));
    end
    PSNRs = [PSNRs PSNR1];
end