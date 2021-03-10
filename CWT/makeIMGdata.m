function makeIMGdata(tmp, name)
mkdir(name)
cd(name)
mkdir Wake
mkdir Sleep
mkdir Apnea
for i = 1:length(tmp)
    grymat = Sig2Gry(tmp(i).ECG);
    if tmp(i).lab == "Wake"
        cd Wake\
        imwrite(grymat, append(name, '_', string(i), '.jpg'));
        cd ..
    elseif tmp(i).lab == "Sleep"
        cd Sleep\
        imwrite(grymat, append(name, '_', string(i), '.jpg'));
        cd ..
    elseif tmp(i).lab == "Apnea"
        cd Apnea\
        imwrite(grymat, append(name, '_', string(i), '.jpg'));
        cd ..
    else
        disp("Error")
    end
end
cd ..
end

