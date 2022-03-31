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
static const char *ng0 = "D:/Examples/Simple_Algorithm/Simple_Algorithm_VHDL/Top_Module.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

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

LAB0:    xsi_set_current_line(38, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 3936);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 17U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3840);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3225011129_3212880686_p_1(char *t0)
{
    char t9[16];
    char t17[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3856);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(45, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t3 = (t0 + 4000);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 2288U);
    t3 = *((char **)t1);
    t1 = (t0 + 6480U);
    t4 = (t0 + 1512U);
    t5 = *((char **)t4);
    t4 = (t0 + 6496U);
    t6 = ieee_p_1242562249_sub_2807594338_1035706684(IEEE_P_1242562249, t9, t3, t1, t5, t4);
    t7 = (t9 + 12U);
    t10 = *((unsigned int *)t7);
    t11 = (1U * t10);
    t2 = (21U != t11);
    if (t2 == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 4064);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 21U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6528U);
    t4 = (t0 + 1672U);
    t5 = *((char **)t4);
    t10 = (20 - 20);
    t11 = (t10 * 1U);
    t16 = (0 + t11);
    t4 = (t5 + t16);
    t6 = (t17 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 20;
    t7 = (t6 + 4U);
    *((int *)t7) = 4;
    t7 = (t6 + 8U);
    *((int *)t7) = -1;
    t18 = (4 - 20);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t19;
    t7 = ieee_p_1242562249_sub_3273497107_1035706684(IEEE_P_1242562249, t9, t3, t1, t4, t17);
    t8 = (t9 + 12U);
    t19 = *((unsigned int *)t8);
    t20 = (1U * t19);
    t2 = (17U != t20);
    if (t2 == 1)
        goto LAB7;

LAB8:    t12 = (t0 + 4128);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t21 = *((char **)t15);
    memcpy(t21, t7, 17U);
    xsi_driver_first_trans_fast(t12);
    goto LAB3;

LAB5:    xsi_size_not_matching(21U, t11, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(17U, t20, 0);
    goto LAB8;

}


extern void work_a_3225011129_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3225011129_3212880686_p_0,(void *)work_a_3225011129_3212880686_p_1};
	xsi_register_didat("work_a_3225011129_3212880686", "isim/Simple_Algorithm_VHDL_tb_isim_beh.exe.sim/work/a_3225011129_3212880686.didat");
	xsi_register_executes(pe);
}
