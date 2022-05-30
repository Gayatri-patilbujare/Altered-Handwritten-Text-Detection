
%% ALTERED HANDWRITTEN TEXT DETECTION 
matt=[];
k=1;
src = dir('D:\Pen Drive Backup\Lokesh\ICPR_FDC_Croped_dataset\ICPR_FDC_Croped_dataset\ICPR TWO CLass\*.jpg');
for i = 1 : length(src)
filename = strcat('/MATLAB Drive/Ten Class problem\',src(i).name);
 
    I= imread(filename);
    I1=imresize(I,[350,350]);
    Gray=rgb2gray(I1);
    se=strel('disk',3);
    Id=imclose(Gray,se);

%%   Extraction of HOG Features
%    [HG,visualization]= extractHOGFeatures(I1);
%    matt(k,:)=[f2];
%    k=k+1;

%%    Extraction of LBP Features
%     LB=extractLBPFeatures(Id,'NumNeighbor',10,'CellSize',[8 8]);
%     matt(k,:)=[f1];
%     k=k+1;
    
%%     Extraction of STATISTICAL Features
%     db=double(Id);
%     f1=mean(skewness(db(:)));
%     f2=mean(kurtosis(db(:)));
%     f3=mean(std(db(:)));
%     f4=mean(db);
%     f5=var(db);

% %   Store the Features in matt file 
%     matt(k,:)=[f1,f2,f3,f4,f5];
%     k=k+1;
% %     
    
 %% Fusion of Features HOG+LBP+STATISTICAL
    [HOG,visualization]= extractHOGFeatures(I1);
    LBP=extractLBPFeatures(Id,'NumNeighbor',8,'CellSize',[8 8]);
    db=double(Id);
    f1=mean(skewness(db(:)));
    f2=mean(kurtosis(db(:)));
    f3=mean(std(db(:)));
    f4=mean(db);
    f5=var(db);
    matt(k,:)=[HOG,LBP,f1,f2,f3,f4,f5];
    k=k+1;
end

Xall= matt;
%% Labeling of Images
% forgedata={'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';
% 'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';
% 'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';
% 'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';
% 'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';'Blur';
% 'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';
% 'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';
% 'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';
% 'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';
% 'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';'CopyPaste';
% 'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';
% 'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';
% 'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';
% 'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';
% 'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';'CPBlur';
% 'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';
% 'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';
% 'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';
% 'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';
% 'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';'CPIns';
% 'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';
% 'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';
% 'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';
% 'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';
% 'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';'CPNoise';
% 'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';
% 'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';
% 'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';
% 'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';
% 'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';'InsBlur';
% 'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';
% 'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';
% 'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';
% 'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';
% 'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';'Ins';
% 'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';
% 'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';
% 'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';
% 'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';
% 'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';'InsNoise';
% 'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';
% 'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';
% 'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';
% 'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';
% 'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';'Noise';
% 'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';
% 'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';
% 'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';
% 'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';
% 'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';'Normal';};
%     

%% Assign all the labels to Yall variable
Yall=forgedata;

%% Classification using different classifiers.

  Mdl= fitctree(Xall,Yall);
% Mdl=fitcecoc(Xall,Yall);
% Mdl=fitcnb(Xall,Yall);
% Mdl=fitcnb(Xall,Yall);
% Mdl=fitcdiscr(Xall,Yall);
% Mdl=fitcknn(Xall,Yall,'NumNeighbor',3);
% Mdl=fitcdiscr(Xall,Yall);

predictedLabelall = predict(Mdl,Xall);
[Rall,order] = confusionmat(predictedLabelall,Yall)

%% Calculate accuracy
acc=trace(Rall);
Accuracy=(acc/500)*100

