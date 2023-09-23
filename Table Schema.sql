DROP TABLE  "GRADE_CHANGES";
DROP TABLE  "CLASS_ASSESSMENTS";
DROP TABLE  "ENROLLMENTS";
DROP TABLE  "CLASSES";
DROP TABLE  "COURSES";
DROP TABLE  "SECTIONS";
DROP TABLE  "ASSESSMENTS";
DROP TABLE  "STUDENTS";
DROP TABLE  "INSTRUCTORS";


CREATE TABLE  "GRADE_CHANGES" 
   ("CHANGE_DATE" DATE, 
	"CLASS_ID" NUMBER(4,0), 
	"ENROLLMENT_DATE" DATE, 
	"STU_ID" NUMBER(7,0), 
	"FINAL_NUMERIC_GRADE" NUMBER(5,2)
   );
   
CREATE TABLE  "ASSESSMENTS" 
   ("ASSESSMENT_ID" NUMBER(7,0), 
    "DESCRIPTION" VARCHAR2(1000) CONSTRAINT "SA_DESCIPT_NN" NOT NULL ENABLE, 
    "GRADING_CRITERIA" VARCHAR2(100), 
     CONSTRAINT "SA_ASSESS_PK" PRIMARY KEY ("ASSESSMENT_ID")
  USING INDEX  ENABLE
   );
    
CREATE TABLE  "STUDENTS" 
   ("STU_ID" NUMBER(7,0), 
    "FIRST_NAME" VARCHAR2(25) CONSTRAINT "SA_STU_FN_NN" NOT NULL ENABLE, 
    "LAST_NAME" VARCHAR2(40) CONSTRAINT "SA_STU_LN_NN" NOT NULL ENABLE, 
    "CONTACT_PHONE" VARCHAR2(20), 
    "EMAIL" VARCHAR2(80), 
    "EXPECTED_GRADUATION_DATE" DATE, 
    "ADDRESS1" VARCHAR2(50), 
    "ADDRESS2" VARCHAR2(50), 
    "CITY" VARCHAR2(40), 
    "STATE_PROVINCE" VARCHAR2(30), 
    "POSTAL_CODE" VARCHAR2(10), 
    "COUNTRY" VARCHAR2(40), 
     CONSTRAINT "SA_STU_PK" PRIMARY KEY ("STU_ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "CLASSES" 
   ("CLASS_ID" NUMBER(6,0), 
    "START_DATE" DATE CONSTRAINT "SA_START_NN" NOT NULL ENABLE, 
    "PERIOD" VARCHAR2(20) CONSTRAINT "SA_PERIOD_NN" NOT NULL ENABLE, 
    "FREQUENCY" VARCHAR2(10) CONSTRAINT "SA_FREQ_NN" NOT NULL ENABLE, 
    "INSTR_ID" NUMBER(6,0) CONSTRAINT "SA_INSTR_NN" NOT NULL ENABLE, 
    "COURSE_ID" NUMBER(6,0) CONSTRAINT "SA_COUR_NN" NOT NULL ENABLE, 
     CONSTRAINT "SA_CLASS_PK" PRIMARY KEY ("CLASS_ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "INSTRUCTORS" 
   ("INSTRUCTOR_ID" NUMBER(6,0), 
    "FIRST_NAME" VARCHAR2(25) CONSTRAINT "SA_INSTR_FN_NN" NOT NULL ENABLE, 
    "LAST_NAME" VARCHAR2(40) CONSTRAINT "SA_INSTR_LN_NN" NOT NULL ENABLE, 
    "WORK_PHONE" VARCHAR2(20), 
    "EMAIL" VARCHAR2(80), 
    "OFFICE_LOCATION" VARCHAR2(20), 
     CONSTRAINT "SA_INST_PK" PRIMARY KEY ("INSTRUCTOR_ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "SECTIONS" 
   ("SECTION_CODE" NUMBER(6,0), 
    "TITLE" VARCHAR2(40) CONSTRAINT "SA_SECT_TITLE_NN" NOT NULL ENABLE, 
    "CHAIR_PERSON" NUMBER(6,0), 
     CONSTRAINT "SA_SECTS_PK" PRIMARY KEY ("SECTION_CODE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "COURSES" 
   ("COURSE_ID" NUMBER(6,0), 
    "TITLE" VARCHAR2(50) CONSTRAINT "SA_COUR_TITLE_NN" NOT NULL ENABLE, 
    "DURATION" NUMBER(3,0) CONSTRAINT "SA_DUR_NN" NOT NULL ENABLE, 
    "DURATION_MEASURE" VARCHAR2(10) CONSTRAINT "SA_DUR_MEAS_NN" NOT NULL ENABLE, 
    "DATE_FIRST_OFFERED" DATE CONSTRAINT "SA_FIRST_NN" NOT NULL ENABLE, 
    "DATE_LAST_OFFERED" DATE, 
    "DELIVERY_TYPE" VARCHAR2(15) CONSTRAINT "SA_DELIV_NN" NOT NULL ENABLE, 
    "SECTION_CODE" NUMBER(6,0) CONSTRAINT "SA_SECT_NN" NOT NULL ENABLE, 
     CONSTRAINT "SA_COUR_PK" PRIMARY KEY ("COURSE_ID")
  USING INDEX  ENABLE
   );

CREATE TABLE  "ENROLLMENTS" 
   ("ENROLLMENT_DATE" DATE, 
    "CLASS_ID" NUMBER(6,0), 
    "STU_ID" NUMBER(7,0), 
    "FINAL_NUMERIC_GRADE" NUMBER(5,2), 
    "FINAL_LETTER_GRADE" VARCHAR2(20), 
    "STATUS" VARCHAR2(10) CONSTRAINT "SA_STATUS_NN" NOT NULL ENABLE, 
     CONSTRAINT "SA_ENROLL_PK" PRIMARY KEY ("CLASS_ID", "STU_ID", "ENROLLMENT_DATE")
  USING INDEX  ENABLE
   );

CREATE TABLE  "CLASS_ASSESSMENTS" 
   ("CLASS_ASSESSMENT_ID" NUMBER(7,0), 
    "DATE_TURNED_IN" DATE, 
    "NUMERIC_GRADE" NUMBER(5,2), 
    "LETTER_GRADE" VARCHAR2(20), 
    "COMMENTS" VARCHAR2(1000), 
    "CLASS_ID" NUMBER(6,0) CONSTRAINT "SA_CLASS_ID_NN" NOT NULL ENABLE, 
    "STU_ID" NUMBER(7,0) CONSTRAINT "SA_STU_ID_NN" NOT NULL ENABLE, 
    "ASSESSMENT_ID" NUMBER(7,0) CONSTRAINT "SA_ASSESS_ID_NN" NOT NULL ENABLE, 
     CONSTRAINT "SA_CL_ASSESS_PK" PRIMARY KEY ("CLASS_ASSESSMENT_ID")
  USING INDEX  ENABLE
   );

ALTER TABLE  "CLASS_ASSESSMENTS" ADD CONSTRAINT "SA_ASSESS_FK" FOREIGN KEY ("ASSESSMENT_ID")
    REFERENCES  "ASSESSMENTS" ("ASSESSMENT_ID") ENABLE;

ALTER TABLE  "SECTIONS" ADD CONSTRAINT "SA_CHAIR_FK" FOREIGN KEY ("CHAIR_PERSON")
    REFERENCES  "INSTRUCTORS" ("INSTRUCTOR_ID") ENABLE;

ALTER TABLE  "ENROLLMENTS" ADD CONSTRAINT "SA_CLASS_FK1" FOREIGN KEY ("CLASS_ID")
    REFERENCES  "CLASSES" ("CLASS_ID") ENABLE;

ALTER TABLE  "CLASS_ASSESSMENTS" ADD CONSTRAINT "SA_CLASS_FK2" FOREIGN KEY ("CLASS_ID")
    REFERENCES  "CLASSES" ("CLASS_ID") ENABLE;

ALTER TABLE  "CLASSES" ADD CONSTRAINT "SA_COUR_FK" FOREIGN KEY ("COURSE_ID")
    REFERENCES  "COURSES" ("COURSE_ID") ENABLE;

ALTER TABLE  "CLASSES" ADD CONSTRAINT "SA_INSTR_FK" FOREIGN KEY ("INSTR_ID")
    REFERENCES  "INSTRUCTORS" ("INSTRUCTOR_ID") ENABLE;

ALTER TABLE  "COURSES" ADD CONSTRAINT "SA_SECT_FK" FOREIGN KEY ("SECTION_CODE")
    REFERENCES  "SECTIONS" ("SECTION_CODE") ENABLE;

ALTER TABLE  "ENROLLMENTS" ADD CONSTRAINT "SA_STU_FK1" FOREIGN KEY ("STU_ID")
    REFERENCES  "STUDENTS" ("STU_ID") ENABLE;

ALTER TABLE  "CLASS_ASSESSMENTS" ADD CONSTRAINT "SA_STU_FK2" FOREIGN KEY ("STU_ID")
    REFERENCES  "STUDENTS" ("STU_ID") ENABLE;

