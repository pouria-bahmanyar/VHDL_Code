%-- Log from MATLAB Model.

Output_Vec = round(MAF_Output.data(1:10000).*2^13);

file_Input_Signal1 = fopen('\Examples\50_Moving_Average_Filter\Moving_Average_Filter_MATLAB\Output_Vec.txt','w');

for i = 1:length(Output_Vec)
    fprintf(file_Input_Signal1,'%d\r\n',Output_Vec(i));
end;

fclose(file_Input_Signal1);

%%

%-- Log from MATLAB Model and VHDL simulation.

file_Output_Signal_1 = fopen('\Examples\50_Moving_Average_Filter\Moving_Average_Filter_MATLAB\Output_Vec.txt');
Output_Vec_Sig = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_2 = fopen('\Examples\50_Moving_Average_Filter\Moving_Average_Filter_MATLAB\Output_Vec_HDL.txt');
Output_Vec_Sig_HDL = fscanf(file_Output_Signal_2 , '%d');
fclose(file_Output_Signal_2);



plot(Output_Vec_Sig(1:2000))
hold
plot(Output_Vec_Sig_HDL(5:2000), 'ro')
legend('MATLAB - Fixed-Point','VHDL - Fixed-Point')