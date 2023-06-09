create database kolokvijvjezba1;
use kolokvijvjezba1;

create table sestra(
	sifra int not null primary key identity (1,1),
	introvertno bit null,
	haljina varchar(31) not null,
	maraka decimal (16,6) null,
	hlace varchar(46) not null,
	narukvica int not null
);
create table punac(
	sifra int not null primary key identity (1,1),
	ogrlica int null,
	gustoca decimal(14,9) null,
	hlace varchar(41) not null
);
create table zena(
	sifra int not null primary key identity (1,1),
	treciputa datetime null,
	hlace varchar(46) null,
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(46) null,
	sestra int not null
);
create table cura(
	sifra int not null primary key identity (1,1),
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal (13,10) null,
	ogrlica int not null,
	bojakose varchar(38) null,
	suknja varchar(36) null,
	punac int null
);
create table sestra_svekar(
	sifra int not null primary key identity (1,1),
	sestra int not null,
	svekar int not null
);
create table muskarac(
	sifra int not null primary key identity (1,1),
	bojaociju varchar(50) not null,
	hlace varchar(30) null,
	modelnaocala varchar(43) null,
	maraka decimal(14,5) not null,
	zena int not null
);
create table svekar(
	sifra int not null primary key identity (1,1),
	bojaociju varchar(40) not null,
	prstena int null,
	dukserica varchar(41) null,
	lipa decimal(13,8) null,
	eura decimal(12,7) null,
	majica varchar(35) null
);
create table mladic(
	sifra int not null primary key identity (1,1),
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiputa datetime null,
	asocijalno bit null,
	ekstroventno bit not null,
	dukserica varchar(46) not null,
	muskarac int null
);

alter table zena add foreign key (sestra) references sestra (sifra);
alter table cura add foreign key (punac) references punac (sifra);
alter table sestra_svekar add foreign key (sestra) references sestra (sifra);
alter table muskarac add foreign key (zena) references zena (sifra);
alter table sestra_svekar add foreign key (svekar) references svekar (sifra);
alter table mladic add foreign key (muskarac) references muskarac (sifra);

select * from sestra;

insert into sestra(introvertno,haljina,maraka,hlace,narukvica)
values (1,'plava',18.2,'crne',1),
(2,'roza',15.2,'bijela',2),
(1,'crna',13.5,'plava',3);

select * from zena;

insert into zena(treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra)
values ('2023-05-02','plave','bijela',09930955623,'zelene','bijela',4),
('2023-07-09','crne','roza',55678912367,'plave','crna',2),
('2023-01-06','plave','bijela',88734590034,'smedje','roza',3);

select * from muskarac;

insert into muskarac(bojaociju,hlace,modelnaocala,maraka,zena)
values ('zelene','plave','armani',18.4,3),
('plave','crne','banani',12.5,4),
('smedje','zute','jovani',13.2,5);

select * from svekar;

insert into svekar(bojaociju,prstena,dukserica,lipa,eura,majica)
values ('zelene',8,'plava',16.2,15.6,'crna'),
('plave',6,'crna',13.4,6.8,'plava'),
('zelene',2,'zuta',12.5,6.8,'zelena');

select * from sestra_svekar;

insert into sestra_svekar(sestra,svekar)
values (2,1),
(4,3),
(3,2);

update cura set gustoca=15.77
where sifra=1;

delete from mladic set kuna>15.78
where sifra=1;

select * from zena where
kratkamajica like 'ana%';

select a.dukserica, f.asocijalno, e.hlace
from svekar a inner join sestra_svekar b on a.sifra=b.svekar
inner join sestra c on b.sestra=c.sifra
inner join zena d on c.sifra=d.sestra
inner join muskarac e on d.sifra=e.zena
inner join mladic f on e.sifra=f.muskarac
where d.hlace like 'a%' and c.haljina like 'ba%' order by 2;


