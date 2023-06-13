create database kolokvijvjezba2;
use kolokvijvjezba2;

create table decko(
	sifra int not null primary key identity (1,1),
	indiferentno bit null,
	vrsta varchar(34) null,
	asocijalno bit not null
);
create table prijatelj(
	sifra int not null primary key identity (1,1),
	modelnaocala varchar(37) null,
	treciputa datetime not null,
	ekstrovertno bit not null,
	prviputa datetime null,
	svekar int not null
);
create table cura(
	sifra int not null primary key identity (1,1),
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38) null,
	narukvica int null,
	introvertno bit null,
	majica varchar(47) not null,
	decko int null
);
create table decko_zarucnica(
	sifra int not null primary key identity (1,1),
	decko int not null,
	zarucnica int not null
);
create table svekar(
	sifra int not null primary key identity (1,1),
	stilifrizura varchar(40) null,
	ogrlica int not null,
	asocijalno bit not null
);
create table zarucnica( 
	sifra int not null primary key identity (1,1),
	narukvica int null,
	bojakose varchar(37) not null,
	novcica decimal(15,9) null,
	lipa decimal(15,8) not null,
	indiferetno bit not null
);
create table brat(
	sifra int not null primary key identity (1,1),
	suknja varchar(47) null,
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);
create table neprijatelj(
	sifra int not null primary key identity (1,1),
	majica varchar(32) null,
	haljina varchar(43) not null,
	lipa decimal(16,8) null,
	modelnaocala varchar(49) not null,
	kuna decimal(12,6) not null,
	jmbag char(11) null,
	cura int null
);

alter table cura add foreign key (decko) references decko (sifra);
alter table decko_zarucnica add foreign key (decko) references decko (sifra);
alter table prijatelj add foreign key (svekar) references svekar (sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica (sifra);
alter table neprijatelj add foreign key (cura) references cura (sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);

select * from neprijatelj;
select * from cura;
select * from decko;
select * from zarucnica;
select * from decko_zarucnica;

insert into decko(indiferentno,vrsta,asocijalno)
values (1,'dobar',1),
(2,'los',2),
(1,'dobar',1);
insert into cura(haljina,drugiputa,suknja,narukvica,introvertno,majica,decko)
values('crna','2023-05-03','plava',2,1,'bijela',1),
('plava','2022-09-02','zelena',1,2,'crna',2),
('zelena','2021-04-01','plava',1,1,'roza',3);
insert into neprijatelj(majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values('zelena','plava',16.23,'armani',78.92,09912367890,1),
('plava','bijela',12.45,'jojo',23.45,12377890156,2),
('crna','plava',13.67,'moros',56.43,66799012367,3);
insert into zarucnica(narukvica,bojakose,novcica,lipa,indiferetno)
values (1,'crna',12.37,15.67,1),
(2,'plava',16.54,18.98,2),
(3,'smedja',12.67,11.89,3);
insert into decko_zarucnica(decko,zarucnica)
values(1,1),
(2,2),
(3,3);

update prijatelj set treciputa='2020-04-30';

select haljina from cura where
drugiputa is not null;

select a.novcica,f.neprijatelj,e.haljina
from zarucnica a inner join decko_zarucnica b on a.sifra=b.zarucnica
inner join decko c on b.decko=c.sifra
inner join cura d on c.sifra=d.decko
inner join neprijatelj e on d.sifra=e.cura
inner join brat f on e.sifra=f.neprijatelj
where d.drugiputa is null and c.vrsta like 'ba%' order by 2;

select vrsta,asocijalno from decko
where sifra 




