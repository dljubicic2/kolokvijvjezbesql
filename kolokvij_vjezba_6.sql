create database kolokvijvjezba6;
use kolokvijvjezba6;

create table prijatelj(
	sifra int not null primary key identity (1,1),
	haljina varchar(35) null,
	prstena int not null,
	introvertno bit null,
	stilifrizura varchar(36) not null
);
create table svekrva(
	sifra int not null primary key identity (1,1),
	hlace varchar(48) not null,
	suknja varchar(47) not null,
	ogrlica int not null,
	treciputa datetime not null,
	dukserica varchar(32) not null,
	narukvica int not null,
	punac int null
);
create table brat(
	sifra int not null primary key identity (1,1),
	nausnica int not null,
	treciputa datetime not null,
	narukvica int not null,
	hlace varchar(31) null,
	prijatelj int null
);
create prijatelj_ostavljena(
	sifra int not null primary key identity (1,1),
	prijatelj int not null,
	ostavljena int not null
);
create table punac(
	sifra int not null primary key identity (1,1),
	ekstrovertno bit not null,
	suknja varchar(30) not null,
	majica varchar(44) not null,
	prviputa datetime not null
);
create table ostavljena(
	sifra int not null primary key identity (1,1),
	prviputa datetime not null,
	kratkamajica varchar(39) not null,
	drugiputa datetime null,
	maraka decimal(14,10) null
);
create table decko(
	sifra int not null primary key identity (1,1),
	prviputa datetime null,
	modelnaocala varchar(41) null,
	nausnice int null,
	zena int not null
);
create table zena(
	sifra int not null primary key identity (1,1),
	novcica decimal(14,8) not null,
	narukvica int not null,
	duskerica varchar(40) not null,
	haljina varchar(30) null,
	hlace varchar(32) not null,
	brat int not null
);

alter table prijatelj_ostavljena add foreign key (prijatelj) references prijatelj (sifra);
alter table brat add foreign key (prijatelj) references prijatelj (sifra);
alter table svekrva add foreign key (punac) references punac(sifra);
alter table prijatelj_ostavljena add foreign key (ostavljena) references ostavljena (sifra);
alter table zena add foreign key (brat) references brat (sifra);
alter table decko add foreign key (zena) references zena (sifra);

select * from zena;
select * from brat;
select * from prijatelj;
select * from ostavljena;
select * from prijatelj_ostavljena

insert into prijatelja(haljina,prstena,introvertno,stilifrizura)
values ('plava',2,1,'ravno'),
('crna',1,2,'slijepo'),
('crvena',2,1,'ravno');
insert into brat(nausnica,treciputa,narukvica,hlace,prijatelj)
values (2,'2022-09-23',2,'plave',1),
(1,'2023-04-2',2,'crvene',2),
(3,'2021-09-23',2,'crne',3);
insert into zena(novcica,nraukvica,dukserica,haljina,hlace,brat)
values (23.34,2,'plava','crna','bijele',1),
(24.78,'crna','bijela','zelene',2),
(56.34,'zelena','crvena','crne',3);
insert into ostavljena(prviputa,kratkamajica,drugiputa,maraka)
values ('2021-11-23','bijela','2023-09-12',23.45),
('2023-02-02','crna','2023-09-05',45.23),
('2021-03-15','zelena','2023-11-07',56.89);
insert into prijatelj_ostavljena(prijatelj,ostavljena)
values (1,2),
(2,3),
(3,1);

update svekrva set suknja='Osijek';

delete decko where modelnaocala<AB;

select * from brat 
where narukvica is not null;

select a.drugiputa,f.zena,e.narukvica
from ostavljena a inner join prijatelj_ostavljena b on a.sifra=b.ostavljena
inner join prijatelj c on b.prijatelj=c.sifra
inner join brat d on c.sirfa=d.prijatelj
inner join zena e on d.sifra=e.brat
inner join decko f on e.sifra=f.zena
where d.treciputa is null and c.prstena=219 order by 2;