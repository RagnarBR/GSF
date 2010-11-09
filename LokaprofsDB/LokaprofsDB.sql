--====================================================================================================--
--			                         Gagnagrunnur Flugf�lagsins FlyAir                                --
--====================================================================================================--

-- Gagnagrunnurinn hreinsa�ur ef vera kynni a� � honum leyndust �essar t�flur (gamlar �tg�fur)
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

-- T�flur gagnagrunnsins sm��a�ar
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
--			                                 G�gn gagnagrunnsins                                      --
--====================================================================================================--
-- Flug
insert into Flug(flugNumer,flugvel,flogidFra,flogidTil,brottfor,flugtimi)
values('LOO151','TF_HAL','Reykjav�k','�safj�r�ur','08:00',0.45),
      ('LOO152','TF_HAL','�safj�r�ur','Reykjav�k','10:00',0.45),
      ('LOO234','TF_EGE','Reykjav�k','Akureyri','12:15',0.55),
      ('LOO235','TF_EGE','Akureyri','Reykjav�k','14:15',0.55),
      ('LOO345','TF_KNG','Reykjav�k','Egilsstadir','09:50',1.05),
      ('LOO346','TF_KNG','Egilsstadir','Reykjav�k','11:55',1.05),
      ('LOO567','TF_HAL','Reykjav�k','Hornafj�r�ur','15:00',0.55),
      ('LOO568','TF_HAL','Hornafj�r�ur','Reykjav�k','17:00',0.55),
      ('LOO668','TF_EGE','Reykjav�k','Vestmannaeyjar','18:15',0.25),
      ('LOO669','TF_EGE','Vestmannaeyjar','Reykjav�k','19:45',0.25)

-- S�ti
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
-- grei�endur
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1212494593','Atli','Sigur�arson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2603684493','Axel','J�hannsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1107739983','Benedikt Bj�rgvin','Bj�rnsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0410796533','Egill ��r','Sveinsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1706857613','Einar','Magn�sson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2411885643','Gr�tar M�r','Kristj�nsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0107662593','Gu�mundur','Sigur�arson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2902567803','Gunnar','Hilmarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2308776543','Gunnar Sigur�ur','Traustason')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('3103598873','Hannes','Einarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1010693433','Helgi �rni','Gar�arsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0809559743','H�r�ur Logi','Sigur�arson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0808706593','J�hann','Hei�arsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2405810103','J�hannes','J�nsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0311805603','�lafur','Baldursson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2101775643','Ragnar Fannar','Birgisson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2109507783','R�nar','Karlsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1504670983','R�nar Logi','Ragnarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1106698743','Sigur�ur','R�bertsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0404817043','Sigur�ur Freyr','Hermannsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1710593613','Stef�n Andri','Elvarsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('3010784573','S�var Gu�ni','Brekason')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0611794563','T�mas','Karlsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1912778313','Vignir','Baldursson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2109507813','��r�ur G�sli','Egilsson')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1509872343','Arna Bj�rg','Haraldsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0801408703','Au�ur','Brynjard�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1001738753','Au�ur Hrund','�skarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0911849763','Dr�fn Mist','Magn�sd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1703569803','Erna','Hei�arsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2504661183','Hanna Dr�fn','Einarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0909706413','Harpa','Helgad�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2208563303','Helga','J�nsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0311397793','Hrefna Lind','Einarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2906786423','Hrund','�orsteinsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1107597703','Hulda','Karlsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1405819353','Inga','Sigur�ard�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0609849183','Ingibj�rg','Gunnarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1312761403','J�n�na','Haraldsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2704568953','Katr�n Margr�t','Snorrad�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0206596723','Krist�n','P�lsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1910668103','Krist�n Mj�ll','Halld�rsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('2201784833','L�ra Bj�rk','Arnarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0512806773','Margr�t','Gunnarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1912876543','Mar�a Bj�rk','Sigur�ard�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1504658103','Sigr��ur','�marsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0808558243','Sigr��ur','Steinarsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1703758953','Sigr��ur Hulda','Steinsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('0906701133','Telma Bj�rk','Kristj�nsd�ttir')
insert into Greidandi(kennitala,fornafn,eftirnafn)values('1111819593','��ra Rut','Sk�lad�ttir')
-- b�kanir

insert into Flugbokun(dagsetningBokunar,dagsetningFlugs,flugNumer,verd,kennitalaGreidanda)
values('2009-12-28','2010-01-07','LOO345',11500,'0107662593'),	-- til Egilssta�a
      ('2009-12-30','2010-01-07','LOO345',23000,'0206596723'),
      ('2009-12-31','2010-01-07','LOO345',11500,'0311397793'),
      ('2010-01-02','2010-01-07','LOO345',11500,'0311805603'),
      ('2010-01-03','2010-01-07','LOO345',11500,'0404817043'),
      ('2010-01-03','2010-01-07','LOO345',11500,'0410796533'),
      ('2010-01-04','2010-01-07','LOO345',11500,'0512806773'),
      ('2010-01-05','2010-01-07','LOO345',11500,'0609849183'),
      ('2010-01-06','2010-01-07','LOO345',11500,'0611794563'),
      ('2010-01-06','2010-01-22','LOO567',39600,'0801408703'),	-- til Hornafjar�ar  
      ('2010-01-06','2010-01-22','LOO567',9900,'0808558243'),
      ('2010-01-12','2010-01-22','LOO567',9900,'0808706593'),
      ('2010-01-19','2010-01-22','LOO567',9900,'0809559743'),
      ('2010-01-21','2010-01-22','LOO567',9900,'0906701133'),
      ('2010-01-22','2010-02-17','LOO151',20600,'0909706413'),	-- til �safjar�ar
      ('2010-01-29','2010-02-17','LOO151',10300,'0911849763'),
      ('2010-02-02','2010-02-17','LOO151',10300,'1001738753'),
      ('2010-02-13','2010-02-17','LOO151',10300,'1010693433'),
      ('2010-02-13','2010-02-17','LOO151',10300,'1106698743'),
      ('2010-02-15','2010-02-17','LOO151',10300,'1107597703'),
      ('2010-02-16','2010-02-17','LOO151',10300,'1107739983'),
      ('2010-02-16','2010-02-17','LOO151',10300,'1111819593'),
      ('2010-01-29','2010-02-28','LOO346',11500,'1212494593'),	-- fr� Egilsst��um
      ('2010-01-29','2010-02-28','LOO346',11500,'1312761403'),
      ('2010-02-13','2010-02-28','LOO346',11500,'1405819353'),
      ('2010-02-14','2010-02-28','LOO346',11500,'1504658103'),
      ('2010-02-15','2010-02-28','LOO346',11500,'1504670983'),
      ('2010-02-16','2010-02-28','LOO346',23000,'1509872343'),
      ('2010-02-17','2010-02-28','LOO346',11500,'1703569803'),
      ('2010-02-17','2010-02-28','LOO346',11500,'1703758953'),
      ('2010-02-27','2010-03-03','LOO669',7200,'1706857613'),	-- fr� Vestmannaeyjun
      ('2010-02-28','2010-03-03','LOO669',7200,'1710593613'),
      ('2010-03-01','2010-03-03','LOO669',7200,'1910668103'),
      ('2010-03-01','2010-03-03','LOO669',7200,'1912778313'),
      ('2010-03-02','2010-03-03','LOO669',7200,'2101775643'),
      ('2010-02-01','2010-03-03','LOO152',10300,'2109507783'),	-- fr� �safir�i
      ('2010-02-03','2010-03-03','LOO152',10300,'2109507813'),
      ('2010-02-05','2010-03-03','LOO152',10300,'2201784833'),
      ('2010-02-07','2010-03-03','LOO152',10300,'2208563303'),
      ('2010-02-10','2010-03-03','LOO152',10300,'2308776543'),
      ('2010-02-11','2010-03-03','LOO152',10300,'2405810103'),
      ('2010-02-16','2010-03-03','LOO152',30900,'2411885643'),
      ('2010-03-02','2010-03-03','LOO152',10300,'2504661183'),
      ('2010-03-02','2010-03-03','LOO152',10300,'2603684493'),
      ('2010-04-01','2010-04-19','LOO345',10900,'2704568953'),	-- til Egilssta�a
      ('2010-04-09','2010-04-19','LOO345',10900,'2902567803'),
      ('2010-04-09','2010-04-19','LOO345',10900,'2906786423'),
      ('2010-04-11','2010-04-19','LOO345',10900,'3010784573'),
      ('2010-04-17','2010-04-19','LOO345',10900,'3103598873'),
      ('2010-04-17','2010-04-19','LOO345',10900,'1912876543') 
 
-- s�tisb�kanir
insert into FLugsaetisbokun(saetiID,bokunarNumer,nafnFarthega)
values('1C',2140,'Harpa Helgad�ttir'),
      ('1D',2140,'Dilj� Helgad�ttir'),
      ('2A',2150,'Dr�fn Mist Magn�sd�ttir'),
      ('2B',2160,'Au�ur Hrund �skarsd�ttir'),
      ('4D',2170,'Helgi �rni Gar�arsson'),
	  ('5A',2180,'Sigur�ur R�bertsson'),
	  ('5C',2190,'Hulda Karlsd�ttir'),
	  ('7B',2200,'Benedikt Bj�rgvin Bj�rnsson'),
	  ('8D',2210,'��ra Rut Sk�lad�ttir'),
	  ('1C',2350,'R�nar Karlsson'),
	  ('2A',2360,'��r�ur G�sli Egilsson'),
	  ('5A',2370,'L�ra Bj�rk Arnarsd�ttir'),
	  ('7A',2380,'Helga J�nsd�ttir'),
	  ('7C',2390,'Gunnar Sigur�ur Traustason'),
	  ('8A',2400,'J�hannes J�nsson'),
	  ('8B',2410,'Gr�tar M�r Kristj�nsson'),
	  ('8C',2410,'J�na Gr�tarsd�ttir'),
	  ('8D',2410,'Arna Hannesd�ttir  '),
	  ('9C',2420,'Hanna Dr�fn Einarsd�ttir'),
	  ('9D',2430,'Axel J�hannsson'),
	  ('1C',2000,'Gu�mundur Sigur�arson'),
	  ('3A',2010,'Krist�n P�lsd�ttir'),
	  ('3B',2010,'J�n Stef�nsson'),
	  ('4A',2020,'Hrefna Lind Einarsd�ttir'),
	  ('4C',2030,'�lafur Baldursson'),
	  ('6A',2040,'Sigur�ur Freyr Hermannsson'),
	  ('6C',2050,'Egill ��r Sveinsson'),
	  ('6D',2060,'Margr�t Gunnarsd�ttir'),
	  ('7A',2070,'Ingibj�rg Gunnarsd�ttir'),
	  ('7B',2080,'T�mas Karlsson'),
	  ('7C',2440,'Katr�n Margr�t Snorrad�ttir'),
	  ('7D',2450,'Gunnar Hilmarsson'),
	  ('8A',2460,'Hrund �orsteinsd�ttir'),
	  ('8D',2470,'S�var Gu�ni Brekason'),
	  ('9A',2480,'Hannes Einarsson'),
	  ('9D',2490,'Mar�a Bj�rk Sigur�ard�ttir'),
	  ('1A',2220,'Atli Sigur�arson'),
	  ('1D',2230,'J�n�na Haraldsd�ttir'),
	  ('3A',2240,'Inga Sigur�ard�ttir'),
	  ('3D',2250,'Sigr��ur �marsd�ttir'),
	  ('7B',2260,'R�nar Logi Ragnarsson'),
	  ('7C',2270,'Arna Bj�rg Haraldsd�ttir'),
	  ('7D',2270,'�ormar Geir El�asson'),
	  ('8B',2280,'Erna Hei�arsd�ttir'),
	  ('9A',2290,'Sigr��ur Hulda Steinsd�ttir'),
	  ('2A',2090,'Sigur�ur Kolka'),
	  ('2B',2090,'Au�ur Brynjarsd�ttir'),
	  ('2C',2090,'Gu�r��ur Kolka'),
	  ('2D',2090,'Sigurp�ll Kolka'),
	  ('3C',2100,'Sigr��ur Steinarsd�ttir'),
	  ('4A',2110,'J�hann Hei�arsson'),
	  ('4D',2120,'H�r�ur Logi Sigur�arson'),
	  ('9D',2130,'Telma Bj�rk Kristj�nsd�ttir'),
	  ('3D',2300,'Einar Magn�sson'),
	  ('5A',2310,'Stef�n Andri Elvarsson'),
	  ('6C',2320,'Krist�n Mj�ll Halld�rsd�ttir'),
	  ('7B',2330,'Vignir Baldursson'),
	  ('8D',2340,'Ragnar Fannar Birgisson')

--Birti nafn far�ega �r flugs�tisb�kun � �fugri stafr�fsr��
select nafnFarthega from Flugsaetisbokun
order by nafnFarthega desc 

--Birti nafn far�ega �r flugs�tisb�kun � stafr�fsr��
select nafnFarthega from Flugsaetisbokun
order by nafnFarthega asc 

--Birtir nafn far�ega me� b�kunarn�meri� 2090 �r flugs�tisb�kun
select nafnFarthega from Flugsaetisbokun
where bokunarNumer = 2090

--Birtir fornafn, kennit�lu og eftirnafn allra far�ega sem �tla a� fara til Egilssta�a
select flugNumer,Greidandi.fornafn, Greidandi.eftirnafn, Greidandi.kennitala
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
where Flugbokun.flugNumer = 'LOO345'

--Birtir fornafn, eftirnafn, kennit�lu og eftirnafn allra far�ega sem �tla til OG fr� Egilsst��um
select flugNumer, Greidandi.fornafn, Greidandi.eftirnafn, Greidandi.kennitala
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
where Flugbokun.flugNumer = 'LOO345' or Flugbokun.flugNumer = 'LOO346'
order by eftirnafn asc --Ra�ar �eim eftir eftirn�fnum � stafr�fsr��

--Birti n�fn allra �eirra sem �tla a� fer�ast eitthva� 28. febr�ar
select dagsetningFlugs, Greidandi.fornafn, Greidandi.eftirnafn, Greidandi.kennitala
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
where dagsetningFlugs = '2010-02-28'

--Birti n�fn allra �eirra sem �tla a� fer�ast eitthva� 28. febr�ar og hvert �au �tla a� fer�ast
select dagsetningFlugs, Greidandi.fornafn, Greidandi.eftirnafn, Flug.flogidTil
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda
inner join Flug
on Flug.Flugnumer = Flugbokun.Flugnumer
where Flugbokun.dagsetningFlugs = '2010-02-28'

--Birtir n�fn �eirra sem flj�ga fr� Reykjav�k
select Greidandi.fornafn, Greidandi.eftirnafn, Flug.flogidFra
from Flugbokun
inner join Greidandi
on Greidandi.kennitala = flugBokun.kennitalaGreidanda
inner join Flug
on Flug.flugNumer = Flugbokun.flugNumer
where Flug.flogidFra = 'Reykjav�k'

--Birtir sta�i sem TF_HAL fl�gur til og fr�
select flugvel, flogidFra, flogidTil
from Flug
where flugvel = 'TF_HAL' 

--Birtir n�fn �eirra sem flj�ga me� TF_KNG


select Flug.flugvel, Greidandi.fornafn, Greidandi.eftirnafn
from Flugbokun
inner join Flug 
on Flug.flugNumer = Flugbokun.flugNumer
inner join Greidandi
on Greidandi.kennitala = Flugbokun.kennitalaGreidanda and Flug.flugNumer = Flugbokun.flugNumer
where Flug.flugvel = 'TF_KNG'