function [a result]=worddictionary(text,stopword);
save azz text stopword
a=struct('word',[],'count',[]);          
a(1).word=lower(text);                   
k=1;
result=[];
flag=0;

for i=1:length(a(1).word)
    for j=1:length(stopword)
         if strcmp(a(1).word{i},stopword{j})==1
             flag=1;
         end
     end
    if flag==0;
    result{k}=a(1).word{i};
    k=k+1;
    end
    flag=0;
end

k=1;s=[];
for i=1:length(result)
   s{k}=porterStemmer(result{i});
   k=k+1;
end

a(2).word=s;
for i=1:length(s)
    a(2).count(i)=1;         
end

for i=1:length(s)
    for j=(i+1):length(s)
        if (strcmp(a(2).word{i},a(2).word{j})==1)&&(a(2).count(i)~=0)
            a(2).count(i)=a(2).count(i)+1;
            a(2).count(j)=0;
        else
            continue;
        end
    end
end

k=1;
for i=1:length(a(2).word)                  
    if a(2).count(i)~=0
        a(3).word{k}=a(2).word{i};
        a(3).count(k)=a(2).count(i);
        k=k+1;
    else
        continue;
    end
end
 save re result a

