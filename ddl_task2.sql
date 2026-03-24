create table hospital (
    hospital_ID serial primary key,
    hospital_address varchar(255) not null
)

create table diagnosis (
    diagnosis_ID serial primary key,
    diagnosis_description text not null
)

create table analysis (
    analysis_ID serial primary key,
    analysis_type varchar(50) not null CHECK (analysis_type in ("кровь", "моча", "кал")),
    analysis_date timestamp with timezone default now() not null,
    analysis_result_file_url text not null unique
)

create table doctor_visit_info (
    visit_ID serial primary key,
    name_doctor varchar(255) not null,
    date_visit timestamp with timezone default now() not null,
    medicines text not null,
    diagnosis_ID int foreign key references diagnosis(diagnosis_ID)
)

create table ekp_info (
    ekp_ID serial primary key,
    name_patient varchar(255) not null,
    created_at timestamp with timezone default now() not null,
    passport_series int not null,
    passport_number int not null unique(passport_series, passport_number),
    birth_date timestamp with timezone default now() not null,
    gender varchar(1) not null check(gender in ("М", "Ж")),
    snils int not null unique(),
    ensurance varchar(50) unique not null,
    patient_address varchar(255) not null,
    phone_number varchar(50) unique not null,
    email varchar(255) unique, not null
)

create table sick_leave_info (
    sick_leave_ID serial primary key,
    ekp_ID int foreign key references ekp_info(ekp_ID),
    date_sick_leave timestamp with timezone default now() not null,
    diagnosis_ID int foreign key references diagnosis(diagnosis_ID),
    sick_leave_period interval not null
)

create table hospitalization_info (
    hospitalization_ID serial primary key,
    ekp_ID int foreign key references ekp_info(ekp_ID),
    date_hospitalization timestamp with timezone default now() not null,
    hospital_ID int not null foreign key references(hospital(hospital_ID)),
    diagnosis_ID int foreign key references diagnosis(diagnosis_ID),
)