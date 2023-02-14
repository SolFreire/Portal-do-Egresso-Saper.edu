create table entity (
	idEntity uint primary key,
	name varchar2(255) not null,
	phone varchar2(13),
	email varchar2(255),
	address varchar2(255),
	number varchar2(255),
	zipCode varchar2(20),
	city varchar2(255),
	state varchar2(255),
	country varchar2(255),
	password varchar2(255) not null,
	role uint not null
);

create table physicalPerson (
    entityidEntity uint primary key,
    lastName varchar2(255) not null,
    cpf varchar2(11) not null,
    foreign key (entityidEntity) references entity
);

create table legalPerson (
    entityidEntity uint primary key,
    cnpj varchar2(14) not null,
    fantasyName varchar2(255) not null,
    foreign key (entityidEntity) references entity
);

create table academicEducation (
    idAcademicEducation uint primary key,
    legalPersonentityidEntity uint not null,
    physicalPersonentityidEntity uint not null,
    level uint not null,
    courseName varchar2(255) not null,
    initiation date not null,
    conclusion date not null,
    foreign key (legalPersonentityidEntity) references legalPerson,
    foreign key (physicalPersonentityidEntity) references physicalPerson
);

create table work (
    idWork uint primary key,
    legalPersonentityidEntity uint not null,
    physicalPersonentityidEntity uint not null,
    start date not null,
    end date not null,
    name varchar2(255) not null,
    description long varchar,
    foreign key (legalPersonentityidEntity) references legalPerson,
    foreign key (physicalPersonentityidEntity) references physicalPerson
);

create table message (
    idMessage uint primary key,
    sender uint not null,
    recipient uint not null,
    text long varchar2(255) not null,
    datetime timestamp not null,
    foreign key (sender) references entity,
    foreign key (recipient) references entity
);

create table skill (
    idSkill uint primary key,
    name varchar2(255) not null,
    description long varchar
);

create table jobOpportunity (
    idJobOpportunity uint primary key,
    legalPersonentityidEntity uint not null,
    opportunity varchar2(255) not null,
    salary numeric(20, 2) not null,
    description long varchar
);

create table jobOpportunity_skill (
    jobOpportunityidJobOpportunity uint not null,
    skillidSkill uint not null,
    primary key (jobOpportunityidJobOpportunity, skillidSkill)
);

create table physicalPerson_skill (
    physicalPersonentityidEntity uint not null,
    skillidSkill uint not null,
    primary key (physicalPersonentityidEntity, skillidSkill)
);