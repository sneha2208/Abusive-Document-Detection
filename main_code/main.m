function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 09-Apr-2018 11:27:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc;


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filepath=uigetdir(cd,'Select train folder');
fileloc=dir(filepath);
indexx=1;
final_data_feat=[];
final_feature=[];
final_class=[];
class=1;
ii=1;

for i = 3:length(fileloc)
    filename=fileloc(i).name;
    
    if(strcmp(filename,'Thumbs.db')==0)
        final_path=strcat(filepath,'\',filename)

file_id=fopen(final_path);
file_data=fread(file_id, 'uint8')';
fclose(file_id);

%%

code_data=native2unicode(file_data);
code_data=code_data(:);
code_data=double(code_data);
code_data=code_data';

%sentence
seperate=zeros(180,100);
index=1;
j=1;
k=1;
m=3;
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
end

% %word
% %global seperate;
wordsep3=zeros(1,1000);
[r c]=size(seperate);
ind=1;
h=1;
for i=1:r
    for j=1:c
        if seperate(i,j)~=0
            if seperate(i,j)~=13
                if seperate(i,j)~=10
               wordsep3(ind,h)=seperate(i,j);
               h=h+1; 
               
            
            else
            ind=ind+1; 
            h=1;
                end
            end
        end
    end
end

final_feature(indexx,1:length(wordsep3)+1)=[wordsep3 1];
% final_class(indexx,class)=class;
final_data_feat=[final_feature];
indexx=indexx+1;
    
        
end
    
end
abusive=indexx-1;
class=2;
filepath=uigetdir(cd,'Select train folder');
fileloc=dir(filepath);


ii=1;

for i = 3:length(fileloc)
    filename=fileloc(i).name;
    
    if(strcmp(filename,'Thumbs.db')==0)
        final_path=strcat(filepath,'\',filename)

file_id=fopen(final_path);
file_data=fread(file_id, 'uint8')';
fclose(file_id);

%%

code_data=native2unicode(file_data);
code_data=code_data(:);
code_data=double(code_data);
code_data=code_data';

%sentence
seperate=zeros(180,100);
index=1;
j=1;
k=1;
m=3;
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
end

% %word
% %global seperate;
wordsep3=zeros(1,1000);
[r c]=size(seperate);
ind=1;
h=1;
for i=1:r
    for j=1:c
        if seperate(i,j)~=0
            if seperate(i,j)~=13
                if seperate(i,j)~=10
               wordsep3(ind,h)=seperate(i,j);
               h=h+1; 
               
            
            else
            ind=ind+1; 
            h=1;
                end
            end
        end
    end
end
final_feature(indexx,1:length(wordsep3)+1)=[wordsep3 2];
% final_class(indexx,class)=class;
final_data_feat=[final_feature];
indexx=indexx+1;


end
    
end
normal=indexx-1;
save dben final_data_feat abusive normal;
% 
msgbox('Database created');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tline final_path file_dataa
[filename filepath]=uigetfile('*.txt','select input text file');
final_path=strcat(filepath,filename);
file_id=fopen(final_path);
file_dataa=fread(file_id, 'uint8')';
fclose(file_id);
file_id=fopen(final_path);
tline = fileread(final_path);
fclose(file_id);
msgbox('File Selected');
set(handles.edit1, 'String', tline);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tline final_path file_data data
file_data=textread(final_path,'%s')';
set(handles.edit1, 'String', file_data);
count1=length(file_data);
save count1 count1

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file_data a
stopword=textread('stopwords.txt','%s');
save stop stopword
[a result]=worddictionary(file_data,stopword);
a2=a(2).word;
set(handles.edit1, 'String', result);
count2=length(result);
save count2 count2


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tline final_path file_data file_dataa
final_feature=[];
badword=textread('badwords.txt','%s');
file_data=file_data;
tline={tline};
badwordss=badword';
[count,tf,idf,weight]=tfidf(tline, badwordss);

% file_id=fopen(final_path);
% file_data=fread(file_id, 'uint8')';
% fclose(file_id);
%% 

[aa resultt]=worddictionary1(file_data,badword);
count3=length(resultt);
save count3 count3

%%

code_data=native2unicode(file_dataa);
code_data=code_data(:);
code_data=double(code_data);
code_data=code_data';

%sentence
seperate=zeros(180,100);
index=1;
j=1;
k=1;
m=3;
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
end

% %word
% %global seperate;
wordsep=zeros(1,1000);
[r c]=size(seperate);
ind=1;
h=1;
for i=1:r
    for j=1:c
        if seperate(i,j)~=0
            if seperate(i,j)~=13
                if seperate(i,j)~=10
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
save test wordsep
msgbox('Done')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load dben
load test
network_form=net_func_create(final_data_feat);
final_out=net_func_test(network_form,wordsep);

count=0;
k=1;
[rr cc]=size(final_data_feat(:,1:end-1));
[r1 c1]=size(wordsep);
for ii=1:r1
    
for i=1:rr
    count=0;
    for j=1:cc
        %if wordd(ii,1)~=0
            h=final_data_feat(i,1:end-1);
            h1=wordsep(1,:); 
            
%           h=imhist(h);
%           h1=imhist(h1);
            hd3(i,:) = sqrt(sum((h-h1).^2));
            

    end
    
end
[val pos]=sort(hd3);
% [val pos]=sort(sum1);
end
save qq val pos
msgbox('Done')



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load qq
load dben
load count1
load count2
load count3

if pos(1)<abusive && pos(1)>0 && count3>0
    disp('abusive')
    set(handles.text6,'String','Abusive Document');
    set(handles.text41,'String',(count3/(count1))*100);
    set(handles.text42,'String',count3);
else
    disp('normal')
    set(handles.text6,'String','Normal Document');
    set(handles.text41,'String',(count3/(count1))*100);
    set(handles.text42,'String',count3);
%     set(handles.text9,'String',(count3/(count1))*100);
end

x=[count1, count2, count3];
figure,
bar(x);






