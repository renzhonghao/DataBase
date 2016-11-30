use students 
go

/*1，表操作*/
/*(1)建表*/
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

insert T631406010128 values('计算机原理','张一平','S3092',20.80,200)
insert T631406010128 values('C语言程序设计','李华','H1298',15.30,300)
insert T631406010128 values('数据库原理','王家树','D1007',22.70,150)
insert T631406010128 values('计算机网络','高明','S5690',18.90,230)
insert T631406010128 values('Artficial intelligence','P.Winston','D2008',20.50,400)
insert T631406010128 values('Expert systems','R.Ullman','H3067',17.00,370)
insert T631406010128 values('软件工程','鲁延璋','S2005',35.00,200)
insert T631406010128 values('Fortran程序设计','顾学峰','S5006',18.00,180)
/*（2）改变title长度*/
alter table T631406010128 alter column title varchar(50)

/*（3）用子查询方式建新表*/
--create students.dbo.ST631406010128 as select Title,price from T631406010128
select Title,price into students.dbo.ST631406010128 from T631406010128
/*（4） 按t_no建索引*/
create unique index IT631406010128 on S631406010128(t_no)
/*（5） 建视图VT*/
create view VT631406010128 as select Title,author,price from T631406010128
/*（6）删除视图*/
drop view VT631406010128
/*（7）删除表*/
drop table ST631406010128


/*2，记录的插入，删除与更新*/

/*（1）用子查询方式建表*/
select t_no,Title,price into students.dbo.ST631406010128 from T631406010128
/*（2）向ST插入值*/
insert ST631406010128 values('S7028','Digital Image Processing',36.00)
/*（3）删除元组*/
delete from ST631406010128 where Title='Fortran程序设计'
/*（4）删除书号以H开头的元组*/
delete from ST631406010128 where t_no like 'H%'
/*（5）调整价格*/
update ST631406010128 set price=price*0.95
/*（6）调整以D开头的书*/
update ST631406010128 set price=price-2 where t_no like 'D%'
/*（7）改书号*/
update ST631406010128 set t_no='S1135' where Title='计算机原理'
/*（8）各种插入，删除，更新*/
insert ST631406010128 values('S1011','数据库系统概论',39.60)
insert ST631406010128 values('D1111','移动互联开发',56.00)
delete from ST631406010128 where Title='软件工程'
update ST631406010128 set price=25.00 where t_no='S5690'
/*（9）查看修改后内容*/
select * from ST631406010128


/*3，统计*/
/*（1）计算最高价，最低价，平均价*/
select MAX(price) as 最高价,MIN(price) as 最低价,AVG(price) as 平均价 from T631406010128
/*（2）计算书种类*/
select COUNT(distinct substring(t_no,1,1))as 书籍种类数 from S631406010128
/*（3）1990年后出版书籍*/
select COUNT(T_no)as 数量 from S631406010128 where pub_date>1990
/*（4）书籍总数*/
select COUNT(T_no)as 书籍总数 from S631406010128
/*（5）各种统计量*/
--最近出版的书籍信息
select * from S631406010128 where pub_date like (select MAX(pub_date) from S631406010128)
--作家总数
select COUNT(distinct author) from T631406010128
--书籍总销量及销量最好的销量及书名
select SUM(QTY) as 书籍总销量, max(QTY) from T631406010128 
--where Title like (select Title from T631406010128 where QTy=MAX(QTY))