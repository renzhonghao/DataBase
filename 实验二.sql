  /*1,��������ѯ*/

/*1)����pub����authors���ȫ����Ϣ*/
select * from dbo.authors
/*2)����������������ȫ����Ϣ*/
select * from dbo.discounts
select * from dbo.jobs
select * from dbo.pub_info
select * from dbo.publishers
select * from dbo.roysched
select * from dbo.sales
select * from dbo.stores
select * from dbo.titleauthor
select * from dbo.titles

/*2,��������ѯ*/

/*1)����titles����ȫ����ż�����*/
select title_id as "���",title as "����"from dbo.titles
/*2)����titles���м۸���15~18Ԫ֮����������*/
select title as "����"from dbo.titles where price>=15 and price<=18
/*3)����titles���������T��ͷ����ż�����*/
select title_id as "���",title as "����"from dbo.titles where title like 'T%'
/*4)����������������ּ򵥲�ѯ���������в�ѯ*/
select au_lname,au_fname,phone from authors where city = 'Oakland'

/*3,��������ѯ*/

/*1)����������ʼ�ַ�ΪT���۸�С��16Ԫ���������۸�*/
select title as "����",price as "�۸�" from dbo.titles where title like 'T%' and price<16
/*2)����������ʼ�ַ���ΪT���۸����16Ԫ������������۸�*/
select title_id as "���",title as "����",price as "�۸�" from dbo.titles where title not like 'T%' and price>16
/*3)������������������ѯ���������в�ѯ*/
select stor_name ,stor_address from stores where city='Portland' and stor_name='Bookbeat'

/*4,�����Ӳ�������Ƕ�ײ�ѯ�����в�ѯ*/

/*1)ʹ��������titles��publishers���в�ѯ�����ҳ�����������Լ�����������*/
select pub_name,title from titles,publishers where publishers.pub_id=titles.pub_id
/*2)ʹ��������authors��titleauthor��titles���в�ѯ���������ߵ���,������д������*/
select au_lname as"��",au_fname as"��",title as"����"from authors as a,titleauthor as b,titles as c 
where a.au_id=b.au_id and b.title_id=c.title_id
/*����*/
select distinct au_lname as"��",au_fname as"��"from authors as a,titleauthor as b
where a.au_id=b.au_id
/*5,�õ�����Ĳ�ѯ���*/

/*1)�������ߵ���,��,�绰����,����������,������*/
select au_lname,au_fname,phone from authors order by au_lname,au_fname
/*2)������������ļ۸�,������ɴ�С����*/
select title,price from titles order by price desc
/*����*/
select title,price from titles order by price
select title,ytd_sales from titles order by ytd_sales desc

/*6,ʹ�ú�������*/

/*1)�г��ж�������*/
select distinct type from titles
select count(a.type) from (select distinct type from titles) as a
/*2)�г��ж�����Ķ���*/
select count(a.price) from (select distinct price from titles) as a
/*3)�г������͵����������*/
select title,price from titles where price=(select MIN(price) from titles)
/*4)�г������ߵ����������*/
select title,price from titles where price=(select MAX(price) from titles)
/*5)�г������������ܺ�*/
select sum(ytd_sales) from titles
/*����*/
select city,COUNT(*) from authors GROUP BY city
select au_lname,au_fname,COUNT(title_id) as '�鼮����' from authors a,titleauthor b
where a.au_id=b.au_id group by au_lname,au_fname