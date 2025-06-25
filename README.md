An online system to manage and coordinate volunteer activities. Volunteers can register for activities based on their skills, complete a quiz to assess their abilities, and track their registrations and feedback.

📌 Features
Volunteer registration & login

Browse and register for ongoing activities

Skill management and automated skill detection via quiz

Personalized volunteer dashboard

Admin panel to manage activities, skills, users

Notifications and activity logs

Feedback system after event participation

🏗️ Tech Stack
Layer	Technology
Frontend (UI)	JSP, HTML, CSS, JSTL
Backend (Logic)	Java Spring MVC
Database	SQL Server
Data Access	JDBC + JdbcTemplate
Build Tool	Maven
Server	Apache Tomcat (v9+)

🗃️ Database Schema
The system includes 13 main tables:

users, roles

activities, registrations

skills, skills_categories, user_skills

questions, answers, user_answers

feedbacks, logs, notifications

🔗 All foreign keys and constraints ensure data integrity and traceability.

🚀 Getting Started
1. Clone the repository
bash
Copy
Edit
git clone https://github.com/your-username/volunteer-coordinator.git
2. Set up the database
Use the provided schema.sql file to create tables.

Update application.properties or context.xml with your database credentials.

3. Build & run
Import project into IDE (e.g., IntelliJ, Eclipse)

Run on Tomcat server (version 9+)

Access at: http://localhost:8080/volunteer-coordinator

🧪 Sample Accounts
Role	Email	Password
Admin	admin@mail.com	admin123
Volunteer	volunteer@mail.com	volunteer1

(Ensure these accounts are seeded in your database)

🧩 Project Structure
css
Copy
Edit
src/
├── controllers/
├── dao/
├── model/
├── service/
├── webapp/
│   ├── WEB-INF/
│   │   └── views/
│   │       ├── volunteer_dashboard.jsp
│   │       ├── ...
📈 Future Improvements
Add file upload for activity reports

Real-time chat with organizers

Calendar view for registered events

REST API support

🤔 Challenges Faced
Working with multiple team members using different software versions caused difficulties in code collaboration.

Limited time and team members were still learning Spring and JSP, leading to one person writing most of the core logic.

Debugging JSTL expressions and dynamic quiz rendering took extra effort.

Integrating quiz logic with database-based skill evaluation required multiple layers of DAO + service coordination.

📸 Screenshots
(Add screenshots of dashboard, activity list, quiz, profile page, etc.)

📄 License
This project is for academic purposes. All rights reserved © 2025.

