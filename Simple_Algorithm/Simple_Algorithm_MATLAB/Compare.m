%-- Log from MATLAB Model.

Input_Vec = round(Input_Vector.data(46:10000).*2^13);
Output_Vec = round(Output_Vector.data(46:10000).*2^13);

file_Input_Signal1 = fopen('\Examples\Simple_Algorithm\Simple_Algorithm_MATLAB\Input_Vec.txt','w');
file_Input_Signal2 = fopen('\Examples\Simple_Algorithm\Simple_Algorithm_MATLAB\Output_Vec.txt','w');

for i = 1:length(Input_Vec)
    fprintf(file_Input_Signal1,'%d\r\n',Input_Vec(i));
    fprintf(file_Input_Signal2,'%d\r\n',Output_Vec(i));
end;

fclose(file_Input_Signal1);
fclose(file_Input_Signal2);

%%

%-- Log from MATLAB Model and VHDL simulation.

file_Output_Signal_1 = fopen('\Examples\Simple_Algorithm\Simple_Algorithm_MATLAB\Output_Vec.txt');
Output_Vec_Sig = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_2 = fopen('\Examples\Simple_Algorithm\Simple_Algorithm_MATLAB\Output_Vec_HDL.txt');
Output_Vec_Sig_HDL = fscanf(file_Output_Signal_2 , '%d');
fclose(file_Output_Signal_2);



plot(Output_Vec_Sig(2000:2499))
hold
plot(Output_Vec_Sig_HDL(2003:2502), 'ro')
legend('MATLAB - Floating-Point','VHDL - Fixed-Point')