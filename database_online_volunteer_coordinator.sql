-- ====== activity_skills ======
CREATE TABLE activity_skills (
    activity_id int NOT NULL,
    skill_id int NOT NULL,
    PRIMARY KEY (activity_id, skill_id),
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);


-- ====== roles ======
CREATE TABLE roles (
    role_id int NOT NULL,
    role_name nvarchar(50) NOT NULL,
    PRIMARY KEY (role_id)
);

-- ====== users ======
CREATE TABLE users (
    user_id int NOT NULL,
    full_name nvarchar(100) NOT NULL,
    email nvarchar(100) NOT NULL,
    password nvarchar(255) NOT NULL,
    role_id int NOT NULL,
    phone nvarchar(20),
    address nvarchar(255),
    created_at datetime DEFAULT (getdate()),
    PRIMARY KEY (user_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- ====== activities ======
CREATE TABLE activities (
    activity_id int NOT NULL,
    name nvarchar(255) NOT NULL,
    description nvarchar(-1),
    location nvarchar(255),
    start_time datetime,
    end_time datetime,
    max_participants int,
    status nvarchar(50) DEFAULT ('open'),
    created_by int,
    created_at datetime DEFAULT (getdate()),
    criteria nvarchar(-1),
    PRIMARY KEY (activity_id),
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

-- ====== registrations ======
CREATE TABLE registrations (
    registration_id int NOT NULL,
    user_id int NOT NULL,
    activity_id int NOT NULL,
    status nvarchar(50) DEFAULT ('pending'),
    registered_at datetime DEFAULT (getdate()),
    canceled_at datetime,
    PRIMARY KEY (registration_id),
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ====== skills_categories ======
CREATE TABLE skills_categories (
    category_id int NOT NULL,
    category_name nvarchar(100) NOT NULL,
    PRIMARY KEY (category_id)
);

-- ====== skills ======
CREATE TABLE skills (
    skill_id int NOT NULL,
    category_id int NOT NULL,
    skill_name nvarchar(255) NOT NULL,
    activity_type nvarchar(100),
    PRIMARY KEY (skill_id),
    FOREIGN KEY (category_id) REFERENCES skills_categories(category_id)
);

-- ====== user_skills ======
CREATE TABLE user_skills (
    user_skill_id int NOT NULL,
    user_id int NOT NULL,
    skill_id int NOT NULL,
    skill_level int NOT NULL,
    updated_at datetime DEFAULT (getdate()),
    PRIMARY KEY (user_skill_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ====== questions ======
CREATE TABLE questions (
    question_id int NOT NULL,
    skill_id int NOT NULL,
    question_text nvarchar(-1) NOT NULL,
    PRIMARY KEY (question_id),
    FOREIGN KEY (skill_id) REFERENCES skills(skill_id)
);

-- ====== answers ======
CREATE TABLE answers (
    answer_id int NOT NULL,
    question_id int NOT NULL,
    answer_text nvarchar(255) NOT NULL,
    score int NOT NULL,
    PRIMARY KEY (answer_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);

-- ====== user_answers ======
CREATE TABLE user_answers (
    user_answer_id int NOT NULL,
    user_id int NOT NULL,
    question_id int NOT NULL,
    answer_id int NOT NULL,
    answered_at datetime DEFAULT (getdate()),
    PRIMARY KEY (user_answer_id),
    FOREIGN KEY (answer_id) REFERENCES answers(answer_id),
    FOREIGN KEY (question_id) REFERENCES questions(question_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ====== feedbacks ======
CREATE TABLE feedbacks (
    feedback_id int NOT NULL,
    user_id int NOT NULL,
    activity_id int,
    feedback_text nvarchar(-1),
    rating int,
    created_at datetime DEFAULT (getdate()),
    PRIMARY KEY (feedback_id),
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ====== logs ======
CREATE TABLE logs (
    log_id int NOT NULL,
    user_id int,
    action nvarchar(255),
    details nvarchar(-1),
    created_at datetime DEFAULT (getdate()),
    PRIMARY KEY (log_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- ====== notifications ======
CREATE TABLE notifications (
    notification_id int NOT NULL,
    user_id int NOT NULL,
    message nvarchar(-1) NOT NULL,
    is_read bit DEFAULT ((0)),
    created_at datetime DEFAULT (getdate()),
    PRIMARY KEY (notification_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);