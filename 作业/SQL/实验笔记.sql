ʵ��һ��

use master
select * from  spt_values

ʵ�����

 

 �ڶ��¸�����Ŀ

       1������һ��Ch���ݿ⣬�����ݿ���������ļ��߼�����ΪCh_data��
    �����ļ���ΪCh.mdf����ʼ��СΪ10MB�����ߴ�Ϊ20MB�������ٶ�Ϊ10%��
    ���ݿ����־�ļ��߼�����ΪCh_log�������ļ���ΪCh.ldf����ʼ��СΪ1MB��
    ���ߴ�Ϊ5MB�������ٶ�Ϊ1MB��

       create  database  ch
       on  
       (  name='Ch_data',
          filename='d:\data\Ch.mdf',
          size=10mb,
          maxsize=20mb,
         filegrowth=10%
       )
       log on
      (  name='Ch_log',
          filename='d:\data\Ch.ldf',
          size=1mb,
          maxsize=5mb,
         filegrowth=1mb
       )

      2����һ�������ļ�Ch1(��ʼ��СΪ10MB�����ߴ�Ϊ25MB��
       �����ٶ�Ϊ5MB)��һ��������־�ļ�Ch2(��ʼ��СΪ2MB��
         ���ߴ�Ϊ5MB�������ٶ�Ϊ1MB)��ӵ�Ch���ݿ��С�
        
          alter database ch
           add file
          (  name='Ch1',
          filename='d:\data\Ch1.mdf',
          size=10mb,
          maxsize=25mb,
         filegrowth=5mb
         )

       go


         alter database ch
           add log file
       
         (  name='Ch2',
          filename='d:\data\Ch2.ldf',
          size=2mb,
          maxsize=5mb,
         filegrowth=1mb
         )



3���������鿴ϵͳ���ݿ��Ch���ݿ⡣

         exec  sp_helpdb  
         exec  sp_helpdb  ch
4���޸�ch2������Ϊch2_log��
        alter database ch
           modify file
            ( name=ch2,
               newname=ch2_log)
 ���� 'ch2_log' �����á�
5����ch1�Ĵ�С��Ϊ30mb��
         alter database ch
           modify file

        (  name='Ch1',
            size=30mb
         )
6���Ƴ�ch1��
        alter database ch
           remove file  ch1

		   �ļ�'ch1' ��ɾ����
7������ļ���ch3��

        alter database ch
           add  filegroup  ch3
        
8��ɾ���ļ���ch3��
           alter database ch
           remove   filegroup  ch3
		   --�ļ���'ch3' ��ɾ����
9��ɾ�����������ݿ�Ch��
          drop database ch

----------------------------
P234  
c.
create table salary1
(
  employeeid  char(6)  primary key,
  income  float  not null,
  outcome  float  not null,
  actincome as income-outcome persisted
)

d.
alter table employees
 add constraint  def_1  default  0  for sex
 
 e.
 create table #test
 (
  id  char(4)  not null,
  name  char(10)
  )
  
  select * from #test


  ������  
  ʵ����Ŀ��

USE test1
GO
1������T����ʦ���������
(TNO,TN,SEX,AGE,PROF,SAL,DEPT)�ֱ��ʾ��ʦ�ı�ţ��������Ա����䣬ְ�ƣ����ʣ�ϵ��TC����ʦ�ڿα��ĽṹΪTC(TNO,CNO)�ֱ��ʾ��ʦ�ı�ţ��γ̱��



CREATE TABLE t
(
	TNO char(10) NOT NULL PRIMARY KEY,/*��ʦ����ֶ�*/
	TN char(10) NULL,/*��ʦ�����ֶ�*/
	SEX char(2) NULL,/*��ʦ�Ա��ֶ�*/
	AGE int NULL,/*��ʦ�����ֶ�*/
	PROF char(20) NULL,/*��ʦְ���ֶ�*/
	SAL int NULL,/*��ʦ�����ֶ�*/
	DEPT char(10) NULL,/*��ʦ����ϵ���ֶ�*/ 
)
GO
INSERT INTO t VALUES('0001','����ʦ','��',41,'������',2200,'����ϵ')
GO
INSERT INTO t VALUES('0002','������','Ů',32,'��ʦ',1500,'����ϵ')
GO

CREATE TABLE TC
(
	TNO char(10) NOT NULL,/*��ʦ����ֶ�*/
	CNO char(10) NULL,/*��ʦִ�̿γ��ֶ�*/ 
)
GO
INSERT INTO tc VALUES('0001','C5')
GO
2�������н�ʦ�Ĺ�����ߵ�ԭ���ʵ�1.2����
 update t
 set sal=sal*1.2
 select * from t

3�� ɾ�������ս�ʦ�ļ�¼��
delete 
from t
where tn='������'

4.����һ��tel char(20)�С�
alter table t
add tel char(20)

5.�������ֶ����Ը�Ϊfloat�͡�
alter table t
alter column sal float


6.ɾ��tel�ֶΡ�
alter table t
drop column tel
7.������ʦ�������Ϊ50�ꡣ
 update t
 set AGE=50
 where tn='����ʦ'



8.������ʦ��ִ�̿γ��ֶθ�ΪC10.
select * from tc

update tc
set cno='c10'     ----�ַ����Ĵ�Сд
 where tno=
  (select tno
  from t
  where   tn='����ʦ')

  select * from tc
  where cno='C10'-------�ַ����ȶԲ����ִ�Сд

9.��TC���ΪTC_01��

exec sp_rename  'tc','TC_01'  

10.��ϵ���ֶ�����Ϊsdept.
exec sp_rename  't.dept','sdept'


alter table
modify
(
  name='',
  newname=

)




11.ɾ��TC_01��.
-------------------------------
ʵ��4

into

select * into  cjb2
from cjb
where 1>2


(3)
  use YGGL
  select name,address
  from employees
  where birthday>'1971-1-1'
  
 select employeeid,name
 from employees
 where department in
 (select departmentid
  from departments
 where departmentname='����')
 
 (5)
   select name,address,����ˮƽ=
   case 
     when income<2000 then  '������'
     when income>3000 then  '������'
     else  '�е�����'
    end
   from employees,salary
   where employees.employeeid=salary.employeeid
   
  (7)
    select MAX(income-outcome),MIN(income-outcome)
    from salary
    where employeeid in
     (select employeeid
       from employees
        where department in
          (select departmentid
            from departments
             where departmentname='����'))
             
   (10)
    select employeeid,name into  ��Ա����1
    from employees
    where sex='��'
    
    
    select MAX(cj),AVG(cj)
    from cjb
    where xh='081101'
    
    select xh,cj
    from cjb
    where xh='081101'
    compute MAX(cj),AVG(cj)
    
    
    select xh,cj
    from cjb
    order by xh
    compute MAX(cj),AVG(cj) by xh
    
    
    
    2.�Ӳ�ѯ
   (1) 
     select *
     from employees
     where  employeeid in
        (select employeeid
          from salary
            where income<2500)    
    
    (2)
      select name
      from employees,salary,departments
      where employees.employeeid=salary.employeeid
      and employees.department=departments.departmentid
      and departmentname='�з���' 
      and income>
     ( select MAX(income)
      from salary
      where employeeid in
         (select employeeid
           from employees
            where department in
              (select departmentid
               from departments
                where departmentname='����')))
    
    ------------------------
      select name
      from employees
      where employeeid in
      (select employeeid
      from salary
      where employeeid in
         (select employeeid
          from employees
          where department in
            (select departmentid
              from departments
              where departmentname ='�з���'))
      and income>
     ( select MAX(income)
      from salary
      where employeeid in
         (select employeeid
           from employees
            where department in
              (select departmentid
               from departments
                where departmentname='����'))))
    
    (3)
    select name
    from employees
    where birthday<all
     (select birthday
     from employees
     where department in
       (select departmentid
       from departments
       where departmentname='�з���') )      
    
    
    
    5.(1)
    ����˶ʿ  ����  ��ר ����
    
    select *
    from employees
    order by 
    (case  education
      when '˶ʿ' then '3'
      when '����' then '2'
      else '1'
     end) desc
    
  (3)
  select name,sex,[work year]
  from employees a
  order by 
   (select income-outcome
    from salary
    where salary.employeeid=a.employeeid) desc
    
   select  name,sex,[work year],income-outcome
   from employees,salary
   where salary.employeeid=employees.employeeid
   order by income-outcome desc
    
    
    
    
    
    
    
    
    
    
    
    
    