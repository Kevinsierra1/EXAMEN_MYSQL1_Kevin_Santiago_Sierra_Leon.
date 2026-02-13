create database if not exists Medisistema;
use Medisistema;

create table Medicos(
id int primary key	auto_increment,
codigo varchar(6) unique not null,
nombre varchar(60),
email varchar(150),
telefono varchar(60) 
);

create table Empleados(
id int primary key auto_increment,
codigo varchar(6) unique not null,
nombre varchar(60),
email varchar(150),
telefono varchar(60)
);

create table Pacientes(
id int primary key auto_increment,
codigo varchar(6) unique not null,
nombre varchar(60)
);

create table Vacaciones(
id int primary key auto_increment,
id_medico int,
id_empleado int,
fecha_inicio datetime default now(),
fecha_final datetime default now(),
foreign key(id_medico) references Medicos(id),
foreign key(id_empleado) references Empleados(id)
);

create table area_trabajo(
id int primary key auto_increment,
id_empleado int,
area varchar(100),
foreign key(id_empleado) references Empleados(id)
);

create table detalle_consulta(
id int primary key auto_increment,
hora_consulta datetime not null,
id_medico int,
id_paciente int,
foreign key(id_medico) references Medicos(id),
foreign key(id_paciente) references Pacientes(id)
);

create table detalle_medicos(
id int primary key auto_increment,
id_medico int,
periodo_sustitucion datetime,
estatus varchar(60),
foreign key(id_medico) references Medicos(id)
);

alter table detalle_consulta add column (cantida_pacientes varchar(100));


# Consultas


-- 1. **Número de pacientes atendidos por cada médico**

select m.id, m.nombre as nombre_medico, count(distinct dc.id_paciente) as total_pacientes from Medicos m inner join detalle_consulta dc on m.id = dc.id_paciente group by m.id, m.nombre;

-- 2. **Total de días de vacaciones planificadas y disfrutadas por cada empleado**

select e.id, e.nombre as nombre_empleado, count(distinct v.id_empleado) as total_dias_vacaciones from Vacaciones v inner join Empleados e on e.id = v.id_empleado group by e.id, e.nombre;


-- 3. **Médicos con mayor cantidad de horas de consulta en la semana**


select m.id, m.nombre as nombre_medico, count(distinct dc.hora_consulta * cantida_pacientes) as total_dias_consulta from detalle_consulta dc inner join Medicos m on m.id = dc.id_medico group by m.id, m.nombre;


-- 4.  **Número de sustituciones realizadas por cada médico sustituto**





-- 5.  **Número de médicos que están actualmente en sustitución**




-- 6. **Horas totales de consulta por médico por día de la semana**





-- 7.  **Médico con mayor cantidad de pacientes asignados**





-- 8. **Empleados con más de 10 días de vacaciones disfrutadas**




-- 9.  **Médicos que actualmente están realizando una sustitución**





-- 10.  **Promedio de horas de consulta por médico por día de la semana**





-- 11.  **Empleados con mayor número de pacientes atendidos por los médicos bajo su supervisión**





-- 12.  **Médicos con más de 5 pacientes y total de horas de consulta en la semana**





-- 13.  **Total de días de vacaciones planificadas y disfrutadas por cada tipo de empleado**





-- 14. **Total de pacientes por cada tipo de médico**





-- 15. **Total de horas de consulta por médico y día de la semana**




-- 16. **Número de sustituciones por tipo de médico**





-- 17. **Total de pacientes por médico y por especialidad**





-- 18. **Empleados y médicos con más de 20 días de vacaciones planificadas**





-- 19. **Médicos con el mayor número de pacientes actualmente en sustitución**





-- 20. **Total de horas de consulta por especialidad y día de la semana**


