function final_out=net_func_test(network_form,final_te_data)



test_data=[final_te_data(:,1:100)];


test_data=test_data;
res_out=sim(network_form,test_data');
result_ann=round(res_out);

final_out=result_ann(1);

