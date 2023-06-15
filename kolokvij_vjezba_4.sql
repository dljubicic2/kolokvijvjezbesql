create database kolokvijvjezba4;
use kolokvijvjezba4;

create table punac(
	sifra int not null primary key identity (1,1),
	triciputa datetime null,
	majica varchar(46) null,
	jmbag char(11) not null,
	novcica decimal(18,7) not null,
	maraka decimal(12,6) not null,
	ostavljen int not null
);
create table ostavljen(
	sifra int not null primary key identity (1,1),
	modelnaocala varchar(43) null,
	introvertno bit null,
	kuna decimal(14,10) null
);
create table snasa(
	sifra int not null primary key identity (1,1),
	introvertno bit null,
	treciputa datetime null,
	haljina varchar(44) not null,
	zena int not null
);
create table becar(
	sifra int not null primary key identity (1,1),
	novcica decimal(14,8) null,
	kratkamajica varchar(49) not null,
	bojaociju varchar(36) not null,
	snasa int not null
);
create table prijatelj(
	sifra int not null primary key identity (1,1),
	eura decimal(16,9) null,
	prstena int not null,
	gustoca decimal(16,5) null,
	jmbag char(11) not null,
	suknja varchar(47) not null,
	becar int not null
);
create table zena(
	sifra int not null primary key identity (1,1),
	suknja varchar(39) not null,
	lipa decimal(18,7) null,
	prstena int not null
);
create table zena_mladic(
	sifra int not null primary key identity (1,1),
	zena int not null,
	mladic int not null
);
create table mladic(
	sifra int not null primary key identity (1,1),
	kuna decimal(15,9) null,
	lipa decimal(18,5) null,
	nausnica int null,
	stilifrizura varchar(49) null,
	vesta varchar(34) not null
);

alter table punac add foreign key (ostavljen) references ostavljen (sifra);
alter table becar add foreign key (snasa) references snasa (sifra);
alter table prijatelj add foreign key (becar) references becar (sifra);
alter table snasa add foreign key (zena) references zena (sifra);
alter table zena_mladic add foreign key (zena) references zena (sifra);
alter table zena_mladic add foreign key (mladic) references mladic (sifra);

select * from becar;
select * from snasa;
select * from zena;
select * from zena_mladic;
select * from mladic;

insert into zena(suknja,lipa,prstena)
values ('plava',12.54,2),
('zelena',14.67,1),
('bijela',45.67,3);
insert into snasa(introvertno,treciputa,haljina,zena)
values (1,'2022-03-03','crna',1),
(2,'2023-09-12','bijela',2),
(1,'2010-09-15','plava',3);
insert into becar(novcica,kratkamajica,bojaociju,snasa)
values (13.67,'plava','zelene',1),
(12.76,'crna','plave',2),
(34.78,'bijela','crvene',3);
insert into mladic(kuna,lipa,nausnica,stilifrizura,vesta)
values (45.23,45.67,2,'velika','plava'),
(34.56,23.56,3,'mala','crna'),
(12.45,54.67,1,'velika','bijela');
insert into zena_mladic(zena,mladic)
values (1,2),
(2,3),
(1,3);

update punac set majica='Osijek';

delete prijatelj where prstena>17;

select * from snasa where haljina is not null;

select a.nausnica, e.jmbag, e.kratkamajica
from mladic a inner join zena_mladic b on a.sifra=b.mladic
inner join zena c on b.zena=c.sifra
inner join snasa d on c.sifra=d.zena
inner join becar e on c.sifra=e.snasa
inner join prijatelj f on d.sifra=e.becar
where d.treciputa is null and c.lipa ! 29 order by 2;

select lipa,prstena from zena
where sifra is not in zena_mladic;
