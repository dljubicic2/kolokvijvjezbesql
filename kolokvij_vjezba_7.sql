create database kolokvijvjezba7;
use kolokvijvjezba7;

create table zarucnik_mladic(
	sifra int not null primary key identity(1,1),
	zarucnik int not null,
	mladic int not null
);
create table mladic(
	sifra int not null primary key identity(1,1),
	prstena int null,
	lipa decimal(19,5) not null,
	narukvica int not null,
	drugiputa datetime not null
);
create table ostavljen(
	sifra int not null primary key identity(1,1),
	lipa decimal(14,8) null,
	introvertno bit not null,
	kratkamajica varchar(38) not null,
	prstena int not null,
	zarucnik int null
);
create table zarucnik(
	sifra int not null primary key identity(1,1),
	vesta varchar(34) null,
	asocijalno bit not null,
	modelnaocala varchar(43) null,
	narukvica int not null,
	novcica decimal(15,5) not null
);
create table sestra(
	sifra int not null primary key identity(1,1),
	bojakose varchar(34) not null,
	hlace varchar(36) not null,
	lipa decimal(15,6) null,
	stilifrizura varchar(40) not null,
	maraka decimal(12,8) not null,
	prijateljica int null
);
create table prijateljica(
	sifra int not null primary key identity(1,1),
	haljina varchar(45) null,
	gustoca decimal(15,10) not null,
	ogrlica int null,
	novcica decimal(12,5) null,
	ostavljen int null
);
create table punica(
	sifra int not null primary key identity(1,1),
	majica varchar(40) null,
	eura decimal(12,6) not null,
	prstena int null,
	cura int not null
);
create table cura(
	sifra int not null primary key identity(1,1),
	lipa decimal(12,5) not null,
	introvertno bit null,
	modelhlaca varchar(42) null,
	nrukvica int null,
	treciputa datetime null,
	kuna decimal(14,9) null
);

alter table zarucnik_mladic add foreign key (mladic) references mladic (sifra);
alter table zarucnik_mladic add foreign key (zarucnik) references zarucnik (sifra);
alter table ostavljen add foreign key (zarucnik) references zarucnik (sifra);
alter table prijateljica add foreign key (ostavljen) references ostavljen (sifra);
alter table sestra add foreign key (prijateljica) references prijateljica (sifra);

select * from prijateljica;
select * from ostavljen;
select * from zarucnik;
select * from zarucnik_mladic;
select * from mladic;

insert into zarucnik(vesta,asocijalno,modelnaocala,narukvica,novcica)
values ('plava',1,'armani',2,23.56),
('crna',2,'jojo',3,23.67),
('bijela',1,'mama',3,56.34);
insert into ostavljen(lipa,introvertno,kratkamajica,prstena,zarucnik)
values (23.56,1,'crvena',2,1),
(34.67,2,'plava',1,2),
(56.89,1,'zelena',2,3);
insert into prijateljica(haljina,gustoca,ogrlica,novcica,ostavljen)
values ('crna',23.45,2,23.45,1),
('bijela',12.34,1,34.56,2),
('plava',34.56,2,12.34,3);
insert into mladic(prstena,lipa,narukvica,drugiputa)
values (2,12.45,2,'2022-04-14'),
(1,45.67,3,'2023-05-07'),
(2,23.67,2,'2022-09-11');
insert into zarucnik_mladic(zarucnik,mladic)
values (1,2),
(2,3),
(1,3);

update punica set eura=15.77;

delete sestra where hlace < 'AB';

select * from ostavljen where introvertno is not null;

select a.narukvica,f.stilifrizura,e.gustoca
from mladic a inner join zarucnik_mladic b on a.sifra=b.mladic
inner join zarucnik c on b.zarucnik=c.sifra
inner join ostavljen d on c.sifra=d.zarucnik
inner join prijateljica e on d.sifra=e.ostavljen
inner join sestra f on e.sifra=f.prijateljica
where d.introvertno is null and c.asocijalno is null order by 2;

select from zarucnik.asocijalno, zarucnik.modelnaocala from zarucnik
where sifra not in (select zarucnik from zarucnik_mladic);
