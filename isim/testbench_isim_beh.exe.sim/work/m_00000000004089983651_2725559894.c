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
static const char *ng0 = "C:/Users/r00tk17/Xilinx/MIPSPIPE22/pipeline2.v";
static int ng1[] = {2, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static int ng6[] = {31, 0};



static void Cont_288_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t25[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(288, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t7 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 2);
    t10 = (t9 & 1);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 2);
    t13 = (t12 & 1);
    *((unsigned int *)t2) = t13;
    memset(t4, 0, 8);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (~(t15));
    t17 = *((unsigned int *)t6);
    t18 = (t17 & t16);
    t19 = (t18 & 1U);
    if (t19 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t14) != 0)
        goto LAB6;

LAB7:    t21 = (t4 + 4);
    t22 = *((unsigned int *)t4);
    t23 = *((unsigned int *)t21);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB8;

LAB9:    t37 = *((unsigned int *)t4);
    t38 = (~(t37));
    t39 = *((unsigned int *)t21);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t42, 8);

LAB16:    t41 = (t0 + 4096);
    t43 = (t41 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memcpy(t46, t3, 8);
    xsi_driver_vfirst_trans(t41, 0, 31);
    t47 = (t0 + 3984);
    *((int *)t47) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t20 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB7;

LAB8:    t26 = (t0 + 1208U);
    t27 = *((char **)t26);
    memset(t25, 0, 8);
    t26 = (t25 + 4);
    t28 = (t27 + 4);
    t29 = *((unsigned int *)t27);
    t30 = (~(t29));
    *((unsigned int *)t25) = t30;
    *((unsigned int *)t26) = 0;
    if (*((unsigned int *)t28) != 0)
        goto LAB18;

LAB17:    t35 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t35 & 4294967295U);
    t36 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t36 & 4294967295U);
    goto LAB9;

LAB10:    t41 = (t0 + 1208U);
    t42 = *((char **)t41);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t25, 32, t42, 32);
    goto LAB16;

LAB14:    memcpy(t3, t25, 8);
    goto LAB16;

LAB18:    t31 = *((unsigned int *)t25);
    t32 = *((unsigned int *)t28);
    *((unsigned int *)t25) = (t31 | t32);
    t33 = *((unsigned int *)t26);
    t34 = *((unsigned int *)t28);
    *((unsigned int *)t26) = (t33 | t34);
    goto LAB17;

}

static void Cont_289_1(char *t0)
{
    char t5[8];
    char t7[8];
    char t11[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(289, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    xsi_vlog_unsigned_add(t5, 32, t3, 32, t4, 32);
    t2 = (t0 + 1368U);
    t6 = *((char **)t2);
    t2 = (t0 + 1328U);
    t8 = (t2 + 72U);
    t9 = *((char **)t8);
    t10 = ((char*)((ng1)));
    xsi_vlog_generic_get_index_select_value(t7, 32, t6, t9, 2, t10, 32, 1);
    memset(t11, 0, 8);
    xsi_vlog_unsigned_add(t11, 32, t5, 32, t7, 32);
    t12 = (t0 + 4160);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t11, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t17 = (t0 + 4000);
    *((int *)t17) = 1;

LAB1:    return;
}

static void Always_292_2(char *t0)
{
    char t4[8];
    char t19[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    int t42;
    int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;

LAB0:    t1 = (t0 + 3664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(292, ng0);
    t2 = (t0 + 4016);
    *((int *)t2) = 1;
    t3 = (t0 + 3696);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(293, ng0);
    t5 = (t0 + 1368U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 3U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 3U);

LAB5:    t14 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t14, 2);
    if (t15 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t15 == 1)
        goto LAB12;

LAB13:
LAB14:    goto LAB2;

LAB6:    xsi_set_current_line(294, ng0);
    t16 = (t0 + 1048U);
    t17 = *((char **)t16);
    t16 = (t0 + 1848U);
    t18 = *((char **)t16);
    t20 = *((unsigned int *)t17);
    t21 = *((unsigned int *)t18);
    t22 = (t20 & t21);
    *((unsigned int *)t19) = t22;
    t16 = (t17 + 4);
    t23 = (t18 + 4);
    t24 = (t19 + 4);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t23);
    t27 = (t25 | t26);
    *((unsigned int *)t24) = t27;
    t28 = *((unsigned int *)t24);
    t29 = (t28 != 0);
    if (t29 == 1)
        goto LAB15;

LAB16:
LAB17:    t50 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t50, t19, 0, 0, 32, 0LL);
    goto LAB14;

LAB8:    xsi_set_current_line(295, ng0);
    t3 = (t0 + 1048U);
    t5 = *((char **)t3);
    t3 = (t0 + 1848U);
    t6 = *((char **)t3);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 | t9);
    *((unsigned int *)t19) = t10;
    t3 = (t5 + 4);
    t7 = (t6 + 4);
    t14 = (t19 + 4);
    t11 = *((unsigned int *)t3);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t14) = t13;
    t20 = *((unsigned int *)t14);
    t21 = (t20 != 0);
    if (t21 == 1)
        goto LAB18;

LAB19:
LAB20:    t18 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t18, t19, 0, 0, 32, 0LL);
    goto LAB14;

LAB10:    xsi_set_current_line(296, ng0);
    t3 = (t0 + 1688U);
    t5 = *((char **)t3);
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t5, 0, 0, 32, 0LL);
    goto LAB14;

LAB12:    xsi_set_current_line(297, ng0);
    t3 = (t0 + 1688U);
    t5 = *((char **)t3);
    t3 = (t0 + 1648U);
    t6 = (t3 + 72U);
    t7 = *((char **)t6);
    t14 = ((char*)((ng6)));
    xsi_vlog_generic_get_index_select_value(t19, 32, t5, t7, 2, t14, 32, 1);
    t16 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t16, t19, 0, 0, 32, 0LL);
    goto LAB14;

LAB15:    t30 = *((unsigned int *)t19);
    t31 = *((unsigned int *)t24);
    *((unsigned int *)t19) = (t30 | t31);
    t32 = (t17 + 4);
    t33 = (t18 + 4);
    t34 = *((unsigned int *)t17);
    t35 = (~(t34));
    t36 = *((unsigned int *)t32);
    t37 = (~(t36));
    t38 = *((unsigned int *)t18);
    t39 = (~(t38));
    t40 = *((unsigned int *)t33);
    t41 = (~(t40));
    t42 = (t35 & t37);
    t43 = (t39 & t41);
    t44 = (~(t42));
    t45 = (~(t43));
    t46 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t46 & t44);
    t47 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t47 & t45);
    t48 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t48 & t44);
    t49 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t49 & t45);
    goto LAB17;

LAB18:    t22 = *((unsigned int *)t19);
    t25 = *((unsigned int *)t14);
    *((unsigned int *)t19) = (t22 | t25);
    t16 = (t5 + 4);
    t17 = (t6 + 4);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t42 = (t28 & t27);
    t29 = *((unsigned int *)t17);
    t30 = (~(t29));
    t31 = *((unsigned int *)t6);
    t43 = (t31 & t30);
    t34 = (~(t42));
    t35 = (~(t43));
    t36 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t36 & t34);
    t37 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t37 & t35);
    goto LAB20;

}


extern void work_m_00000000004089983651_2725559894_init()
{
	static char *pe[] = {(void *)Cont_288_0,(void *)Cont_289_1,(void *)Always_292_2};
	xsi_register_didat("work_m_00000000004089983651_2725559894", "isim/testbench_isim_beh.exe.sim/work/m_00000000004089983651_2725559894.didat");
	xsi_register_executes(pe);
}
