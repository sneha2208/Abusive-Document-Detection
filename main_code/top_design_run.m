close all
clear all
clc
warning off;

%%


filepath=uigetdir(cd,'Select train folder');
fileloc=dir(filepath);
index=1;

final_feature=[];
final_class=[];
ii=1;

%% 

for i = 3:length(fileloc)
    filename=fileloc(i).name;
    
    if(strcmp(filename,'Thumbs.db')==0)
        filedir=strcat(filepath,'\',filename);
        feat_final=wordseppp(filedir);
    
      
        [r c]=size(feat_final);
        for ii=1:r
            if ii<93
               feat_final(ii,end)=1;
            else
               feat_final(ii,end)=0;
            end
        end
        final_feature=[final_feature ;feat_final];
        
    
      
        index=index+1;
    
        
    end
    
end
%%
