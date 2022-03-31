%-- Log from MATLAB Model.

Output_Vec = round(Output_Vector.data(46:10000).*2^7);

file_Input_Signal1 = fopen('\Examples\AM_Modulation\AM_Modulation_MATLAB\Output_Vec.txt','w');

for i = 1:length(Output_Vec)
    fprintf(file_Input_Signal1,'%d\r\n',Output_Vec(i));
end;

fclose(file_Input_Signal1);

%%

%-- Log from MATLAB Model and VHDL simulation.

file_Output_Signal_1 = fopen('\Examples\AM_Modulation\AM_Modulation_MATLAB\Output_Vec.txt');
Output_Vec_Sig = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_2 = fopen('\Examples\AM_Modulation\AM_Modulation_MATLAB\Output_Vec_HDL.txt');
Output_Vec_Sig_HDL = fscanf(file_Output_Signal_2 , '%d');
fclose(file_Output_Signal_2);



plot(Output_Vec_Sig(2000:2499))
hold
plot(Output_Vec_Sig_HDL(2052:2502), 'ro')
legend('MATLAB - Fixed-Point','VHDL - Fixed-Point')