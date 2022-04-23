create database Ceres;
use Ceres;

create table Empresa (
idEmpresa int primary key auto_increment,
nome varchar (45),
CNPJ varchar (14)
);

create table Usuario (
idUsuario int auto_increment,
nome varchar (45),
email varchar (45),
senha varchar (45),
fkEmpresa int,
primary key (idUsuario, fkEmpresa)
);

create table Plantacao (
idPlantacao int primary key auto_increment,
cep char(9),
complemento varchar (45),
numero int,
fkEmpresa int,
foreign key(fkEmpresa) references Empresa(idEmpresa)
);

create table Sensor (
idSensor int primary key auto_increment,
tipoSensor varchar(45),constraint chktipo check(tipoSensor = 'HT11'or tipoSensor ='LM35'),
fkPlantacao int,
foreign key (fkPlantacao) references plantacao (idPlantacao)
);


create table DadosSensor (
idDadosSensor int primary key auto_increment,
fkSensor int,
foreign key (fkSensor) references sensor (idSensor),
temperatura double,
dataSensor datetime
);

insert into Empresa values (null, 'CanaSugar','12345678912345');
insert into Usuario values (null, 'Ricardo Santos','ricksantos@gmail.com','rick123456',1);
insert into Plantacao values (null, 123456789, 'perto do mercado Angieta',123,1);
insert into Sensor values (null,'HT11',1);
insert into DadosSensor values (null, 1, 25.00, '2020-04-14');
