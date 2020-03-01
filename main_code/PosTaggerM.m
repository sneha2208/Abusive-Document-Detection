function result = PosTaggerM(str)
	
	% The imports are probably a one time requirement, and add no overhead.
	import java.io.*;
	import edu.stanford.nlp.tagger.maxent.MaxentTagger;

	%
	% This initializtion is expensive.
        % It is better to create the tagger once and then reuse it.
	%
	tagger = MaxentTagger('./english-left3words-distsim.tagger');
	result = java.util.ArrayList();
	sentences = MaxentTagger.tokenizeText(StringReader(str));
	for ii = 1:size(sentences)
		tSentence = tagger.tagSentence(sentences.get(ii-1));
		result.addAll(tSentence);
	end
end