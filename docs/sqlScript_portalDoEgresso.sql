create table entity (
	idEntity integer primary key,
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
    entityidEntity integer primary key,
    lastName varchar2(255) not null,
    cpf varchar2(11) not null,
    foreign key (entityidEntity) references entity
);

create table legalPerson (
    entityidEntity integer primary key,
    cnpj varchar2(14) not null,
    fantasyName varchar2(255) not null,
    foreign key (entityidEntity) references entity
);

create table academicEducation (
    idAcademicEducation integer primary key,
    legalPersonentityidEntity integer not null,
    physicalPersonentityidEntity integer not null,
    levelAE number not null,
    course varchar2(255) not null,
    initiation date not null,
    conclusion date not null,
    foreign key (legalPersonentityidEntity) references legalPerson,
    foreign key (physicalPersonentityidEntity) references physicalPerson
);

create table work (
    idWork integer primary key,
    legalPersonentityidEntity integer not null,
    physicalPersonentityidEntity integer not null,
    startWork date not null,
    endWork date not null,
    name varchar2(255) not null,
    description long,
    foreign key (legalPersonentityidEntity) references legalPerson,
    foreign key (physicalPersonentityidEntity) references physicalPerson
);

create table message (
    idMessage integer primary key,
    sender integer not null,
    recipient integer not null,
    text long not null,
    datetime timestamp not null,
    foreign key (sender) references entity,
    foreign key (recipient) references entity
);

create table skill (
    idSkill integer primary key,
    name varchar2(255) not null,
    description long
);

create table jobOpportunity (
    idJobOpportunity integer primary key,
    legalPersonentityidEntity integer not null,
    opportunity varchar2(255) not null,
    salary number(20, 2) not null,
    description long,
    foreign key (legalPersonentityidEntity) references legalPerson
);

create table jobOpportunity_skill (
    jobOpportunityidJobOpportunity integer,
    skillidSkill integer,
    primary key (jobOpportunityidJobOpportunity, skillidSkill)
);

create table physicalPerson_skill (
    physicalPersonentityidEntity integer,
    skillidSkill integer,
    primary key (physicalPersonentityidEntity, skillidSkill)
);