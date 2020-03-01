clc;
clear all;
close all;
%% 
final_feature=[];



[filename filepath]=uigetfile('*.txt','select input text file');
final_path=strcat(filepath,filename);

badword=wordseppp(final_path);




save badword badword

