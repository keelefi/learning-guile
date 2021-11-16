#include <stdio.h>

#include <libguile.h>

SCM get_employee_name(SCM employee)
{
    SCM employee_name_func_var = scm_c_lookup("employee-name");
    SCM employee_name_func = scm_variable_ref(employee_name_func_var);
    SCM employee_name = scm_call_1(employee_name_func, employee);

    return employee_name;
}

SCM set_employee_salary(SCM employee, SCM salary)
{
    SCM set_employee_salary_func_var = scm_c_lookup("set-employee-salary!");
    SCM set_employee_salary_func = scm_variable_ref(set_employee_salary_func_var);
    SCM set_employee_salary = scm_call_2(set_employee_salary_func, employee, salary);

    return employee;
}

void main_func(void *data, int argc, char *argv[]);

void main(int argc, char *argv[])
{
    scm_boot_guile(argc, argv, main_func, NULL);
}

void main_func(void *data, int argc, char *argv[])
{
    scm_c_define_gsubr("get_employee_name", 1, 0, 0, get_employee_name);
    scm_c_define_gsubr("set_employee_salary!", 2, 0, 0, set_employee_salary);

    scm_c_primitive_load("script.scm");
}
