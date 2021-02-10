function GryMat = Sig2Gry(raw)
    [cfs, ~] = cwt(raw);
    imagesc(abs(cfs));
    F = getframe(gca);
    IMG = imresize(F.cdata, [64 64]);
    close
    GryMat = rgb2gray(IMG);
end

