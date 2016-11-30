use students 
go

/*1�������*/
/*(1)����*/
create table S631406010128
( T_no char(5) not null,
  Page int,
  pub_date int
  --primary key(T_no)
  )
  
create table T631406010128
( Title varchar(30) not null,
  author varchar(30) not null,
  t_no char(5) not null,
  price money,
  --primary key(t_no,Title),
  --CONSTRAINT OrdermasterFK1 foreign key(t_no)
  --references s631406010128(T_no)
  )
  alter table T631406010128 add QTY int
  
insert S631406010128 values('S3092',304,1986)
insert S631406010128 values('D1007',280,1993)
insert S631406010128 values('S5006',315,1987)
insert S631406010128 values('S5690',300,1993)
insert S631406010128 values('H1298',210,1989)
insert S631406010128 values('D2008',358,1994)
insert S631406010128 values('S2005',298,1995)
insert S631406010128 values('H3067',307,1995)

insert T631406010128 values('�����ԭ��','��һƽ','S3092',20.80,200)
insert T631406010128 values('C���Գ������','�','H1298',15.30,300)
insert T631406010128 values('���ݿ�ԭ��','������','D1007',22.70,150)
insert T631406010128 values('���������','����','S5690',18.90,230)
insert T631406010128 values('Artficial intelligence','P.Winston','D2008',20.50,400)
insert T631406010128 values('Expert systems','R.Ullman','H3067',17.00,370)
insert T631406010128 values('�������','³���','S2005',35.00,200)
insert T631406010128 values('Fortran�������','��ѧ��','S5006',18.00,180)
/*��2���ı�title����*/
alter table T631406010128 alter column title varchar(50)

/*��3�����Ӳ�ѯ��ʽ���±�*/
--create students.dbo.ST631406010128 as select Title,price from T631406010128
select Title,price into students.dbo.ST631406010128 from T631406010128
/*��4�� ��t_no������*/
create unique index IT631406010128 on S631406010128(t_no)
/*��5�� ����ͼVT*/
create view VT631406010128 as select Title,author,price from T631406010128
/*��6��ɾ����ͼ*/
drop view VT631406010128
/*��7��ɾ����*/
drop table ST631406010128


/*2����¼�Ĳ��룬ɾ�������*/

/*��1�����Ӳ�ѯ��ʽ����*/
select t_no,Title,price into students.dbo.ST631406010128 from T631406010128
/*��2����ST����ֵ*/
insert ST631406010128 values('S7028','Digital Image Processing',36.00)
/*��3��ɾ��Ԫ��*/
delete from ST631406010128 where Title='Fortran�������'
/*��4��ɾ�������H��ͷ��Ԫ��*/
delete from ST631406010128 where t_no like 'H%'
/*��5�������۸�*/
update ST631406010128 set price=price*0.95
/*��6��������D��ͷ����*/
update ST631406010128 set price=price-2 where t_no like 'D%'
/*��7�������*/
update ST631406010128 set t_no='S1135' where Title='�����ԭ��'
/*��8�����ֲ��룬ɾ��������*/
insert ST631406010128 values('S1011','���ݿ�ϵͳ����',39.60)
insert ST631406010128 values('D1111','�ƶ���������',56.00)
delete from ST631406010128 where Title='�������'
update ST631406010128 set price=25.00 where t_no='S5690'
/*��9���鿴�޸ĺ�����*/
select * from ST631406010128


/*3��ͳ��*/
/*��1��������߼ۣ���ͼۣ�ƽ����*/
select MAX(price) as ��߼�,MIN(price) as ��ͼ�,AVG(price) as ƽ���� from T631406010128
/*��2������������*/
select COUNT(distinct substring(t_no,1,1))as �鼮������ from S631406010128
/*��3��1990�������鼮*/
select COUNT(T_no)as ���� from S631406010128 where pub_date>1990
/*��4���鼮����*/
select COUNT(T_no)as �鼮���� from S631406010128
/*��5������ͳ����*/
--���������鼮��Ϣ
select * from S631406010128 where pub_date like (select MAX(pub_date) from S631406010128)
--��������
select COUNT(distinct author) from T631406010128
--�鼮��������������õ�����������
select SUM(QTY) as �鼮������, max(QTY) from T631406010128 
--where Title like (select Title from T631406010128 where QTy=MAX(QTY))