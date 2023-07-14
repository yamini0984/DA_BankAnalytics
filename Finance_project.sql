use project_finance;
SELECT * FROM project_finance.finance_1;
SET sql_mode = 'modes_without_only_full_group_by';
SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SHOW VARIABLES LIKE 'sql_mode';
SET sql_mode = 'desired_sql_mode';
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET sql_mode = '<desired_sql_mode>';
set sql_mode='';
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

##1

select * from finance_1;
select issue_d,count(funded_amnt)as count_funded,sum(loan_amnt) as Total_loan, sum(funded_amnt)as funded_amount,avg(installment),avg(term),avg(int_rate),avg(emp_length) as avg_emplength from finance_1 group by (year(issue_d)) order by issue_d asc;

##2
select * from finance_1;
select * from finance_2; 

select finance_2.revol_bal,finance_1.grade,finance_1.sub_grade from finance_1 join finance_2 on finance_1.id=finance_2.id;
select sum(finance_2.revol_bal) as total_revol_bal,finance_1.grade,finance_1.sub_grade from finance_1 join finance_2 on finance_1.id=finance_2.id group by grade,sub_grade order by grade asc ;

##3
select f1.verification_status,sum(f2.total_pymnt) as tot_pymnt from finance_1 as f1 join finance_2 as f2 on f1.id=f2.id group by verification_status; 

##4
select * from finance_1;
select * from finance_2;
select  avg(f1.funded_amnt) as avg_funded_amnt,f2.last_credit_pull_d,f1.addr_state from finance_1 as f1 join finance_2 as f2 on f1.id=f2.id group by addr_state order by addr_state;

##5
select * from finance_1;
select * from finance_2;
select count(f1.id),f2.last_pymnt_d,f1.home_ownership from finance_1 as f1 join finance_2 as f2 on f1.id=f2.id group by last_pymnt_d order by count(f1.id) asc;

