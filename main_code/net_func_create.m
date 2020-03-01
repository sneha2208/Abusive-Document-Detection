function network_form=net_func_create(final_tr_data,final_tr_data1,final_tr_data2,final_tr_data3)

train_data=[final_tr_data(:,1:100)];
train_class=[final_tr_data(:,end)];

network_form=newcf(train_data',train_class',20,{'logsig'});
network_form.trainparam.epochs=1000;%no of cycles
network_form.trainparam.goal=0.01;
network_form=train(network_form,train_data',train_class');

input=train_data';
target=train_class';
