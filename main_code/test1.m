clc
clear all
close all
%% 

[filename filepath]=uigetfile('*.txt','select input text file');
final_path=strcat(filepath,filename);
file_id=fopen(final_path);
% file_data=textread(final_path,'%s')';
tline = fileread(final_path);
fclose(file_id);
disp(tline);