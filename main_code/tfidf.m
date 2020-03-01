function [count,tf,idf,weight]=tfidf(docs,term)


Ldocs=length(docs);
Lterm=length(term); 
tf=zeros(Ldocs,Lterm);
idf=zeros(1,Lterm);
count=zeros(Ldocs,Lterm);
wordnum=[];
weight=zeros(Ldocs,Lterm);

%empty character vector
p=' '; 

for i=1:Ldocs
    doc=cell2mat(docs(i)); %merging cells to an ordinary array
    tabnum=find(doc==p);
    Ltab=length(tabnum);
    wordnum(i)=Ltab+1;
    k=1;
    for j=1:Ltab  
    word=doc(k:tabnum(j)-1);
    Lw=length(word);
    fword=doc((tabnum(Ltab)+1):length(doc));
    Lfw=length(fword);
        for jj=1:Lterm
            aterm=cell2mat(term(jj));
            Lat=length(aterm);
            if Lat==Lw||Lat==Lfw
                if strcmpi(word,aterm);
                    count(i,jj)=count(i,jj)+1;
                end
            end
        end
     k=tabnum(j)+1;
    end
end


Numdocs=Ldocs;

for i=1:Lterm
    tt=find(count(:,i)==0);
    df(i)=Numdocs-length(tt);
end

idf=log(Numdocs./(df+0.01));

for i=1:Ldocs
    tf(i,:)=count(i,:)./wordnum(i);
    weight(i,:)=100*tf(i,:).*idf;
    
end



    
        







    