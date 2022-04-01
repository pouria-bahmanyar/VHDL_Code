%-- Log from MATLAB Model.

if_input = round(if_in.data(2:280000).*2^13);
I_Signal = round(I_sig.data(2:280000).*2^13);
Q_Signal = round(Q_sig.data(2:280000).*2^13);
sqrt_sig = round(sqrt_out.data(2:280000).*2^13);
I_Dn = round(I_Down.data(2:280000).*2^13);
Q_Dn = round(Q_Down.data(2:280000).*2^13);
Noise_Mean_sig = round(Noise_Mean.data(2:280000).*2^13);


file_Input_Signal1 = fopen('\Projects\37\Digital IFM\Simulation\IF_Input.txt','w');
file_Input_Signal2 = fopen('\Projects\37\Digital IFM\Simulation\I_Sig.txt','w');
file_Input_Signal3 = fopen('\Projects\37\Digital IFM\Simulation\Q_Sig.txt','w');
file_Input_Signal4 = fopen('\Projects\37\Digital IFM\Simulation\sqrt_Sig.txt','w');
file_Input_Signal5 = fopen('\Projects\37\Digital IFM\Simulation\I_Dn.txt','w');
file_Input_Signal6 = fopen('\Projects\37\Digital IFM\Simulation\Q_Dn.txt','w');
file_Input_Signal7 = fopen('\Projects\37\Digital IFM\Simulation\Noise_Mean_sig.txt','w');

for i = 1:length(if_input)
    fprintf(file_Input_Signal1,'%d\r\n',if_input(i));
    fprintf(file_Input_Signal2,'%d\r\n',I_Signal(i));
    fprintf(file_Input_Signal3,'%d\r\n',Q_Signal(i));
    fprintf(file_Input_Signal4,'%d\r\n',sqrt_sig(i));
    fprintf(file_Input_Signal5,'%d\r\n',I_Dn(i));
    fprintf(file_Input_Signal6,'%d\r\n',Q_Dn(i));
    fprintf(file_Input_Signal7,'%d\r\n',Noise_Mean_sig(i));
end;
fclose(file_Input_Signal1);
fclose(file_Input_Signal2);
fclose(file_Input_Signal3);
fclose(file_Input_Signal4);
fclose(file_Input_Signal5);
fclose(file_Input_Signal6);
fclose(file_Input_Signal7);

%%

%-- Log from MATLAB Model and VHDL simulation.

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\IF_Input.txt');
IF_Input_Sig = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\I_Sig.txt');
I_Sig_Matlab = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\I_Sign_HDL.txt');
I_Sig_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\Q_Sig.txt');
Q_Sig_Matlab = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\Q_Sign_HDL.txt');
Q_Sig_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\I_Dn.txt');
I_Down = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\I_Dn_HDL.txt');
I_Dn_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\sqrt_Sig.txt');
sqrt_Sig = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\SQRT_HDL.txt');
SQRT_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\Noise_Mean_sig.txt');
Noise_Mean = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\Noise_Mean_HDL.txt');
Noise_Mean_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\FFT_Amp_HDL.txt');
FFT_Amp_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);

file_Output_Signal_1 = fopen('D:\Projects\37\Digital IFM\Simulation\FFT_Output_Index_HDL.txt');
FFT_Output_Index_HDL = fscanf(file_Output_Signal_1 , '%d');
fclose(file_Output_Signal_1);


plot(SQRT_HDL)
hold
plot(Noise_Mean_HDL(30:end), 'r')
hold
plot(FFT_Amp_HDL,'g')
hold
plot(FFT_Output_Index_HDL,'y')

%%



figure
subplot(2,1,1);
plot(Output_Signal_1_14bit);
hold;
plot(floor(node4*2^14),'--r');
title('Signed Output\_Signal\_1\_15bit');
subplot(2,1,2);
plot(floor(node4(1:Samples_N)*2^14)- Output_Signal_1_14bit(1:Samples_N));
title('MatlabFixed minus VHDL');
