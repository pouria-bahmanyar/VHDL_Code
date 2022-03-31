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

char *IEEE_P_0774719531;
char *IEEE_P_3564397177;
char *IEEE_P_3972351953;
char *XILINXCORELIB_P_3743709326;
char *IEEE_P_1242562249;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *XILINXCORELIB_P_2602938013;
char *XILINXCORELIB_P_3160202542;
char *XILINXCORELIB_P_3155556343;
char *XILINXCORELIB_P_3381355550;
char *XILINXCORELIB_P_1849098369;
char *IEEE_P_3499444699;
char *XILINXCORELIB_P_1837083571;


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
    xilinxcorelib_a_0940462083_3212880686_init();
    xilinxcorelib_a_3717260149_3212880686_init();
    xilinxcorelib_a_2537247828_3212880686_init();
    xilinxcorelib_a_1221229771_3212880686_init();
    xilinxcorelib_a_0399197003_3212880686_init();
    xilinxcorelib_a_3359271892_3212880686_init();
    xilinxcorelib_a_2040010228_3212880686_init();
    xilinxcorelib_a_2791914859_3212880686_init();
    xilinxcorelib_a_3245991592_3212880686_init();
    xilinxcorelib_a_0619140574_3212880686_init();
    xilinxcorelib_a_1594002295_3212880686_init();
    work_a_0475460160_2396783870_init();
    xilinxcorelib_a_0812671176_3212880686_init();
    xilinxcorelib_a_4018227287_3212880686_init();
    xilinxcorelib_a_1536243642_3212880686_init();
    work_a_3817123795_3446967770_init();
    work_a_3225011129_3212880686_init();
    work_a_2140782646_2372691052_init();


    xsi_register_tops("work_a_2140782646_2372691052");

    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    XILINXCORELIB_P_3743709326 = xsi_get_engine_memory("xilinxcorelib_p_3743709326");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    XILINXCORELIB_P_2602938013 = xsi_get_engine_memory("xilinxcorelib_p_2602938013");
    XILINXCORELIB_P_3160202542 = xsi_get_engine_memory("xilinxcorelib_p_3160202542");
    XILINXCORELIB_P_3155556343 = xsi_get_engine_memory("xilinxcorelib_p_3155556343");
    XILINXCORELIB_P_3381355550 = xsi_get_engine_memory("xilinxcorelib_p_3381355550");
    XILINXCORELIB_P_1849098369 = xsi_get_engine_memory("xilinxcorelib_p_1849098369");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    XILINXCORELIB_P_1837083571 = xsi_get_engine_memory("xilinxcorelib_p_1837083571");

    return xsi_run_simulation(argc, argv);

}
