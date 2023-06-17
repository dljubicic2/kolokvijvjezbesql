create database kolokvijvjezba5;
use kolokvijvjezba5;

create table mladic(
	sifra int not null primary key identity (1,1),
	kratkamajica varchar(49) not null,
	haljina varchar(30) not null,
	asocijalno bit null,
	zarucnik int null
);
create table zarucnik(
	sifra int not null primary key identity (1,1),
	jmbag char(11) null,
	lipa decimal(12,8) null,
	indiferentno bit not null
);
create table svekar(
	sifra int not null primary key identity (1,1),
	bojakose varchar(33) null,
	majica varchar(31) null,
	carape varchar(31) not null,
	haljina varchar(43) null,
	narukvica int null,
	eura decimal(14,5) not null
);
create table punac(
	sifra int not null primary key identity (1,1),
	duskerica varchar(32) null,
	prviputa datetime not null,
	majica varchar(38) null,
	svekar int not null
);
create table svekar_cura(
	sifra int not null primary key identity (1,1),
	svekar int not null,
	cura int not null
);
create table cura(
	sifra int not null primary key identity (1,1),
	carape varchar(11) not null,
	maraka decimal (10,7) not null,
	asocijalno bit null,
	vesta varchar(17) not null
);
create table ostavljena(
	sifra int not null primary key identity (1,1),
	majica varchar(33) null,
	ogrlica int not null,
	carape varchar(44) null,
	stilifrizura varchar(42) null,
	punica int not null
);
create table punica(
	sifra int not null primary key identity (1,1),
	hlace varchar(43) not null,
	nausnica int not null,
	oglica int null,
	vesta varchar(41) not null,
	treciputa datetime not null,
	punac int not null
);

alter table mladic add foreign key (zarucnik) references zarucnik (sifra);
alter table punac add foreign key (svekar) references svekar (sifra);
alter table svekar_cura add foreign key (svekar) references svekar (sifra);
alter table svekar_cura add foreign key (cura) references cura (sifra);
alter table punica add foreign key (punac) references punac (sifra);
alter table ostavljena add foreign key (punica) references punica (sifra);

select * from punica;
select * from punac;
select * from svekar;
select * from svekar_cura;
select * from cura;

insert into svekar(bojakose,majica,carape,haljina,narukvica,eura)
values ('crna','plava','crne','bijela',2,11.25),
('smedja','crna','bijele','siva',1,12.34),
('bijela','siva','crne','plava',3,12.45);
insert into punac(duskerica,prviputa,majica,svekar)
values ('crna','2023-01-11','siva',1),
('bijela','2021-06-02','plava',2),
('crvena','2020-09-02','crna',3);
insert into punica (hlace,nausnica,oglica,vesta,treciputa,punac)
values ('plave',2,1,'crvena','2016-02-02',1),
('crne',2,2,'bijela','2010-07-12',2),
('crvene',3,1,'crna','2023-12-07',3);
insert into cura (carape,maraka,asocijalno,vesta)
values ('crne',23.56,1,'plava'),
('plave',12.32,2,'crna'),
('bijele',13.34,1,'bijela');
insert into svekar_cura(svekar,cura)
values (1,2),
(2,3),
(1,3);

update mladic set haljina='Osijek';

delete ostavljena where ogrlica=17;

select * from punac where prviputa is not null;

select a.asocijalno,f.stilifrizura,e.nausnica
from cura a inner join svekar_cura b on a.sifra=b.cura
inner join svekar c on b.svekar=c.sifra
inner join punac d on c.sifra=d.svekar
inner join punica e on d.sifra=e.punac
inner join ostavljena f on e.sifra=f.punica
where d.prviputa is null and d.majica like 'ba%';