%% Script to pass a text file to the tagger function and save the tagged output as a text file
% The imports are a one time requirement, and add no overhead.
import java.io.*;
import edu.stanford.nlp.tagger.maxent.*;
% ============================================ initialize the tagger ====================================================
% This initializtion is expensive. It is better to create the tagger once and then reuse it.
% The file path in the argument is for search in javaclasspath. Relative to the current directory,
% It looks for the specified file in javaclasspath .jar files hierarchically
tagger = MaxentTagger('./english-left3words-distsim.tagger');
% =========================================== call the tagger function ==================================================
file_path = 'C:\temp';
file_name = 'untagged_doc.txt';
file_name = fullfile(file_path, file_name);
tagged_doc = pos_tagging(tagger, file_name);
% ======================================== save the tagged output to a file ===============================================
file_path = 'C:\temp';
file_name = 'tagged_doc.txt';
fid = fopen(fullfile(file_path, file_name), 'w');
fprintf(fid, '%s\n', tagged_doc{:});
fclose(fid);
fprintf('=================================== Completed =======================================\n');