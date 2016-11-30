  /*1,无条件查询*/

/*1)查找pub库中authors表的全部信息*/
select * from dbo.authors
/*2)查找其它样例表中全部信息*/
select * from dbo.discounts
select * from dbo.jobs
select * from dbo.pub_info
select * from dbo.publishers
select * from dbo.roysched
select * from dbo.sales
select * from dbo.stores
select * from dbo.titleauthor
select * from dbo.titles

/*2,简单条件查询*/

/*1)查找titles表中全部书号及书名*/
select title_id as "书号",title as "书名"from dbo.titles
/*2)查找titles表中价格在15~18元之间的书的书名*/
select title as "书名"from dbo.titles where price>=15 and price<=18
/*3)查找titles表中书号以T开头的书号及书名*/
select title_id as "书号",title as "书名"from dbo.titles where title like 'T%'
/*4)对其他样例表构造各种简单查询条件，进行查询*/
select au_lname,au_fname,phone from authors where city = 'Oakland'

/*3,多条件查询*/

/*1)查找书名起始字符为T，价格小于16元的书名及价格*/
select title as "书名",price as "价格" from dbo.titles where title like 'T%' and price<16
/*2)查找书名起始字符不为T，价格大于16元的书号书名及价格*/
select title_id as "书号",title as "书名",price as "价格" from dbo.titles where title not like 'T%' and price>16
/*3)对其他样例表构造多个查询条件，进行查询*/
select stor_name ,stor_address from stores where city='Portland' and stor_name='Bookbeat'

/*4,用连接操作（或嵌套查询）进行查询*/

/*1)使用样例表titles，publishers进行查询：查找出版社的名称以及所出的书名*/
select pub_name,title from titles,publishers where publishers.pub_id=titles.pub_id
/*2)使用样例表authors，titleauthor，titles进行查询：查找作者的姓,名和所写的书名*/
select au_lname as"姓",au_fname as"名",title as"书名"from authors as a,titleauthor as b,titles as c 
where a.au_id=b.au_id and b.title_id=c.title_id
/*其它*/
select distinct au_lname as"姓",au_fname as"名"from authors as a,titleauthor as b
where a.au_id=b.au_id
/*5,得到排序的查询结果*/

/*1)查找作者的姓,名,电话号码,并按作者姓,名排序*/
select au_lname,au_fname,phone from authors order by au_lname,au_fname
/*2)查找书名和书的价格,按书价由大到小排列*/
select title,price from titles order by price desc
/*其它*/
select title,price from titles order by price
select title,ytd_sales from titles order by ytd_sales desc

/*6,使用函数查找*/

/*1)列出有多少类书*/
select distinct type from titles
select count(a.type) from (select distinct type from titles) as a
/*2)列出有多少书的定价*/
select count(a.price) from (select distinct price from titles) as a
/*3)列出书价最低的书名和书价*/
select title,price from titles where price=(select MIN(price) from titles)
/*4)列出书价最高的书名和书价*/
select title,price from titles where price=(select MAX(price) from titles)
/*5)列出当年销量的总和*/
select sum(ytd_sales) from titles
/*其它*/
select city,COUNT(*) from authors GROUP BY city
select au_lname,au_fname,COUNT(title_id) as '书籍数量' from authors a,titleauthor b
where a.au_id=b.au_id group by au_lname,au_fname