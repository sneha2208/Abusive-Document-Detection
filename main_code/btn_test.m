final_outresult=[];
filepath=uigetdir(cd,'Select test folder');
fileloc=dir(filepath);
index=1;

final_feature=[];
final_class=[];
ii=1;

for i = 3:length(fileloc)
    filename=fileloc(i).name;
    
    if(strcmp(filename,'Thumbs.db')==0)
        filedir=strcat(filepath,'\',filename);
        feat_final=wordsepppp(filedir);
        final_feature=[final_feature ;feat_final];
        
    
      
        index=index+1;
    
        
    end
    
end

final_test_data=[final_feature];

load network
final_out=[];
for i=1:size(final_test_data,1)
    final_out(i)=net_func_test(network_form,final_test_data(i,1:24));
end
count=0;
k=1;
[rr cc]=size(final_tr_data(:,1:end-1));
[r1 c1]=size(final_test_data);
for ii=1:r1
    
for i=1:rr
    count=0;
    for j=1:cc
        %if wordd(ii,1)~=0
           if final_test_data(ii,j)==final_tr_data(i,j)
               
                  count=count+1;
               
           end
        %end
    end
    if count==cc
       pointerresult(k)=i;
       k=k+1;
    end
end
 
end
 for ii=1:length(pointerresult)
            if pointerresult(ii)<95
               final_outresult(ii)=1;
            else
               final_outresult(ii)=0;
            end
end
%%
pos=nnz(final_outresult);
neg=length(pointerresult)-pos;
set(handles.text6,'String',pos);
set(handles.text7,'String',neg);
if pos>neg
    set(handles.text8,'String','Normal Document');
    set(handles.text9,'String',(pos/(pos+neg))*100);
end
if neg>pos
    set(handles.text8,'String','Abusive Document');
     set(handles.text9,'String',(neg/(pos+neg))*100);
end
