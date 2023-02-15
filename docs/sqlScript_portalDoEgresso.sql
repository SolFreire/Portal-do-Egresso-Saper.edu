create table entity (
	idEntity number primary key,
	name varchar2(255) not null,
	phone varchar2(13),
	email varchar2(255),
	address varchar2(255),
	numberAddress varchar2(255),
	zipCode varchar2(20),
	city varchar2(255),
	state varchar2(255),
	country varchar2(255),
	password varchar2(255) not null,
	role number not null
);

create table physicalPerson (
    entityidEntity number primary key,
    lastName varchar2(255) not null,
    cpf varchar2(11) not null,
    foreign key (entityidEntity) references entity
);

create table legalPerson (
    entityidEntity number primary key,
    cnpj varchar2(14) not null,
    fantasyName varchar2(255) not null,
    foreign key (entityidEntity) references entity
);

create table academicEducation (
    idAcademicEducation number primary key,
    legalPersonentityidEntity number not null,
    physicalPersonentityidEntity number not null,
    levelAE number not null,
    course varchar2(255) not null,
    initiation date not null,
    conclusion date not null,
    foreign key (legalPersonentityidEntity) references legalPerson,
    foreign key (physicalPersonentityidEntity) references physicalPerson
);

create table work (
    idWork number primary key,
    legalPersonentityidEntity number not null,
    physicalPersonentityidEntity number not null,
    startWork date not null,
    endWork date not null,
    name varchar2(255) not null,
    description long,
    foreign key (legalPersonentityidEntity) references legalPerson,
    foreign key (physicalPersonentityidEntity) references physicalPerson
);

create table message (
    idMessage number primary key,
    sender number not null,
    recipient number not null,
    text long not null,
    datetime timestamp not null,
    foreign key (sender) references entity,
    foreign key (recipient) references entity
);

create table skill (
    idSkill number primary key,
    name varchar2(255) not null,
    description long
);

create table jobOpportunity (
    idJobOpportunity number primary key,
    legalPersonentityidEntity number not null,
    opportunity varchar2(255) not null,
    salary number(20, 2) not null,
    description long
);

create table jobOpportunity_skill (
    jobOpportunityidJobOpportunity number not null,
    skillidSkill number not null,
    primary key (jobOpportunityidJobOpportunity, skillidSkill)
);

create table physicalPerson_skill (
    physicalPersonentityidEntity number not null,
    skillidSkill number not null,
    primary key (physicalPersonentityidEntity, skillidSkill)
);