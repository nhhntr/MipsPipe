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
static const char *ng0 = "C:/Users/r00tk17/Xilinx/MIPSPIPE22/testbench2.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {84, 0};
static int ng4[] = {7, 0};
static const char *ng5 = "Simulation succeeded";
static int ng6[] = {80, 0};
static const char *ng7 = "Simulation failed";



static void Initial_41_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);

LAB4:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2976);
    xsi_process_wait(t2, 22000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB1;

}

static void Always_49_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);

LAB4:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3224);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 3224);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    goto LAB2;

}

static void Always_58_2(char *t0)
{
    char t13[8];
    char t18[8];
    char t21[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    int t45;
    int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;

LAB0:    t1 = (t0 + 3664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3984);
    *((int *)t2) = 1;
    t3 = (t0 + 3696);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);

LAB5:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(60, ng0);

LAB9:    xsi_set_current_line(61, ng0);
    t11 = (t0 + 1528U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng3)));
    memset(t13, 0, 8);
    if (*((unsigned int *)t12) != *((unsigned int *)t11))
        goto LAB12;

LAB10:    t14 = (t12 + 4);
    t15 = (t11 + 4);
    if (*((unsigned int *)t14) != *((unsigned int *)t15))
        goto LAB12;

LAB11:    *((unsigned int *)t13) = 1;

LAB12:    t16 = (t0 + 1208U);
    t17 = *((char **)t16);
    t16 = ((char*)((ng4)));
    memset(t18, 0, 8);
    if (*((unsigned int *)t17) != *((unsigned int *)t16))
        goto LAB15;

LAB13:    t19 = (t17 + 4);
    t20 = (t16 + 4);
    if (*((unsigned int *)t19) != *((unsigned int *)t20))
        goto LAB15;

LAB14:    *((unsigned int *)t18) = 1;

LAB15:    t22 = *((unsigned int *)t13);
    t23 = *((unsigned int *)t18);
    t24 = (t22 & t23);
    *((unsigned int *)t21) = t24;
    t25 = (t13 + 4);
    t26 = (t18 + 4);
    t27 = (t21 + 4);
    t28 = *((unsigned int *)t25);
    t29 = *((unsigned int *)t26);
    t30 = (t28 | t29);
    *((unsigned int *)t27) = t30;
    t31 = *((unsigned int *)t27);
    t32 = (t31 != 0);
    if (t32 == 1)
        goto LAB16;

LAB17:
LAB18:    t53 = (t21 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t21);
    t57 = (t56 & t55);
    t58 = (t57 != 0);
    if (t58 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t22 = (t9 ^ t10);
    t23 = (t8 | t22);
    t24 = *((unsigned int *)t4);
    t28 = *((unsigned int *)t5);
    t29 = (t24 | t28);
    t30 = (~(t29));
    t31 = (t23 & t30);
    if (t31 != 0)
        goto LAB24;

LAB23:    if (t29 != 0)
        goto LAB25;

LAB26:    t12 = (t13 + 4);
    t32 = *((unsigned int *)t12);
    t33 = (~(t32));
    t34 = *((unsigned int *)t13);
    t37 = (t34 & t33);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB27;

LAB28:
LAB29:
LAB21:    goto LAB8;

LAB16:    t33 = *((unsigned int *)t21);
    t34 = *((unsigned int *)t27);
    *((unsigned int *)t21) = (t33 | t34);
    t35 = (t13 + 4);
    t36 = (t18 + 4);
    t37 = *((unsigned int *)t13);
    t38 = (~(t37));
    t39 = *((unsigned int *)t35);
    t40 = (~(t39));
    t41 = *((unsigned int *)t18);
    t42 = (~(t41));
    t43 = *((unsigned int *)t36);
    t44 = (~(t43));
    t45 = (t38 & t40);
    t46 = (t42 & t44);
    t47 = (~(t45));
    t48 = (~(t46));
    t49 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t49 & t47);
    t50 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t50 & t48);
    t51 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t51 & t47);
    t52 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t52 & t48);
    goto LAB18;

LAB19:    xsi_set_current_line(61, ng0);

LAB22:    xsi_set_current_line(62, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    xsi_set_current_line(63, ng0);
    xsi_vlog_stop(1);
    goto LAB21;

LAB24:    *((unsigned int *)t13) = 1;
    goto LAB26;

LAB25:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(65, ng0);

LAB30:    xsi_set_current_line(66, ng0);
    xsi_vlogfile_write(1, 0, 0, ng7, 1, t0);
    xsi_set_current_line(67, ng0);
    xsi_vlog_stop(1);
    goto LAB29;

}


extern void work_m_00000000002376933335_1949178628_init()
{
	static char *pe[] = {(void *)Initial_41_0,(void *)Always_49_1,(void *)Always_58_2};
	xsi_register_didat("work_m_00000000002376933335_1949178628", "isim/testbench_isim_beh.exe.sim/work/m_00000000002376933335_1949178628.didat");
	xsi_register_executes(pe);
}
