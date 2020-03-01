# Abusive-Document-Detection

Abusive Document Detection is a natural language processing task that deals with
finding whether any kind of abusive words (i.e. related to religion, sex, racism, etc) are
present in a given document and classify the document accordingly. The target of
abusive document detection is to give output classification for a document provided by
a user using a neural network. The idea is to propose an efficient system which will
identify offensive words in sentences of the document and based on the frequency the
system will classify the document. In this approach, classification is done by the neural
network. Sentences are pre-classified (abusive or non-abusive) as labelled data. Labeled
data is trained first and unlabelled data is tested later. The input text files are selected
from different domains like reviews, comments, feedback, etc. Newcf function is used
for network creation and sim function is used for simulation of this network. Cascade
forward back propagation neural network is used for training the network which is
considered as good algorithm for classification. Performance is determined with the
help of plot perform function.

Keywords: Natural Language Processing (NLP), Abusive Document Detection (ADD),
Artificial Intelligence (AI), Neural Networks (NN), Machine Learning (ML).
