/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2016/10/24 10:37:12                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('College')
            and   type = 'U')
   drop table College
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Course')
            and   type = 'U')
   drop table Course
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CourseManage')
            and   type = 'U')
   drop table CourseManage
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Macourse')
            and   name  = '专业 to  专业课程_FK'
            and   indid > 0
            and   indid < 255)
   drop index Macourse."专业 to  专业课程_FK"
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Macourse')
            and   name  = '课程 to  专业课程_FK'
            and   indid > 0
            and   indid < 255)
   drop index Macourse."课程 to  专业课程_FK"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Macourse')
            and   type = 'U')
   drop table Macourse
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Major')
            and   type = 'U')
   drop table Major
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Province')
            and   type = 'U')
   drop table Province
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Reward')
            and   type = 'U')
   drop table Reward
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Reward_jl')
            and   name  = 'Relationship_18_FK'
            and   indid > 0
            and   indid < 255)
   drop index Reward_jl.Relationship_18_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Reward_jl')
            and   type = 'U')
   drop table Reward_jl
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SeCourse')
            and   type = 'U')
   drop table SeCourse
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Socialrelations')
            and   type = 'U')
   drop table Socialrelations
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Student')
            and   type = 'U')
   drop table Student
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Stuzi')
            and   type = 'U')
   drop table Stuzi
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Teacher')
            and   type = 'U')
   drop table Teacher
go

if exists (select 1
            from  sysobjects
           where  id = object_id('University')
            and   type = 'U')
   drop table University
go

if exists (select 1
            from  sysobjects
           where  id = object_id('nation')
            and   type = 'U')
   drop table nation
go

if exists (select 1
            from  sysobjects
           where  id = object_id('zizhu')
            and   type = 'U')
   drop table zizhu
go

/*==============================================================*/
/* Table: College                                               */
/*==============================================================*/
create table College (
   Cno                  char(2)              not null,
   Uno                  char(4)              not null,
   Cname                varchar(30)          not null,
   constraint PK_COLLEGE primary key nonclustered (Cno)
)
go

/*==============================================================*/
/* Table: Course                                                */
/*==============================================================*/
create table Course (
   Cono                 char(2)              not null,
   Coname               varchar(30)          not null,
   Credit               numeric(4,2)         null,
   constraint PK_COURSE primary key nonclustered (Cono)
)
go

/*==============================================================*/
/* Table: CourseManage                                          */
/*==============================================================*/
create table CourseManage (
   Teno                 char(2)              not null,
   Cono                 char(2)              not null,
   classroom            varchar(30)          null,
   constraint PK_COURSEMANAGE primary key nonclustered (Teno, Cono)
)
go

/*==============================================================*/
/* Table: Macourse                                              */
/*==============================================================*/
create table Macourse (
   Cono                 char(2)              not null,
   Mno                  char(2)              not null,
   Msemester            int                  not null,
   constraint PK_MACOURSE primary key nonclustered (Cono, Mno, Msemester)
)
go

/*==============================================================*/
/* Index: "课程 to  专业课程_FK"                                      */
/*==============================================================*/
create index "课程 to  专业课程_FK" on Macourse (
Cono ASC
)
go

/*==============================================================*/
/* Index: "专业 to  专业课程_FK"                                      */
/*==============================================================*/
create index "专业 to  专业课程_FK" on Macourse (
Mno ASC
)
go

/*==============================================================*/
/* Table: Major                                                 */
/*==============================================================*/
create table Major (
   Mno                  char(2)              not null,
   Cno                  char(2)              not null,
   Mname                varchar(30)          not null,
   constraint PK_MAJOR primary key nonclustered (Mno)
)
go

/*==============================================================*/
/* Table: Province                                              */
/*==============================================================*/
create table Province (
   Pno                  char(2)              not null,
   Pname                varchar(50)          not null,
   constraint PK_PROVINCE primary key nonclustered (Pno)
)
go

/*==============================================================*/
/* Table: Reward                                                */
/*==============================================================*/
create table Reward (
   Rno                  char(4)              not null,
   Rname                varchar(30)          not null,
   Rintro               varchar(100)         null,
   constraint PK_REWARD primary key nonclustered (Rno)
)
go

/*==============================================================*/
/* Table: Reward_jl                                             */
/*==============================================================*/
create table Reward_jl (
   Recno                char(8)              not null,
   Sno                  char(12)             not null,
   Rno                  char(4)              not null,
   constraint PK_REWARD_JL primary key nonclustered (Recno)
)
go

/*==============================================================*/
/* Index: Relationship_18_FK                                    */
/*==============================================================*/
create index Relationship_18_FK on Reward_jl (
Rno ASC
)
go

/*==============================================================*/
/* Table: SeCourse                                              */
/*==============================================================*/
create table SeCourse (
   Teno                 char(2)              not null,
   Cono                 char(2)              not null,
   Sno                  char(12)             not null,
   semester             int                  not null,
   score                float                null,
   S_score              float                null,
   constraint PK_SECOURSE primary key nonclustered (Teno, Cono, Sno, semester)
)
go

/*==============================================================*/
/* Table: Socialrelations                                       */
/*==============================================================*/
create table Socialrelations (
   Sno                  char(12)             not null,
   Relations            varchar(20)          not null,
   Telphone             char(11)             not null,
   Adress               varchar(50)          null,
   constraint PK_SOCIALRELATIONS primary key nonclustered (Sno, Relations)
)
go

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student (
   Sno                  char(12)             not null,
   Nano                 char(2)              not null,
   Mno                  char(2)              null,
   Pno                  char(2)              null,
   Sname                varchar(30)          not null,
   Sex                  char(2)              not null,
   Birthday             datetime             null,
   Resume               varchar(100)         not null,
   constraint PK_STUDENT primary key nonclustered (Sno)
)
go

/*==============================================================*/
/* Table: Stuzi                                                 */
/*==============================================================*/
create table Stuzi (
   Shouno               char(8)              not null,
   Zno                  char(4)              null,
   Sno                  char(12)             null,
   constraint PK_STUZI primary key nonclustered (Shouno)
)
go

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher (
   Teno                 char(2)              not null,
   Cno                  char(2)              not null,
   Tename               varchar(50)          not null,
   age                  int                  null,
   money                float                not null,
   constraint PK_TEACHER primary key nonclustered (Teno)
)
go

/*==============================================================*/
/* Table: University                                            */
/*==============================================================*/
create table University (
   Uno                  char(4)              not null,
   Uname                varchar(30)          not null,
   constraint PK_UNIVERSITY primary key nonclustered (Uno)
)
go

/*==============================================================*/
/* Table: nation                                                */
/*==============================================================*/
create table nation (
   Nano                 char(2)              not null,
   Naname               varchar(30)          not null,
   constraint PK_NATION primary key nonclustered (Nano)
)
go

/*==============================================================*/
/* Table: zizhu                                                 */
/*==============================================================*/
create table zizhu (
   Zno                  char(4)              not null,
   Zname                varchar(30)          not null,
   Zintro               varchar(100)         null,
   constraint PK_ZIZHU primary key nonclustered (Zno)
)
go

