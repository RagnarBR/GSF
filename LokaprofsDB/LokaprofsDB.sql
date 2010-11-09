--====================================================================================================--
--			                         Gagnagrunnur Flugfélagsins FlyAir                                --
--====================================================================================================--

-- Gagnagrunnurinn hreinsaður ef vera kynni að í honum leyndust þessar töflur (gamlar útgáfur)
if exists (select * from sys.objects where object_id = OBJECT_ID(N'Flugsaetisbokun') AND type in (N'U'))
drop table Flugsaetisbokun
if exists (select * from sys.objects where object_id = OBJECT_ID(N'Flugbokun') AND type in (N'U'))
drop table Flugbokun
if exists (select * from sys.objects where object_id = OBJECT_ID(N'Saetaframbod') AND type in (N'U'))
drop table Saetaframbod
if exists (select * from sys.objects where object_id = OBJECT_ID(N'Flugsaeti') AND type in (N'U'))
drop table Flugsaeti
if exists (select * from sys.objects where object_id = OBJECT_ID(N'Flug') AND type in (N'U'))
drop table Flug
if exists (select * from sys.objects where object_id = OBJECT_ID(N'Greidandi') AND type in (N'U'))
drop table Greidandi

-- Töflur gagnagrunnsins smíðaðar
create table Greidandi   
(
	kennitala char(10) primary key,   
	fornafn varchar(55),
	eftirnafn varchar(55) not null,
)

create table Flug
(
	flugNumer char(6) primary key,
	flugvel varchar(45),
	flogidFra varchar(55) not null,
	flogidTil varchar(55) not null,
	brottfor time,
	flugtimi decimal(5,2)
)

create table Flugsaeti
(
	saetiID char(4) primary key,
	stadsetning char(6) check(stadsetning in('Gluggi','Gangur')),
)

create table Flugbokun
(
	bokunarNumer int identity(2000,10) primary key,
	dagsetningBokunar date,
	dagsetningFlugs date,
	verd money,
	flugNumer char(6) references Flug(flugNumer),
	kennitalaGreidanda char(10) references Greidandi(kennitala),
	unique(flugNumer,kennitalaGreidanda,dagsetningFlugs),
	check(dagsetningBokunar < dagsetningFlugs)
)


create table Flugsaetisbokun
(
	saetiID char(4) not null references Flugsaeti(saetiID),
	bokunarNumer int not null references Flugbokun(bokunarNumer),
	nafnFarthega varchar(75),
	primary key(saetiID,bokunarnumer)
)

--====================================================================================================--
--			                                 Gögn gagnagrunnsins                                      --
--====================================================================================================--
-- Flug
insert into Flug(flugNumer,flugvel,flogidFra,flogidTil,brottfor,flugtimi)
values('LOO151','TF_HAL','Reykjavík','Ísafjörður','08:00',0.45),
      ('LOO152','TF_HAL','Ísafjörður','Reykjavík','10:00',0.45),
      ('LOO234','TF_EGE','Reykjavík','Akureyri','12:15',0.55),
      ('LOO235','TF_EGE','Akureyri','Reykjavík','14:15',0.55),
      ('LOO345','TF_KNG','Reykjavík','Egilsstadir','09:50',1.05),
      ('LOO346','TF_KNG','Egilsstadir','Reykjavík','11:55',1.05),
      ('LOO567','TF_HAL','Reykjavík','Hornafjörður','15:00',0.55),
      ('LOO568','TF_HAL','Hornafjörður','Reykjavík','17:00',0.55),
      ('LOO668','TF_EGE','Reykjavík','Vestmannaeyjar','18:15',0.25),
      ('LOO669','TF_EGE','Vestmannaeyjar','Reykjavík','19:45',0.25)

-- Sæti
insert into Flugsaeti(saetiID,stadsetning)values('1A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('1B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('1C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('1D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('2A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('2B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('2C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('2D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('3A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('3B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('3C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('3D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('4A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('4B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('4C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('4D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('5A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('5B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('5C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('5D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('6A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('6B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('6C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('6D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('7A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('7B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('7C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('7D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('8A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('8B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('8C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('8D','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('9A','Gluggi')
insert into Flugsaeti(saetiID,stadsetning)values('9B','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('9C','Gangur')
insert into Flugsaeti(saetiID,stadsetning)values('9D','Gluggi')
-- greiðendur
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1212494593','Atli','Sigurðarson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2603684493','Axel','Jóhannsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1107739983','Benedikt Björgvin','Björnsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0410796533','Egill Þór','Sveinsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1706857613','Einar','Magnússon')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2411885643','Grétar Már','Kristjánsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0107662593','Guðmundur','Sigurðarson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2902567803','Gunnar','Hilmarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2308776543','Gunnar Sigurður','Traustason')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('3103598873','Hannes','Einarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1010693433','Helgi Árni','Garðarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0809559743','Hörður Logi','Sigurðarson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0808706593','Jóhann','Heiðarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2405810103','Jóhannes','Jónsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0311805603','Ólafur','Baldursson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2101775643','Ragnar Fannar','Birgisson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2109507783','Rúnar','Karlsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1504670983','Rúnar Logi','Ragnarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1106698743','Sigurður','Róbertsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0404817043','Sigurður Freyr','Hermannsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1710593613','Stefán Andri','Elvarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('3010784573','Sævar Guðni','Brekason')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0611794563','Tómas','Karlsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1912778313','Vignir','Baldursson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2109507813','Þórður Gísli','Egilsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1509872343','Arna Björg','Haraldsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0801408703','Auður','Brynjardóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1001738753','Auður Hrund','Óskarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0911849763','Dröfn Mist','Magnúsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1703569803','Erna','Heiðarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2504661183','Hanna Dröfn','Einarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0909706413','Harpa','Helgadóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2208563303','Helga','Jónsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0311397793','Hrefna Lind','Einarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2906786423','Hrund','Þorsteinsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1107597703','Hulda','Karlsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1405819353','Inga','Sigurðardóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0609849183','Ingibjörg','Gunnarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1312761403','Jónína','Haraldsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2704568953','Katrín Margrét','Snorradóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0206596723','Kristín','Pálsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1910668103','Kristín Mjöll','Halldórsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2201784833','Lára Björk','Arnarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0512806773','Margrét','Gunnarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1912876543','María Björk','Sigurðardóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1504658103','Sigríður','Ómarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0808558243','Sigríður','Steinarsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1703758953','Sigríður Hulda','Steinsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0906701133','Telma Björk','Kristjánsdóttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1111819593','Þóra Rut','Skúladóttir')
-- bókanir

insert into Flugbokun(dagsetningBokunar,dagsetningFlugs,flugNumer,verd,kennitalaGreidanda)
values('2009-12-28','2010-01-07','LOO345',11500,'0107662593'),	-- til Egilsstaða
      ('2009-12-30','2010-01-07','LOO345',23000,'0206596723'),
      ('2009-12-31','2010-01-07','LOO345',11500,'0311397793'),
      ('2010-01-02','2010-01-07','LOO345',11500,'0311805603'),
      ('2010-01-03','2010-01-07','LOO345',11500,'0404817043'),
      ('2010-01-03','2010-01-07','LOO345',11500,'0410796533'),
      ('2010-01-04','2010-01-07','LOO345',11500,'0512806773'),
      ('2010-01-05','2010-01-07','LOO345',11500,'0609849183'),
      ('2010-01-06','2010-01-07','LOO345',11500,'0611794563'),
      ('2010-01-06','2010-01-22','LOO567',39600,'0801408703'),	-- til Hornafjarðar  
      ('2010-01-06','2010-01-22','LOO567',9900,'0808558243'),
      ('2010-01-12','2010-01-22','LOO567',9900,'0808706593'),
      ('2010-01-19','2010-01-22','LOO567',9900,'0809559743'),
      ('2010-01-21','2010-01-22','LOO567',9900,'0906701133'),
      ('2010-01-22','2010-02-17','LOO151',20600,'0909706413'),	-- til Ísafjarðar
      ('2010-01-29','2010-02-17','LOO151',10300,'0911849763'),
      ('2010-02-02','2010-02-17','LOO151',10300,'1001738753'),
      ('2010-02-13','2010-02-17','LOO151',10300,'1010693433'),
      ('2010-02-13','2010-02-17','LOO151',10300,'1106698743'),
      ('2010-02-15','2010-02-17','LOO151',10300,'1107597703'),
      ('2010-02-16','2010-02-17','LOO151',10300,'1107739983'),
      ('2010-02-16','2010-02-17','LOO151',10300,'1111819593'),
      ('2010-01-29','2010-02-28','LOO346',11500,'1212494593'),	-- frá Egilsstöðum
      ('2010-01-29','2010-02-28','LOO346',11500,'1312761403'),
      ('2010-02-13','2010-02-28','LOO346',11500,'1405819353'),
      ('2010-02-14','2010-02-28','LOO346',11500,'1504658103'),
      ('2010-02-15','2010-02-28','LOO346',11500,'1504670983'),
      ('2010-02-16','2010-02-28','LOO346',23000,'1509872343'),
      ('2010-02-17','2010-02-28','LOO346',11500,'1703569803'),
      ('2010-02-17','2010-02-28','LOO346',11500,'1703758953'),
      ('2010-02-27','2010-03-03','LOO669',7200,'1706857613'),	-- frá Vestmannaeyjun
      ('2010-02-28','2010-03-03','LOO669',7200,'1710593613'),
      ('2010-03-01','2010-03-03','LOO669',7200,'1910668103'),
      ('2010-03-01','2010-03-03','LOO669',7200,'1912778313'),
      ('2010-03-02','2010-03-03','LOO669',7200,'2101775643'),
      ('2010-02-01','2010-03-03','LOO152',10300,'2109507783'),	-- frá Ísafirði
      ('2010-02-03','2010-03-03','LOO152',10300,'2109507813'),
      ('2010-02-05','2010-03-03','LOO152',10300,'2201784833'),
      ('2010-02-07','2010-03-03','LOO152',10300,'2208563303'),
      ('2010-02-10','2010-03-03','LOO152',10300,'2308776543'),
      ('2010-02-11','2010-03-03','LOO152',10300,'2405810103'),
      ('2010-02-16','2010-03-03','LOO152',30900,'2411885643'),
      ('2010-03-02','2010-03-03','LOO152',10300,'2504661183'),
      ('2010-03-02','2010-03-03','LOO152',10300,'2603684493'),
      ('2010-04-01','2010-04-19','LOO345',10900,'2704568953'),	-- til Egilsstaða
      ('2010-04-09','2010-04-19','LOO345',10900,'2902567803'),
      ('2010-04-09','2010-04-19','LOO345',10900,'2906786423'),
      ('2010-04-11','2010-04-19','LOO345',10900,'3010784573'),
      ('2010-04-17','2010-04-19','LOO345',10900,'3103598873'),
      ('2010-04-17','2010-04-19','LOO345',10900,'1912876543') 
 
-- sætisbókanir
insert into FLugsaetisbokun(saetiID,bokunarNumer,nafnFarthega)
values('1C',2140,'Harpa Helgadóttir'),
      ('1D',2140,'Diljá Helgadóttir'),
      ('2A',2150,'Dröfn Mist Magnúsdóttir'),
      ('2B',2160,'Auður Hrund Óskarsdóttir'),
      ('4D',2170,'Helgi Árni Garðarsson'),
	  ('5A',2180,'Sigurður Róbertsson'),
	  ('5C',2190,'Hulda Karlsdóttir'),
	  ('7B',2200,'Benedikt Björgvin Björnsson'),
	  ('8D',2210,'Þóra Rut Skúladóttir'),
	  ('1C',2350,'Rúnar Karlsson'),
	  ('2A',2360,'Þórður Gísli Egilsson'),
	  ('5A',2370,'Lára Björk Arnarsdóttir'),
	  ('7A',2380,'Helga Jónsdóttir'),
	  ('7C',2390,'Gunnar Sigurður Traustason'),
	  ('8A',2400,'Jóhannes Jónsson'),
	  ('8B',2410,'Grétar Már Kristjánsson'),
	  ('8C',2410,'Jóna Grétarsdóttir'),
	  ('8D',2410,'Arna Hannesdóttir  '),
	  ('9C',2420,'Hanna Dröfn Einarsdóttir'),
	  ('9D',2430,'Axel Jóhannsson'),
	  ('1C',2000,'Guðmundur Sigurðarson'),
	  ('3A',2010,'Kristín Pálsdóttir'),
	  ('3B',2010,'Jón Stefánsson'),
	  ('4A',2020,'Hrefna Lind Einarsdóttir'),
	  ('4C',2030,'Ólafur Baldursson'),
	  ('6A',2040,'Sigurður Freyr Hermannsson'),
	  ('6C',2050,'Egill Þór Sveinsson'),
	  ('6D',2060,'Margrét Gunnarsdóttir'),
	  ('7A',2070,'Ingibjörg Gunnarsdóttir'),
	  ('7B',2080,'Tómas Karlsson'),
	  ('7C',2440,'Katrín Margrét Snorradóttir'),
	  ('7D',2450,'Gunnar Hilmarsson'),
	  ('8A',2460,'Hrund Þorsteinsdóttir'),
	  ('8D',2470,'Sævar Guðni Brekason'),
	  ('9A',2480,'Hannes Einarsson'),
	  ('9D',2490,'María Björk Sigurðardóttir'),
	  ('1A',2220,'Atli Sigurðarson'),
	  ('1D',2230,'Jónína Haraldsdóttir'),
	  ('3A',2240,'Inga Sigurðardóttir'),
	  ('3D',2250,'Sigríður Ómarsdóttir'),
	  ('7B',2260,'Rúnar Logi Ragnarsson'),
	  ('7C',2270,'Arna Björg Haraldsdóttir'),
	  ('7D',2270,'Þormar Geir Elíasson'),
	  ('8B',2280,'Erna Heiðarsdóttir'),
	  ('9A',2290,'Sigríður Hulda Steinsdóttir'),
	  ('2A',2090,'Sigurður Kolka'),
	  ('2B',2090,'Auður Brynjarsdóttir'),
	  ('2C',2090,'Guðríður Kolka'),
	  ('2D',2090,'Sigurpáll Kolka'),
	  ('3C',2100,'Sigríður Steinarsdóttir'),
	  ('4A',2110,'Jóhann Heiðarsson'),
	  ('4D',2120,'Hörður Logi Sigurðarson'),
	  ('9D',2130,'Telma Björk Kristjánsdóttir'),
	  ('3D',2300,'Einar Magnússon'),
	  ('5A',2310,'Stefán Andri Elvarsson'),
	  ('6C',2320,'Kristín Mjöll Halldórsdóttir'),
	  ('7B',2330,'Vignir Baldursson'),
	  ('8D',2340,'Ragnar Fannar Birgisson')

--Birti nafn farþega úr flugsætisbókun í öfugri stafrófsröð
select nafnFarthega from Flugsaetisbokun
order by nafnFarthega desc 

--Birti nafn farþega úr flugsætisbókun í stafrófsröð
select nafnFarthega from Flugsaetisbokun
order by nafnFarthega asc 

--Birtir nafn farþega með bókunarnúmerið 2090 úr flugsætisbókun
select nafnFarthega from Flugsaetisbokun
where bokunarNumer = 2090

--Birtir fornafn, kennitölu og eftirnafn allra farþega sem ætla að fara til Egilsstaða
select flugNumer,Greidandi.fornafn, Greidandi.eftirnafn, Greidandi.kennitala
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
where Flugbokun.flugNumer = 'LOO345'

--Birtir fornafn, eftirnafn, kennitölu og eftirnafn allra farþega sem ætla til OG frá Egilsstöðum
select flugNumer, Greidandi.fornafn, Greidandi.eftirnafn, Greidandi.kennitala
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
where Flugbokun.flugNumer = 'LOO345' or Flugbokun.flugNumer = 'LOO346'
order by eftirnafn asc --Raðar þeim eftir eftirnöfnum í stafrófsröð

--Birti nöfn allra þeirra sem ætla að ferðast eitthvað 28. febrúar
select dagsetningFlugs, Greidandi.fornafn, Greidandi.eftirnafn, Greidandi.kennitala
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
where dagsetningFlugs = '2010-02-28'

--Birti nöfn allra þeirra sem ætla að ferðast eitthvað 28. febrúar og hvert þau ætla að ferðast
select dagsetningFlugs, Greidandi.fornafn, Greidandi.eftirnafn, Flug.flogidTil
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
inner join Flug
on Flug.Flugnumer = Flugbokun.Flugnumer
where Flugbokun.dagsetningFlugs = '2010-02-28'

--Birtir nöfn þeirra sem fljúga frá Reykjavík
select Greidandi.fornafn, Greidandi.eftirnafn, Flug.flogidFra
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = flugBokun.kennitalaGreidanda
inner join Flug
on Flug.flugNumer = Flugbokun.flugNumer
where Flug.flogidFra = 'Reykjavík'

--Birtir staði sem TF_HAL flýgur til og frá
select flugvel, flogidFra, flogidTil
from Flug
where flugvel = 'TF_HAL' 

--Birtir nöfn þeirra sem fljúga með TF_KNG


select Flug.flugvel, Greidandi.fornafn, Greidandi.eftirnafn
from Flugbokun
inner join Flug 
on Flug.flugNumer = Flugbokun.flugNumer
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda and Flug.flugNumer = Flugbokun.flugNumer
where Flug.flugvel = 'TF_KNG'