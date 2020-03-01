function wordsep = wordseppp(final_path)


file_id=fopen(final_path);
file_data=fread(file_id, 'uint8')';
fclose(file_id);

%%
% takes a vector containing numeric values in the range [0,255] and 
% converts these values as a stream of 8-bit bytes to Unicode characters. 
% The stream of bytes is assumed to be in the MATLAB default character 
% encoding scheme. Return value unicodestr is a char vector that has the 
% same general array shape as bytes.
code_data=native2unicode(file_data);
code_data=code_data(:);
code_data=double(code_data);
code_data=code_data';
save sdsd
%sentence
seperate=zeros(200,200);
index=1;
j=1;
k=1;
m=1;
for i=3:length(code_data)
if code_data(m)==32&&code_data(m+1)==0
index=index+1;
j=1;
cout(k)=code_data(m);
k=k+1;
m=m+2;
else
seperate(index,j)=code_data(m);
j=j+1;
m=m+1;
end
if m==length(code_data)
break;
end
if m==length(code_data)+1
break;
end
end

% %word
% %global seperate;
wordsep=zeros(200,200);
[r c]=size(seperate);
ind=1;
h=1;
for i=1:r
for j=1:c
if seperate(i,j)~=0
if seperate(i,j)~=10
if seperate(i,j)~=32
wordsep(ind,h)=seperate(i,j);
h=h+1; 
else
ind=ind+1; 
h=1;
end 
end
end
end
end
save abcs
% 

