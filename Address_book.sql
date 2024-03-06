create database addressbook_service;

use addressbook_service;
create table addressbook (
id int not null auto_increment,
firstname varchar(50),
lastnane varchar(50),
address varchar(50),
city varchar(50),
state varchar (50), zip varchar(50), phone varchar(50), email varchar(50),
primary key (id)
);
alter table addressbook
change column lastnane lastname varchar(50);
select * from addressbook;

insert into addressbook (firstname , lastname , address, city , state , zip , phone , email) values (
'Sahil', 'Khandekar', 'abc', 'Mumbai', 'Maharashtra', '400', '9082', 'sahil@'), 
('Pranav', 'Goyal', 'xyz', 'govandi', 'Panjab', '500', '4565', 'pranav@'), 
('Prajwal', 'Thete', 'efg', 'Mumbai', 'Maharashtra', '650', '9066','prajwal@');
SET SQL_SAFE_UPDATES = 0;

update addressbook 
set phone = '6533' where firstname = 'Sahil';
select firstname from addressbook where city = 'Mumbai';
select firstname from addressbook where state = 'Maharashtra';

select city , count(firstname) from addressbook group by city;
select firstname from addressbook where city = 'Mumbai' order by firstname ASC;

create table booktype (
addressbookname varchar(50), addressbooktype varchar(50));
insert into booktype (addressbookname,addressbooktype ) values ('MyFamily', 'Family'), ('MyFriends', 'Friend');
select * from booktype;
alter table booktype 
add primary key(addressbookname);

alter table addressbook 
add column addressbookname varchar(50),
add foreign key (addressbookname) references booktype(addressbookname);

update addressbook 
set addressbookname = 'MyFamily' where firstname = 'Sahil' or firstname = 'Prajwal'; 
update addressbook 
set addressbookname = 'MyFriends' where firstname = 'Pranav';
select * from addressbook;
select * from phonecode;
alter table phonecode 
add primary key (phone);
create table phonecode 
(phone varchar(50), phoneid varchar(50));
insert into phonecode (phone , phoneid) values ('4565','91' ), ('9066', '92'), ('6533', '022');
alter table addressbook
add foreign key (phone) references phonecode(phone);

create table email (email varchar(50), emailtype varchar(50),
primary key (email));
insert into email (email, emailtype) values ('sahil@', 'personal'), ('pranav@', 'official'), ('prajwal@', 'personal');
select * from email;
alter table addressbook 
add foreign key(email) references email(email);

select a.city, count(city) from addressbook as a 
left join email as e 
on a.email = e.email
group by city;