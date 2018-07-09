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
static const char *ng0 = "C:/Users/gggus/Documents/FPGA/PWM/pwm.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0097133789_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    int t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(35, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3552);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB8;

LAB9:    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB10;

LAB11:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 2248U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 28000;

LAB6:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t9 = (240000 - 1);
    t2 = (t8 == t9);
    if (t2 != 0)
        goto LAB12;

LAB14:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t9 = (t8 + 1);
    t1 = (t0 + 3632);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t9;
    xsi_driver_first_trans_fast(t1);

LAB13:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t8 = *((int *)t3);
    t1 = (t0 + 2248U);
    t4 = *((char **)t1);
    t9 = *((int *)t4);
    t2 = (t8 < t9);
    if (t2 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 3696);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB16:    goto LAB3;

LAB5:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 2248U);
    t7 = *((char **)t3);
    t3 = (t7 + 0);
    *((int *)t3) = 3000;
    goto LAB6;

LAB8:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2248U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = 10000;
    goto LAB6;

LAB10:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 2248U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = 17000;
    goto LAB6;

LAB12:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 3632);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = 0;
    xsi_driver_first_trans_fast(t1);
    goto LAB13;

LAB15:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3696);
    t7 = (t1 + 56U);
    t10 = *((char **)t7);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB16;

}


extern void work_a_0097133789_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0097133789_3212880686_p_0};
	xsi_register_didat("work_a_0097133789_3212880686", "isim/PWM_isim_beh.exe.sim/work/a_0097133789_3212880686.didat");
	xsi_register_executes(pe);
}
