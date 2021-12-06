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
static const char *ng0 = "G:/VHDL_CODE/FFT_4_Point/Butterfly_Block.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_3273497107_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3273568981_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3410769178_1035706684(char *, char *, char *, char *, int );


static void work_a_0287347587_3212880686_p_0(char *t0)
{
    char t1[16];
    char t4[16];
    char *t2;
    char *t3;
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
    char *t18;

LAB0:    xsi_set_current_line(32, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 6684U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 6716U);
    t7 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t4, t6, t5, 17);
    t8 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t1, t3, t2, t7, t4);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t11 = (1U * t10);
    t12 = (17U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4504);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 17U);
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 4376);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(17U, t11, 0);
    goto LAB6;

}

static void work_a_0287347587_3212880686_p_1(char *t0)
{
    char t1[16];
    char t4[16];
    char *t2;
    char *t3;
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
    char *t18;

LAB0:    xsi_set_current_line(33, ng0);

LAB3:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 6700U);
    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t5 = (t0 + 6732U);
    t7 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t4, t6, t5, 17);
    t8 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t1, t3, t2, t7, t4);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t11 = (1U * t10);
    t12 = (17U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4568);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 17U);
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 4392);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(17U, t11, 0);
    goto LAB6;

}

static void work_a_0287347587_3212880686_p_2(char *t0)
{
    char t1[16];
    char t4[16];
    char *t2;
    char *t3;
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
    char *t18;

LAB0:    xsi_set_current_line(35, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 6684U);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 6716U);
    t7 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t4, t6, t5, 17);
    t8 = ieee_p_1242562249_sub_3273568981_1035706684(IEEE_P_1242562249, t1, t3, t2, t7, t4);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t11 = (1U * t10);
    t12 = (17U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4632);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 17U);
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 4408);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(17U, t11, 0);
    goto LAB6;

}

static void work_a_0287347587_3212880686_p_3(char *t0)
{
    char t1[16];
    char t4[16];
    char *t2;
    char *t3;
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
    char *t18;

LAB0:    xsi_set_current_line(36, ng0);

LAB3:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 6700U);
    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t5 = (t0 + 6732U);
    t7 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t4, t6, t5, 17);
    t8 = ieee_p_1242562249_sub_3273568981_1035706684(IEEE_P_1242562249, t1, t3, t2, t7, t4);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t11 = (1U * t10);
    t12 = (17U != t11);
    if (t12 == 1)
        goto LAB5;

LAB6:    t13 = (t0 + 4696);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t8, 17U);
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 4424);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(17U, t11, 0);
    goto LAB6;

}


extern void work_a_0287347587_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0287347587_3212880686_p_0,(void *)work_a_0287347587_3212880686_p_1,(void *)work_a_0287347587_3212880686_p_2,(void *)work_a_0287347587_3212880686_p_3};
	xsi_register_didat("work_a_0287347587_3212880686", "isim/FFT_4_Point_testbench_isim_beh.exe.sim/work/a_0287347587_3212880686.didat");
	xsi_register_executes(pe);
}
