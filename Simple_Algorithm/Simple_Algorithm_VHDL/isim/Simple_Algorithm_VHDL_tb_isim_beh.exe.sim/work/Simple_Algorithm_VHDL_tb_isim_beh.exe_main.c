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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *XILINXCORELIB_P_1849098369;
char *XILINXCORELIB_P_2602938013;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *STD_TEXTIO;
char *IEEE_P_3972351953;
char *IEEE_P_0774719531;
char *XILINXCORELIB_P_1837083571;
char *XILINXCORELIB_P_3743709326;
char *IEEE_P_2592010699;
char *XILINXCORELIB_P_3160202542;
char *XILINXCORELIB_P_3155556343;
char *XILINXCORELIB_P_3381355550;
char *IEEE_P_3499444699;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    std_textio_init();
    ieee_p_3564397177_init();
    ieee_p_3499444699_init();
    ieee_p_0774719531_init();
    ieee_p_3972351953_init();
    xilinxcorelib_p_1837083571_init();
    xilinxcorelib_p_3381355550_init();
    xilinxcorelib_p_1849098369_init();
    xilinxcorelib_p_2602938013_init();
    xilinxcorelib_p_3160202542_init();
    xilinxcorelib_p_3155556343_init();
    xilinxcorelib_p_3743709326_init();
    xilinxcorelib_a_1559112701_3212880686_init();
    xilinxcorelib_a_3111164043_3212880686_init();
    xilinxcorelib_a_2537247828_3212880686_init();
    xilinxcorelib_a_1221229771_3212880686_init();
    xilinxcorelib_a_0399197003_3212880686_init();
    xilinxcorelib_a_3359271892_3212880686_init();
    xilinxcorelib_a_0603531924_3212880686_init();
    xilinxcorelib_a_4228383243_3212880686_init();
    xilinxcorelib_a_2340395781_3212880686_init();
    xilinxcorelib_a_1418638234_3212880686_init();
    xilinxcorelib_a_4229783544_3212880686_init();
    work_a_2074219444_1645380895_init();
    work_a_3225011129_3212880686_init();
    work_a_3489238887_2372691052_init();


    xsi_register_tops("work_a_3489238887_2372691052");

    XILINXCORELIB_P_1849098369 = xsi_get_engine_memory("xilinxcorelib_p_1849098369");
    XILINXCORELIB_P_2602938013 = xsi_get_engine_memory("xilinxcorelib_p_2602938013");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    XILINXCORELIB_P_1837083571 = xsi_get_engine_memory("xilinxcorelib_p_1837083571");
    XILINXCORELIB_P_3743709326 = xsi_get_engine_memory("xilinxcorelib_p_3743709326");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    XILINXCORELIB_P_3160202542 = xsi_get_engine_memory("xilinxcorelib_p_3160202542");
    XILINXCORELIB_P_3155556343 = xsi_get_engine_memory("xilinxcorelib_p_3155556343");
    XILINXCORELIB_P_3381355550 = xsi_get_engine_memory("xilinxcorelib_p_3381355550");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
