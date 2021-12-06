/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "G:/VHDL_CODE/FFT_4_Point/FFT_4_Point_testbench.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );


static void work_a_1295207684_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 5504);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 3888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4680);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(117, ng0);
    t2 = (t0 + 5504);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 3888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4680);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1295207684_2372691052_p_1(char *t0)
{
    char t6[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int64 t5;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    char *t13;
    int t14;

LAB0:    t1 = (t0 + 5120U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(126, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 4928);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 3888U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 10);
    t2 = (t0 + 4928);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(131, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, 7, 16);
    t7 = (16U != 16U);
    if (t7 == 1)
        goto LAB12;

LAB13:    t4 = (t0 + 5568);
    t8 = (t4 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 16U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(132, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, 1, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB14;

LAB15:    t8 = (t0 + 5632);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(133, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, 5, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB16;

LAB17:    t8 = (t0 + 5696);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(134, ng0);
    t14 = (-(4));
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, t14, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB18;

LAB19:    t8 = (t0 + 5760);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(135, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, 3, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB20;

LAB21:    t8 = (t0 + 5824);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(136, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, 23, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB22;

LAB23:    t8 = (t0 + 5888);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(137, ng0);
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, 9, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB24;

LAB25:    t8 = (t0 + 5952);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(138, ng0);
    t14 = (-(2));
    t2 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t6, t14, 16);
    t4 = (t6 + 12U);
    t12 = *((unsigned int *)t4);
    t12 = (t12 * 1U);
    t7 = (16U != t12);
    if (t7 == 1)
        goto LAB26;

LAB27:    t8 = (t0 + 6016);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(141, ng0);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB13;

LAB14:    xsi_size_not_matching(16U, t12, 0);
    goto LAB15;

LAB16:    xsi_size_not_matching(16U, t12, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(16U, t12, 0);
    goto LAB19;

LAB20:    xsi_size_not_matching(16U, t12, 0);
    goto LAB21;

LAB22:    xsi_size_not_matching(16U, t12, 0);
    goto LAB23;

LAB24:    xsi_size_not_matching(16U, t12, 0);
    goto LAB25;

LAB26:    xsi_size_not_matching(16U, t12, 0);
    goto LAB27;

LAB28:    goto LAB2;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

}


extern void work_a_1295207684_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1295207684_2372691052_p_0,(void *)work_a_1295207684_2372691052_p_1};
	xsi_register_didat("work_a_1295207684_2372691052", "isim/FFT_4_Point_testbench_isim_beh.exe.sim/work/a_1295207684_2372691052.didat");
	xsi_register_executes(pe);
}
