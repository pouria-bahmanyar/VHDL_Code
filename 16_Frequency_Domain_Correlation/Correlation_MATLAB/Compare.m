%-- Input vectors.

a = rand(128,1)';
b = circshift(a',10)';


%%


%-- Log from MATLAB Model.

Input_Vec_a = Input_A.data(1:128).*2^7;
Input_Vec_b = Input_B.data(1:128).*2^7;
Output_Vec = Correlation_Output1.data(1:128).*2^7;

file_Input_Signal1 = fopen('\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Input_Vec_a.txt','w');
file_Input_Signal2 = fopen('\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Input_Vec_b.txt','w');
file_Input_Signal3 = fopen('\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Output_Vec.txt','w');

for i = 1:length(Input_Vec_a)
    fprintf(file_Input_Signal1,'%d\r\n',Input_Vec_a(i));
    fprintf(file_Input_Signal2,'%d\r\n',Input_Vec_b(i));
    fprintf(file_Input_Signal3,'%d\r\n',Output_Vec(i));
end;

fclose(file_Input_Signal1);
fclose(file_Input_Signal2);
fclose(file_Input_Signal3);


%%

%-- Log from MATLAB Model and VHDL simulation.

file_Output_Signal_1 = fopen('\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Output_Vec.txt');
Output_Vec_Sig = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_2 = fopen('\Examples\40_Frequency_Domain_Correlation\Correlation_MATLAB\Output_Vec_HDL.txt');
Output_Vec_Sig_HDL = fscanf(file_Output_Signal_2 , '%d');
fclose(file_Output_Signal_2);



plot(Output_Vec_Sig(1:128))
hold
plot(Output_Vec_Sig_HDL(1:128), 'ro')
legend('MATLAB - Fixed-Point','VHDL - Fixed-Point')