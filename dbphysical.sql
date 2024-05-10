-- Creating Country table
CREATE TABLE Country (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    svg_icon TEXT
);

-- Creating University table
CREATE TABLE University (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    country_id INTEGER,
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

-- Creating Education table
CREATE TABLE Education (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    education_level INTEGER,
    university_id INTEGER,
    FOREIGN KEY (university_id) REFERENCES University(id)
);

-- Creating User table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT,
    education_id INTEGER,
    birthday DATE,
    country_id INTEGER,
    gender TEXT,
    FOREIGN KEY (education_id) REFERENCES Education(id),
    FOREIGN KEY (country_id) REFERENCES Country(id)
);

-- Creating Game table
CREATE TABLE Game (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

-- Creating Tutor table
CREATE TABLE Tutor (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Creating Group table
CREATE TABLE Groups (
    id SERIAL PRIMARY KEY,
    name TEXT,
    tutor_id INTEGER,
    game_id INTEGER,
    FOREIGN KEY (tutor_id) REFERENCES Users(id),
    FOREIGN KEY (game_id) REFERENCES Game(id)
);

-- Creating Question table
CREATE TABLE Question (
    id SERIAL PRIMARY KEY,
    question_text TEXT,
    alternatives VARCHAR,
    question_type VARCHAR
);

-- Creating Student table
CREATE TABLE Student (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    country_pov VARCHAR,
    profile_type TEXT,
    happiness_meter INTEGER,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Creating QuestionAnswer table
CREATE TABLE QuestionAnswer (
    id SERIAL PRIMARY KEY,
    student_id INTEGER,
    question_answer CHAR,
    period INTEGER,
    date DATE,
    question_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES Users(id),
    FOREIGN KEY (question_id) REFERENCES Question(id)
);

-- Creating Round table
CREATE TABLE Round (
    id SERIAL PRIMARY KEY,
    game_id INTEGER,
    start_date DATE,
    end_date DATE,
    round_number INTEGER,
    explanation TEXT,
    FOREIGN KEY (game_id) REFERENCES Game(id)
);

-- Creating StudentsTeam table
CREATE TABLE StudentsTeam (
    id SERIAL PRIMARY KEY,
    group_id INTEGER,
    student_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES Groups(id),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

-- Creating Message table
CREATE TABLE Message (
    id SERIAL PRIMARY KEY,
    content TEXT,
    user_id INTEGER,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
