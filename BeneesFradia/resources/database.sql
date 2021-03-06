Drop table ABC_USERS
/
Drop table Proposals
/
Drop table Messages
/
Drop table Queries
/
Drop SEQUENCE proposalid_sequence
/
Drop SEQUENCE messageid_sequence
/
Drop SEQUENCE queryid_sequence
/

Create table ABC_USERS( 
Username Varchar2(20)  primary key Not Null,
Password Varchar2(20)  Not Null, 
TeamName Varchar2(20)  Not Null,
MobileNumber Varchar2(10)
)
/

Create table Proposals ( 
proposalid Number(6) primary key, 
filename Varchar2(50) not null,
fileData blob,
companyname Varchar2(20),
teamname Varchar2(20),
proposaldate Date
)
/

Create table Queries ( 
queryid Number(6) primary key, 
sender Varchar2(20) not null,
receiver Varchar2(20) not null,
query Varchar2(100) not null,
reply Varchar2(200) ,
queryDate Date
)
/

Create table Messages ( 
messageid Number(6) primary key, 
sender Varchar2(20) not null,
receiver Varchar2(20) not null,
message Varchar2(100) not null,
messageDate Date
)
/

Create sequence proposalid_sequence start with 1 increment by 1
/

Create sequence queryid_sequence start with 1 increment by 1
/

Create sequence messageid_sequence start with 1 increment by 1
/

INSERT INTO ABC_USERS VALUES('beneesfradia', 'ncSrK124', 'BeneesFradia', '9876543210')
/
INSERT INTO ABC_USERS VALUES('benefitscards', 'urKhW654', 'BenefitsCards', '9876543210')
/
INSERT INTO ABC_USERS VALUES('borasys', 'oiHlG638', 'BoraSys', '9876543210')
/
INSERT INTO ABC_USERS VALUES('financialexpert', 'nmHaJ983', 'FinancialExpert', '9876543210')
/
INSERT INTO ABC_USERS VALUES('quickgunheadley', 'lkWsF728', 'QuickgunHeadley', '9876543210')
/
INSERT INTO ABC_USERS VALUES('silvertax', 'nfIuT028', 'SilverTax', '9876543210')
/
INSERT INTO ABC_USERS VALUES('unipro', 'qeRvX620', 'UniPro', '9876543210')
/

commit
/