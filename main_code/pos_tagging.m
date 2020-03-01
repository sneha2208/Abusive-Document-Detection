%% Function to run Stanford POS Tagger on the input document
function [result_string] = pos_tagging(tagger, input_doc)

	% The imports are a one time requirement, and add no overhead.
	import java.io.*;
	import edu.stanford.nlp.tagger.maxent.MaxentTagger;
    % ============================== read and pre-process the input text file for tagging =====================================
    % read the whole file to a temporary cell array
    fid = fopen(input_doc,'rt');
    sentences = textscan(fid,'%s','Delimiter', {'\n', '.'});
    fclose(fid);
    % concatenate sentences cell array across dimension 1 in order to flatten the array
    sentences_flattened = cat(1, sentences{:});        
    % remove empty elements
    sentences_flattened_no_empty = sentences_flattened(~cellfun(@isempty, sentences_flattened));
    % =================================== tag the input text file by using the tagger =======================================
	result = java.util.ArrayList();
    % loop through all sentences in the input document
    for i = 1:length(sentences_flattened_no_empty)
            str = sentences_flattened_no_empty{i};
        	sentences = MaxentTagger.tokenizeText(StringReader(str));       
           for j = 1:size(sentences)
                tSentence = tagger.tagSentence(sentences.get(j-1));
                result.addAll(tSentence);
            end
    end
% ===================================== convert result java object to a Matlab cell array of strings =====================================
% result must be converted to a java string before being converted to a cell array
% result_string is a Matlab cell array (cell array of strings). This step is required for writing the cell array to an output text file.
result_string = cell(result.toString());
end