create database kolokvijvjezba3;
use kolokvijvjezba3;

create table svekar(
	sifra int not null primary key identity(1,1),
	novcica decimal(16,8) not null,
	suknja varchar(44) not null,
	bojakose varchar(36) null,
	prstena int null,
	narukvica int not null,
	cura int not null
);
create table ostavljena(
	sifra int not null primary key identity(1,1),
	kuna decimal(17,5) null,
	lipa decimal (15,6) null,
	majica varchar(36) null,
	modelnaocala varchar(31) not null,
	prijatelj int null
);
create table cura(
	sifra int not null primary key identity(1,1),
	dukserica varchar(49) null,
	maraka decimal(13,7) null,
	drugiputa datetime null,
	majica varchar(49) null,
	novcica decimal(15,8) null,
	ogrlica int not null
);
create table snasa(
	sifra int not null primary key identity(1,1),
	introvertno bit null,
	kuna decimal(15,6) not null,
	eura decimal (12,9) not null,
	treciputa datetime null,
	ostavljena int not null
);
create table prijatelj(
	sifra int not null primary key identity(1,1),
	kuna decimal(16,10) null,
	haljina varchar(37) null,
	lipa decimal(13,10) null,
	dukserica varchar(31) null,
	indiferentno bit not null
);
create table punica(
	sifra int not null primary key identity(1,1),
	asocijalno bit null,
	kratkamajica varchar(44) null,
	kuna decimal(13,8) not null,
	vesta varchar(32) not null,
	snasa int null
);
create table prijatelj_brat(
	sifra int not null primary key identity(1,1),
	prijatelj int not null,
	brat int not null
);
create table brat(
	sifra int not null primary key identity(1,1),
	jmbag char(11) null,
	ogrlica int not null,
	ekstrovertno bit not null
);

alter table svekar add foreign key (cura) references cura (sifra);
alter table punica add foreign key (snasa) references snasa (sifra);
alter table snasa add foreign key (ostavljena) references ostavljena (sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj (sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj (sifra);
alter table prijatelj_brat add foreign key (brat) references brat (sifra);

select * from snasa;
select * from ostavljena;
select * from prijatelj;
select * from prijatelj_brat;
select * from brat;

insert into prijatelj(kuna,haljina,lipa,dukserica,indiferentno)
values (23.56,'crna',23.67,'plava',1),
(34.65,'bijela',12.34,'cnra',2),
(12.56,'zelena',34.66,'bijela',1);
insert into ostavljena(kuna,lipa,majica,modelnaocala,prijatelj)
values (23.32,12.35,'zelena','papiri',1),
(12.56,15.32,'plava','nanini',2),
(34.78,15.87,'zuta','jonani',3);
insert into snasa(introvertno,kuna,eura,treciputa,ostavljena)
values (1,13.67,34.67,'2021-04-21',1),
(2,34.65,23.76,'2023-09-03',2),
(1,12.56,34.67,'2020-11-11',3);
insert into brat (jmbag,ogrlica,ekstrovertno)
values (00934512345,3,1),
(12355612367,2,2),
(22256733212,1,1);
insert into prijatelj_brat(prijatelj,brat)
values (1,3),
(2,1),
(3,2);

select * from svekar;
update svekar set suknja='Osijek';

delete punica where kratkamajica='AB';

select a.ekstrovertno, f.vesta, e.kuna
from brat a inner join prijatelj_brat b on a.sifra=b.brat
inner join prijatelj c on b.prijatelj=c.sifra
inner join ostavljena d on c.sifra=d.prijatelj
inner join snasa e on d.sifra=e.ostavljena
inner join punica f on e.sifra=f.snasa
where d.lipa !91 and c.haljina like 'BA%' order by 2;