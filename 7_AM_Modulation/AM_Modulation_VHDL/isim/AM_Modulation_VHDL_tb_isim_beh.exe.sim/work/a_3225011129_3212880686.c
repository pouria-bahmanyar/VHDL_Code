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
static const char *ng0 = "D:/Examples/AM_Modulation/AM_Modulation_VHDL/Top_Module.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2563015576_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_2807594338_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3225011129_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 4096);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 10U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4000);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3225011129_3212880686_p_1(char *t0)
{
    char t3[16];
    char t19[16];
    char t22[16];
    char *t1;
    unsigned char t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned int t18;
    int t20;
    unsigned int t21;
    unsigned int t23;

LAB0:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4016);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t4 = (t0 + 2448U);
    t5 = *((char **)t4);
    t4 = (t0 + 6832U);
    t6 = (t0 + 1512U);
    t7 = *((char **)t6);
    t6 = (t0 + 6864U);
    t8 = ieee_p_1242562249_sub_2807594338_1035706684(IEEE_P_1242562249, t3, t5, t4, t7, t6);
    t9 = (t3 + 12U);
    t10 = *((unsigned int *)t9);
    t11 = (1U * t10);
    t12 = (15U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4160);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 15U);
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1672U);
    t4 = *((char **)t1);
    t10 = (14 - 14);
    t11 = (t10 * 1U);
    t18 = (0 + t11);
    t1 = (t4 + t18);
    t5 = (t19 + 0U);
    t6 = (t5 + 0U);
    *((int *)t6) = 14;
    t6 = (t5 + 4U);
    *((int *)t6) = 6;
    t6 = (t5 + 8U);
    *((int *)t6) = -1;
    t20 = (6 - 14);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t6 = (t5 + 12U);
    *((unsigned int *)t6) = t21;
    t6 = ieee_p_1242562249_sub_2563015576_1035706684(IEEE_P_1242562249, t22, 128, 9);
    t7 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t3, t1, t19, t6, t22);
    t8 = (t3 + 12U);
    t21 = *((unsigned int *)t8);
    t23 = (1U * t21);
    t2 = (9U != t23);
    if (t2 == 1)
        goto LAB7;

LAB8:    t9 = (t0 + 4224);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 9U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1992U);
    t4 = *((char **)t1);
    t1 = (t0 + 6912U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 6848U);
    t7 = ieee_p_1242562249_sub_2807594338_1035706684(IEEE_P_1242562249, t3, t4, t1, t6, t5);
    t8 = (t3 + 12U);
    t10 = *((unsigned int *)t8);
    t11 = (1U * t10);
    t2 = (19U != t11);
    if (t2 == 1)
        goto LAB9;

LAB10:    t9 = (t0 + 4288);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 19U);
    xsi_driver_first_trans_fast(t9);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1832U);
    t4 = *((char **)t1);
    t10 = (18 - 18);
    t11 = (t10 * 1U);
    t18 = (0 + t11);
    t1 = (t4 + t18);
    t5 = (t0 + 4352);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 10U);
    xsi_driver_first_trans_fast(t5);
    goto LAB3;

LAB5:    xsi_size_not_matching(15U, t11, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(9U, t23, 0);
    goto LAB8;

LAB9:    xsi_size_not_matching(19U, t11, 0);
    goto LAB10;

}


extern void work_a_3225011129_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3225011129_3212880686_p_0,(void *)work_a_3225011129_3212880686_p_1};
	xsi_register_didat("work_a_3225011129_3212880686", "isim/AM_Modulation_VHDL_tb_isim_beh.exe.sim/work/a_3225011129_3212880686.didat");
	xsi_register_executes(pe);
}
