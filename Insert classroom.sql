-- populate tables	
INSERT INTO assessments(assessment_id,description,grading_criteria)
   VALUES(1,'Quiz 1:Creating a Procedure','Numeric');

INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(101,'Juan','Vardos','555-345-9765','juan.vardos@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(102,'Francis','Hamilton','555-235-0987','francis.hamilton@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(103,'Vishal','Singh','555-232-0965','vishal.singh@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(104,'Janis','Greenberg','555-974-9766','janis.greenberg@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(105,'Reed','Jetto','555-431-9988','reed.jetto@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(106,'Natacha','Hansen','555-232-1234','natacha.hansen@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO students(stu_id,first_name,last_name,contact_phone,email,expected_graduation_date,address1,address2,city,state_province,postal_code,country)
VALUES(107,'John','O''Reilly','555-232-1346','john.oreilly@rhoades_academy.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO instructors(instructor_id,first_name,last_name,work_phone,email,office_location) 
VALUES(3001,'Jennifer','Jacobs','555-239-9876',NULL,'Bldg. 10 Room 52');
INSERT INTO instructors(instructor_id,first_name,last_name,work_phone,email,office_location) 
VALUES(3002,'Richard','Santos','555-239-9955',NULL,'Bldg. 10 Room 52');
INSERT INTO instructors(instructor_id,first_name,last_name,work_phone,email,office_location) 
VALUES(3003,'Gunther','Haas','555-239-5429',NULL,'Bldg. 10 Room 53');

INSERT INTO sections(section_code,title,chair_person)
VALUES(2001,'Mathematics',NULL);
INSERT INTO sections(section_code,title,chair_person)
VALUES(2002,'Physics',NULL);
INSERT INTO sections(section_code,title,chair_person)
VALUES(2003,'Language Arts',NULL);
INSERT INTO sections(section_code,title,chair_person)
VALUES(2004,'Auto Mechanics',NULL);
INSERT INTO sections(section_code,title,chair_person)
VALUES(2005,'Computer Science',NULL);

INSERT INTO courses(course_id,title,duration,duration_measure,date_first_offered,date_last_offered,delivery_type,section_code)
VALUES(1001,'Introduction to PL/SQL',17,'Weeks',TO_DATE('2004-09-08','yyyy-mm-dd'),NULL,'In-class',2005);
INSERT INTO courses(course_id,title,duration,duration_measure,date_first_offered,date_last_offered,delivery_type,section_code)
VALUES(1002,'Algebra I',17,'Weeks',TO_DATE('2004-09-08','yyyy-mm-dd'),NULL,'In-class',2001);
INSERT INTO courses(course_id,title,duration,duration_measure,date_first_offered,date_last_offered,delivery_type,section_code)
VALUES(1003,'Calculus I',17,'Weeks',TO_DATE('2004-09-08','yyyy-mm-dd'),NULL,'In-class',2001);
INSERT INTO courses(course_id,title,duration,duration_measure,date_first_offered,date_last_offered,delivery_type,section_code)
VALUES(1004,'Java Programming II',34,'Weeks',TO_DATE('2004-09-08','yyyy-mm-dd'),NULL,'In-class',2005);

INSERT INTO classes(class_id,start_date,period,frequency,instr_id,course_id)
VALUES(1,TO_DATE('2004-09-08','yyyy-mm-dd'),'First','Daily',3003,1002);
INSERT INTO classes(class_id,start_date,period,frequency,instr_id,course_id)
VALUES(2,TO_DATE('2004-09-08','yyyy-mm-dd'),'Second','Daily',3003,1002);
INSERT INTO classes(class_id,start_date,period,frequency,instr_id,course_id)
VALUES(3,TO_DATE('2004-09-08','yyyy-mm-dd'),'Fifth','Daily',3003,1002);
INSERT INTO classes(class_id,start_date,period,frequency,instr_id,course_id)
VALUES(4,TO_DATE('2004-09-08','yyyy-mm-dd'),'Mon-Wed','Weekly',3001,1001);
INSERT INTO classes(class_id,start_date,period,frequency,instr_id,course_id)
VALUES(5,TO_DATE('2004-09-08','yyyy-mm-dd'),'First','Daily',3001,1003);
INSERT INTO classes(class_id,start_date,period,frequency,instr_id,course_id)
VALUES(6,TO_DATE('2004-09-08','yyyy-mm-dd'),'Mon-Wed','Weekly',3001,1004);

INSERT INTO enrollments(enrollment_date,class_id,stu_id,final_numeric_grade,final_letter_grade,status)
VALUES(TO_DATE('2004-08-12','yyyy-mm-dd'),1,101,NULL,NULL,'Enrolled');
INSERT INTO enrollments(enrollment_date,class_id,stu_id,final_numeric_grade,final_letter_grade,status)
VALUES(TO_DATE('2004-08-12','yyyy-mm-dd'),1,102,NULL,NULL,'Enrolled');
INSERT INTO enrollments(enrollment_date,class_id,stu_id,final_numeric_grade,final_letter_grade,status)
VALUES(TO_DATE('2004-08-12','yyyy-mm-dd'),1,103,NULL,NULL,'Enrolled');
INSERT INTO enrollments(enrollment_date,class_id,stu_id,final_numeric_grade,final_letter_grade,status)
VALUES(TO_DATE('2004-08-12','yyyy-mm-dd'),1,104,NULL,NULL,'Incomplete');

INSERT INTO class_assessments(class_assessment_id,date_turned_in,numeric_grade,letter_grade,comments,class_id,stu_id,assessment_id)
VALUES(100,NULL,NULL,NULL,NULL,1,102,1);