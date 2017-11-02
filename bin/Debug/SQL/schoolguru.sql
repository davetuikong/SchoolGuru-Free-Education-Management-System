--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-08-02 19:06:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 188 (class 1259 OID 20023)
-- Name: Book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Book" (
    "AccessionNo" character varying(30) NOT NULL,
    "BookTitle" character varying(30),
    "Author" character varying(30),
    "JointAuthors" character varying(30),
    "Subject" character varying(30),
    "Department" character varying(30),
    "Barcode" character varying(70),
    "ISBN" character varying(30),
    "Volume" character varying(30),
    "Edition" character varying(30),
    "Publisher" character varying(30),
    "PlaceOfPublisher" character varying(30),
    "CD" character varying(10),
    "PublishingYear" integer,
    "Reference" character varying(10),
    "AlmiraPosition" character varying(30),
    "Price" integer,
    "SupplierName" character varying(30),
    "BillDate" timestamp without time zone,
    "Remarks" text
);


ALTER TABLE "Book" OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 20033)
-- Name: BookIssueStaff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "BookIssueStaff" (
    "TransactionID" character varying(15) NOT NULL,
    "IssueDate" timestamp without time zone,
    "DueDate" timestamp without time zone,
    "AccessionNo" character varying(30),
    "StaffID" character varying(15),
    "Status" character varying(30)
);


ALTER TABLE "BookIssueStaff" OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 20040)
-- Name: BookReturnStaff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "BookReturnStaff" (
    "ReturnID" character varying(15) NOT NULL,
    "TransactionID" character varying(15),
    "ReturnDate" timestamp without time zone,
    "Fine" integer
);


ALTER TABLE "BookReturnStaff" OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 20046)
-- Name: BusFeePayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "BusFeePayment" (
    "FeePaymentID" character varying(20) NOT NULL,
    "AdmissionNo" character varying(15),
    "BusCharges" integer,
    "DateOfPayment" character varying(30),
    "ModeOfPayment" character varying(20),
    "PaymentModeDetails" character varying(250),
    "Fine" integer,
    "TotalPaid" integer,
    "DueFees" integer
);


ALTER TABLE "BusFeePayment" OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 20053)
-- Name: BusHolders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "BusHolders" (
    "AdmissionNo" character varying(15),
    "SourceLocation" character varying(250),
    "StartingDate" character varying(30)
);


ALTER TABLE "BusHolders" OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 20063)
-- Name: sclass; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sclass (
    id integer NOT NULL,
    classname character varying(20),
    section character varying(20)
);


ALTER TABLE sclass OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 20061)
-- Name: Class_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Class_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Class_ID_seq" OWNER TO postgres;

--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 193
-- Name: Class_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Class_ID_seq" OWNED BY sclass.id;


--
-- TOC entry 195 (class 1259 OID 20082)
-- Name: CourseFeePayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "CourseFeePayment" (
    "ID" character varying(15) NOT NULL,
    "AdmissionNo" character varying(15),
    "TotalPaid" double precision,
    "ModeOfPayment" character varying(100),
    "Year" integer,
    "PaymentModeDetails" character varying(250),
    "Fine" double precision,
    "PaymentDue" double precision,
    "PaymentDate" timestamp without time zone,
    "PreviousDue" double precision,
    "GrandTotal" double precision,
    "Fee" double precision
);


ALTER TABLE "CourseFeePayment" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 20095)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE department (
    id integer NOT NULL,
    departmentname character varying(250) NOT NULL
);


ALTER TABLE department OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 20093)
-- Name: Department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Department_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Department_id_seq" OWNER TO postgres;

--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 196
-- Name: Department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Department_id_seq" OWNED BY department.id;


--
-- TOC entry 201 (class 1259 OID 20133)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE event (
    id integer NOT NULL,
    eventname character varying(150),
    startdate character varying(30),
    enddate character varying(30),
    starttime character varying(30),
    manager character varying(250),
    activity character varying(250),
    endtime character varying(30)
);


ALTER TABLE event OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 20131)
-- Name: Event_EventID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Event_EventID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Event_EventID_seq" OWNER TO postgres;

--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 200
-- Name: Event_EventID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Event_EventID_seq" OWNED BY event.id;


--
-- TOC entry 228 (class 1259 OID 20382)
-- Name: Exam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Exam_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Exam_id_seq" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 20366)
-- Name: Examtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Examtype_id_seq"
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Examtype_id_seq" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 20346)
-- Name: Feetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Feetype_id_seq"
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Feetype_id_seq" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20151)
-- Name: HostelInfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "HostelInfo" (
    "Hostelname" character varying(150) NOT NULL,
    "Hostel_Address" character varying(250) NOT NULL,
    "Hostel_Phone" character varying(15) NOT NULL,
    "ManagedBy" character varying(100),
    "Hostel_ContactNo" character varying(15),
    "HostelFees" integer
);


ALTER TABLE "HostelInfo" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 20144)
-- Name: Hosteler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Hosteler" (
    "AdmissionNo" character varying(15) NOT NULL,
    "joiningDate" character varying(15),
    "HostelName" character varying(150)
);


ALTER TABLE "Hosteler" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 20164)
-- Name: Logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Logs" (
    "Id" integer NOT NULL,
    "UserID" character varying(150) NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Operation" text NOT NULL
);


ALTER TABLE "Logs" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 20162)
-- Name: Logs_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Logs_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Logs_Id_seq" OWNER TO postgres;

--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 204
-- Name: Logs_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Logs_Id_seq" OWNED BY "Logs"."Id";


--
-- TOC entry 208 (class 1259 OID 20233)
-- Name: ScholarShipPayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "ScholarShipPayment" (
    "ScholarshipPaymentID" character varying(20) NOT NULL,
    "ScholarshipID" integer,
    "Amount" integer,
    "AdmissionNo" character varying(15),
    "PaymentDate" character varying(30),
    "PaymentMode" character varying(20),
    "PaymentModeDetails" character varying(200),
    "TotalPaid" integer,
    "DuePayment" integer
);


ALTER TABLE "ScholarShipPayment" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 20225)
-- Name: Scholarship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Scholarship" (
    "ScholarshipID" integer NOT NULL,
    "ScholarshipName" character varying(30),
    "Description" character varying(200),
    "Amount" character varying(10)
);


ALTER TABLE "Scholarship" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 20223)
-- Name: Scholarship_ScholarshipID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Scholarship_ScholarshipID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Scholarship_ScholarshipID_seq" OWNER TO postgres;

--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 206
-- Name: Scholarship_ScholarshipID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Scholarship_ScholarshipID_seq" OWNED BY "Scholarship"."ScholarshipID";


--
-- TOC entry 210 (class 1259 OID 20243)
-- Name: school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE school (
    id integer NOT NULL,
    schoolname character varying(250),
    address character varying(250),
    phone character varying(15),
    email character varying(30),
    fax character varying(50),
    website character varying(60)
);


ALTER TABLE school OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 20241)
-- Name: School_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "School_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "School_ID_seq" OWNER TO postgres;

--
-- TOC entry 2450 (class 0 OID 0)
-- Dependencies: 209
-- Name: School_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "School_ID_seq" OWNED BY school.id;


--
-- TOC entry 212 (class 1259 OID 20257)
-- Name: section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE section (
    id integer NOT NULL,
    sectionname character varying(15) NOT NULL
);


ALTER TABLE section OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 20255)
-- Name: Section_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Section_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Section_ID_seq" OWNER TO postgres;

--
-- TOC entry 2451 (class 0 OID 0)
-- Dependencies: 211
-- Name: Section_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Section_ID_seq" OWNED BY section.id;


--
-- TOC entry 213 (class 1259 OID 20285)
-- Name: StudentBookIssue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "StudentBookIssue" (
    "TransactionID" character varying(15) NOT NULL,
    "IssueDate" timestamp without time zone,
    "DueDate" timestamp without time zone,
    "AccessionNo" character varying(30),
    "AdmissionNo" character varying(15),
    "Status" character varying(20)
);


ALTER TABLE "StudentBookIssue" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 20363)
-- Name: Subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Subject_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Subject_id_seq" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 20295)
-- Name: Supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Supplier" (
    "ID" character varying(15) NOT NULL,
    "SupplierName" character varying(30),
    "Address" character varying(200),
    "ContactNo" character varying(15),
    "EmailID" character varying(50)
);


ALTER TABLE "Supplier" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 20357)
-- Name: Term_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Term_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Term_id_seq" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 20318)
-- Name: Transportation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Transportation" (
    "RouteID" integer NOT NULL,
    "SourceLocation" character varying(250),
    "BusCharges" integer
);


ALTER TABLE "Transportation" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 20316)
-- Name: Transportation_RouteID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Transportation_RouteID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Transportation_RouteID_seq" OWNER TO postgres;

--
-- TOC entry 2452 (class 0 OID 0)
-- Dependencies: 217
-- Name: Transportation_RouteID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Transportation_RouteID_seq" OWNED BY "Transportation"."RouteID";


SET default_with_oids = false;

--
-- TOC entry 235 (class 1259 OID 20536)
-- Name: admissionno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE admissionno (
);


ALTER TABLE admissionno OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20374)
-- Name: exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE exam (
    id integer DEFAULT nextval('"Exam_id_seq"'::regclass),
    examname character varying(30),
    startdate character varying,
    enddate character varying,
    examtype integer,
    schoolterm integer,
    class integer
);


ALTER TABLE exam OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 226 (class 1259 OID 20368)
-- Name: examtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE examtype (
    id integer DEFAULT nextval('"Examtype_id_seq"'::regclass) NOT NULL,
    examtypename character varying(250) NOT NULL,
    description character varying(64)
);


ALTER TABLE examtype OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 233 (class 1259 OID 20527)
-- Name: feepayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feepayment (
    id integer NOT NULL,
    admissionno character varying(30),
    term integer,
    feetype character varying(30),
    mode character varying(30),
    comment character varying(254),
    datein timestamp without time zone,
    amount double precision,
    sclass character varying(30)
);


ALTER TABLE feepayment OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 20530)
-- Name: feepayment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE feepayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feepayment_id_seq OWNER TO postgres;

--
-- TOC entry 2453 (class 0 OID 0)
-- Dependencies: 234
-- Name: feepayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE feepayment_id_seq OWNED BY feepayment.id;


--
-- TOC entry 236 (class 1259 OID 20540)
-- Name: feecharge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feecharge (
    id integer DEFAULT nextval('feepayment_id_seq'::regclass) NOT NULL,
    admissionno character varying(30),
    term integer,
    feetype character varying(30),
    comment character varying(254),
    datein timestamp without time zone,
    amount double precision,
    sclass character varying(30)
);


ALTER TABLE feecharge OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 20544)
-- Name: feecharge_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE feecharge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feecharge_id_seq OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 229 (class 1259 OID 20401)
-- Name: feeschedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feeschedule (
    id integer NOT NULL,
    term integer,
    amount real,
    sclass character(30),
    feetype character varying(30)
);


ALTER TABLE feeschedule OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 20404)
-- Name: feeschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE feeschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feeschedule_id_seq OWNER TO postgres;

--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 230
-- Name: feeschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE feeschedule_id_seq OWNED BY feeschedule.id;


--
-- TOC entry 220 (class 1259 OID 20341)
-- Name: feetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feetype (
    id integer DEFAULT nextval('"Feetype_id_seq"'::regclass) NOT NULL,
    feetypename character varying(250) NOT NULL
);


ALTER TABLE feetype OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 19663)
-- Name: schoolterm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schoolterm (
    id integer DEFAULT nextval('"Term_id_seq"'::regclass) NOT NULL,
    termname character varying(50),
    startdate character varying(30),
    enddate character varying
);


ALTER TABLE schoolterm OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 20548)
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE staff_id_seq
    START WITH 18
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE staff_id_seq OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 198 (class 1259 OID 20107)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE staff (
    staffname character varying(30),
    paddress character varying(100),
    taddress character varying(100),
    mobile character varying(10),
    phone character varying(10),
    qualification character varying(70),
    yop character varying(50),
    designation character varying(100),
    email character varying(30),
    photo bytea,
    status character varying(15),
    salary integer,
    department character varying(100),
    gender character varying(10),
    doj timestamp without time zone,
    dob timestamp without time zone,
    id integer DEFAULT nextval('staff_id_seq'::regclass)
);


ALTER TABLE staff OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20121)
-- Name: staffpayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE staffpayment (
    "EmpPaymentID" character varying(15) NOT NULL,
    "StaffID" character varying(15),
    "BasicSalary" integer,
    "TotalPaid" integer,
    "Deduction" integer,
    "DuePayment" integer,
    "PaymentDate" character varying(30),
    "ModeOfpayment" character varying(100),
    "PaymentModeDetails" character varying(100)
);


ALTER TABLE staffpayment OWNER TO postgres;

SET default_with_oids = false;

--
-- TOC entry 239 (class 1259 OID 20559)
-- Name: staffsubject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE staffsubject (
    id integer NOT NULL,
    subjectid integer,
    staffid integer,
    subjectcode character varying(64),
    subjectname character varying
);


ALTER TABLE staffsubject OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 20562)
-- Name: staffsubjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE staffsubjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE staffsubjects_id_seq OWNER TO postgres;

--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 240
-- Name: staffsubjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE staffsubjects_id_seq OWNED BY staffsubject.id;


SET default_with_oids = true;

--
-- TOC entry 232 (class 1259 OID 20493)
-- Name: studentdetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE studentdetail (
    id integer NOT NULL,
    admissionno character varying(15) NOT NULL,
    admissiondate timestamp without time zone,
    photo character varying(64),
    sclass character varying(15),
    firstname character varying(100),
    othername character varying(100),
    gender character varying(100),
    religion character varying(15),
    dob timestamp without time zone,
    sponsor character varying(250),
    father character varying(250),
    mother character varying(15),
    guardian character varying(250),
    organization character varying(10) NOT NULL,
    address character varying(15) NOT NULL,
    phone character varying(15) NOT NULL,
    status character varying(1) DEFAULT 0 NOT NULL,
    nationality character varying(100),
    county character varying(20),
    section character varying(30),
    school integer DEFAULT 1,
    category character varying(30),
    email character varying(64),
    term integer
);


ALTER TABLE studentdetail OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 20491)
-- Name: studentdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE studentdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studentdetail_id_seq OWNER TO postgres;

--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 231
-- Name: studentdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE studentdetail_id_seq OWNED BY studentdetail.id;


SET default_with_oids = false;

--
-- TOC entry 223 (class 1259 OID 20360)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE subject (
    id integer DEFAULT nextval('"Subject_id_seq"'::regclass) NOT NULL,
    subjectcode character varying(30),
    subjectname character varying(128),
    classname character varying(20)
);


ALTER TABLE subject OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 216 (class 1259 OID 20304)
-- Name: sysdiagrams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sysdiagrams (
    name character varying(128) NOT NULL,
    principal_id integer NOT NULL,
    diagram_id integer NOT NULL,
    version integer,
    definition bytea
);


ALTER TABLE sysdiagrams OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 20302)
-- Name: sysdiagrams_diagram_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--


CREATE SEQUENCE sysdiagrams_diagram_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sysdiagrams_diagram_id_seq OWNER TO postgres;

--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 215
-- Name: sysdiagrams_diagram_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sysdiagrams_diagram_id_seq OWNED BY sysdiagrams.diagram_id;


--
-- TOC entry 219 (class 1259 OID 20327)
-- Name: user_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_registration
(
  userid character varying(150) NOT NULL,
  password character varying(30) NOT NULL,
  name character varying(30) NOT NULL,
  phone character varying(20),
  email character varying(30),
  doj character varying(30),
  usertype character varying(30) NOT NULL,
  id integer NOT NULL,
  CONSTRAINT user_registration_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.user_registration
  OWNER TO postgres;


CREATE SEQUENCE usertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;


ALTER TABLE ONLY user_registration ALTER COLUMN id SET DEFAULT nextval('"user_id_seq"'::regclass);
--
-- TOC entry 186 (class 1259 OID 19674)
-- Name: usertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usertype (
    id integer NOT NULL,
    type text
);


ALTER TABLE usertype OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 19677)
-- Name: usertype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--



--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 187
-- Name: usertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usertype_id_seq OWNED BY usertype.id;


--
-- TOC entry 2195 (class 2604 OID 20167)
-- Name: Logs Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Logs" ALTER COLUMN "Id" SET DEFAULT nextval('"Logs_Id_seq"'::regclass);


--
-- TOC entry 2196 (class 2604 OID 20228)
-- Name: Scholarship ScholarshipID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Scholarship" ALTER COLUMN "ScholarshipID" SET DEFAULT nextval('"Scholarship_ScholarshipID_seq"'::regclass);


--
-- TOC entry 2200 (class 2604 OID 20321)
-- Name: Transportation RouteID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Transportation" ALTER COLUMN "RouteID" SET DEFAULT nextval('"Transportation_RouteID_seq"'::regclass);


--
-- TOC entry 2192 (class 2604 OID 20098)
-- Name: department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY department ALTER COLUMN id SET DEFAULT nextval('"Department_id_seq"'::regclass);


--
-- TOC entry 2194 (class 2604 OID 20136)
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('"Event_EventID_seq"'::regclass);


--
-- TOC entry 2209 (class 2604 OID 20532)
-- Name: feepayment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feepayment ALTER COLUMN id SET DEFAULT nextval('feepayment_id_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 20406)
-- Name: feeschedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feeschedule ALTER COLUMN id SET DEFAULT nextval('feeschedule_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 20246)
-- Name: school id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY school ALTER COLUMN id SET DEFAULT nextval('"School_ID_seq"'::regclass);


--
-- TOC entry 2191 (class 2604 OID 20066)
-- Name: sclass id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sclass ALTER COLUMN id SET DEFAULT nextval('"Class_ID_seq"'::regclass);


--
-- TOC entry 2198 (class 2604 OID 20260)
-- Name: section id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY section ALTER COLUMN id SET DEFAULT nextval('"Section_ID_seq"'::regclass);


--
-- TOC entry 2211 (class 2604 OID 20564)
-- Name: staffsubject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staffsubject ALTER COLUMN id SET DEFAULT nextval('staffsubjects_id_seq'::regclass);


--
-- TOC entry 2206 (class 2604 OID 20496)
-- Name: studentdetail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentdetail ALTER COLUMN id SET DEFAULT nextval('studentdetail_id_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 20307)
-- Name: sysdiagrams diagram_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sysdiagrams ALTER COLUMN diagram_id SET DEFAULT nextval('sysdiagrams_diagram_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 19679)
-- Name: usertype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usertype ALTER COLUMN id SET DEFAULT nextval('usertype_id_seq'::regclass);


--
-- TOC entry 2385 (class 0 OID 20023)
-- Dependencies: 188
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2386 (class 0 OID 20033)
-- Dependencies: 189
-- Data for Name: BookIssueStaff; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2387 (class 0 OID 20040)
-- Dependencies: 190
-- Data for Name: BookReturnStaff; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2388 (class 0 OID 20046)
-- Dependencies: 191
-- Data for Name: BusFeePayment; Type: TABLE DATA; Schema: public; Owner: postgres
--   --
-- TOC entry 2389 (class 0 OID 20053)
-- Dependencies: 192
-- Data for Name: BusHolders; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 193
-- Name: Class_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Class_ID_seq"', 2, true);


--
-- TOC entry 2392 (class 0 OID 20082)
-- Dependencies: 195
-- Data for Name: CourseFeePayment; Type: TABLE DATA; Schema: public; Owner: postgres
--



SELECT pg_catalog.setval('"Department_id_seq"', 2, true);


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 200
-- Name: Event_EventID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Event_EventID_seq"', 2, true);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 228
-- Name: Exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Exam_id_seq"', 7, true);


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 225
-- Name: Examtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Examtype_id_seq"', 6, true);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 221
-- Name: Feetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Feetype_id_seq"', 5, true);


--
-- TOC entry 2400 (class 0 OID 20151)
-- Dependencies: 203
-- Data for Name: HostelInfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

--
-- TOC entry 2399 (class 0 OID 20144)
-- Dependencies: 202
-- Data for Name: Hosteler; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2402 (class 0 OID 20164)
-- Dependencies: 205
-- Data for Name: Logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 204
-- Name: Logs_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Logs_Id_seq"', 1, false);


--
-- TOC entry 2405 (class 0 OID 20233)
-- Dependencies: 208
-- Data for Name: ScholarShipPayment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2404 (class 0 OID 20225)
-- Dependencies: 207
-- Data for Name: Scholarship; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 206
-- Name: Scholarship_ScholarshipID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Scholarship_ScholarshipID_seq"', 1, false);


--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 209
-- Name: School_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"School_ID_seq"', 1, false);


--
-- TOC entry 2469 (class 0 OID 0)
-- Dependencies: 211
-- Name: Section_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Section_ID_seq"', 1, false);


--
-- TOC entry 2410 (class 0 OID 20285)
-- Dependencies: 213
-- Data for Name: StudentBookIssue; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2470 (class 0 OID 0)
-- Dependencies: 224
-- Name: Subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Subject_id_seq"', 2, true);


--
-- TOC entry 2411 (class 0 OID 20295)
-- Dependencies: 214
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2471 (class 0 OID 0)
-- Dependencies: 222
-- Name: Term_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Term_id_seq"', 3, true);


--
-- TOC entry 2415 (class 0 OID 20318)
-- Dependencies: 218
-- Data for Name: Transportation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2472 (class 0 OID 0)
-- Dependencies: 217
-- Name: Transportation_RouteID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Transportation_RouteID_seq"', 1, false);


--
-- TOC entry 2432 (class 0 OID 20536)
-- Dependencies: 235
-- Data for Name: admissionno; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2394 (class 0 OID 20095)
-- Dependencies: 197
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2398 (class 0 OID 20133)
-- Dependencies: 201
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2424 (class 0 OID 20374)
-- Dependencies: 227
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

--
-- TOC entry 2423 (class 0 OID 20368)
-- Dependencies: 226
-- Data for Name: examtype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2433 (class 0 OID 20540)
-- Dependencies: 236
-- Data for Name: feecharge; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2473 (class 0 OID 0)
-- Dependencies: 237
-- Name: feecharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('feecharge_id_seq', 1, false);


--
-- TOC entry 2430 (class 0 OID 20527)
-- Dependencies: 233
-- Data for Name: feepayment; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2474 (class 0 OID 0)
-- Dependencies: 234
-- Name: feepayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('feepayment_id_seq', 68, true);


--
-- TOC entry 2426 (class 0 OID 20401)
-- Dependencies: 229
-- Data for Name: feeschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2475 (class 0 OID 0)
-- Dependencies: 230
-- Name: feeschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('feeschedule_id_seq', 17, true);


--
-- TOC entry 2417 (class 0 OID 20341)
-- Dependencies: 220
-- Data for Name: feetype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2407 (class 0 OID 20243)
-- Dependencies: 210
-- Data for Name: school; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2382 (class 0 OID 19663)
-- Dependencies: 185
-- Data for Name: schoolterm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2391 (class 0 OID 20063)
-- Dependencies: 194
-- Data for Name: sclass; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2409 (class 0 OID 20257)
-- Dependencies: 212
-- Data for Name: section; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2395 (class 0 OID 20107)
-- Dependencies: 198
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2476 (class 0 OID 0)
-- Dependencies: 238
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('staff_id_seq', 19, true);


--
-- TOC entry 2396 (class 0 OID 20121)
-- Dependencies: 199
-- Data for Name: staffpayment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2436 (class 0 OID 20559)
-- Dependencies: 239
-- Data for Name: staffsubject; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2477 (class 0 OID 0)
-- Dependencies: 240
-- Name: staffsubjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('staffsubjects_id_seq', 4, true);


--
-- TOC entry 2429 (class 0 OID 20493)
-- Dependencies: 232
-- Data for Name: studentdetail; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2478 (class 0 OID 0)
-- Dependencies: 231
-- Name: studentdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('studentdetail_id_seq', 18, true);


--
-- TOC entry 2420 (class 0 OID 20360)
-- Dependencies: 223
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2413 (class 0 OID 20304)
-- Dependencies: 216
-- Data for Name: sysdiagrams; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2479 (class 0 OID 0)
-- Dependencies: 215
-- Name: sysdiagrams_diagram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sysdiagrams_diagram_id_seq', 1, false);


--
-- TOC entry 2416 (class 0 OID 20327)
-- Dependencies: 219
-- Data for Name: user_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--




--
-- TOC entry 2383 (class 0 OID 19674)
-- Dependencies: 186
-- Data for Name: usertype; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2480 (class 0 OID 0)
-- Dependencies: 187
-- Name: usertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usertype_id_seq', 1, false);


--
-- TOC entry 2262 (class 2606 OID 20414)
-- Name: feeschedule FeeSchedule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feeschedule
    ADD CONSTRAINT "FeeSchedule" PRIMARY KEY (id) DEFERRABLE;


--
-- TOC entry 2217 (class 2606 OID 20037)
-- Name: BookIssueStaff PK_BookIssueStaff; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "BookIssueStaff"
    ADD CONSTRAINT "PK_BookIssueStaff" PRIMARY KEY ("TransactionID");


--
-- TOC entry 2219 (class 2606 OID 20044)
-- Name: BookReturnStaff PK_BookReturnStaff; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "BookReturnStaff"
    ADD CONSTRAINT "PK_BookReturnStaff" PRIMARY KEY ("ReturnID");


--
-- TOC entry 2215 (class 2606 OID 20030)
-- Name: Book PK_Book_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Book"
    ADD CONSTRAINT "PK_Book_1" PRIMARY KEY ("AccessionNo");


--
-- TOC entry 2221 (class 2606 OID 20050)
-- Name: BusFeePayment PK_BusFeePayment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "BusFeePayment"
    ADD CONSTRAINT "PK_BusFeePayment" PRIMARY KEY ("FeePaymentID");


--
-- TOC entry 2223 (class 2606 OID 20068)
-- Name: sclass PK_Class; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sclass
    ADD CONSTRAINT "PK_Class" PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 20086)
-- Name: CourseFeePayment PK_CourseFeePayment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "CourseFeePayment"
    ADD CONSTRAINT "PK_CourseFeePayment" PRIMARY KEY ("ID");


--
-- TOC entry 2227 (class 2606 OID 20100)
-- Name: department PK_Department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY department
    ADD CONSTRAINT "PK_Department" PRIMARY KEY (id);


--
-- TOC entry 2229 (class 2606 OID 20125)
-- Name: staffpayment PK_EmployeePayment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staffpayment
    ADD CONSTRAINT "PK_EmployeePayment" PRIMARY KEY ("EmpPaymentID");


--
-- TOC entry 2231 (class 2606 OID 20141)
-- Name: event PK_Event; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event
    ADD CONSTRAINT "PK_Event" PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 20373)
-- Name: examtype PK_Examtype; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY examtype
    ADD CONSTRAINT "PK_Examtype" PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 20345)
-- Name: feetype PK_Feetype; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feetype
    ADD CONSTRAINT "PK_Feetype" PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 20158)
-- Name: HostelInfo PK_HostelInfo_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "HostelInfo"
    ADD CONSTRAINT "PK_HostelInfo_1" PRIMARY KEY ("Hostelname");


--
-- TOC entry 2235 (class 2606 OID 20172)
-- Name: Logs PK_Logs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Logs"
    ADD CONSTRAINT "PK_Logs" PRIMARY KEY ("Id");


--
-- TOC entry 2239 (class 2606 OID 20237)
-- Name: ScholarShipPayment PK_ScholarShipPayment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ScholarShipPayment"
    ADD CONSTRAINT "PK_ScholarShipPayment" PRIMARY KEY ("ScholarshipPaymentID");


--
-- TOC entry 2237 (class 2606 OID 20230)
-- Name: Scholarship PK_Scholarship; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Scholarship"
    ADD CONSTRAINT "PK_Scholarship" PRIMARY KEY ("ScholarshipID");


--
-- TOC entry 2241 (class 2606 OID 20251)
-- Name: school PK_Schoolnfo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY school
    ADD CONSTRAINT "PK_Schoolnfo" PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 20262)
-- Name: section PK_Section; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY section
    ADD CONSTRAINT "PK_Section" PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 20501)
-- Name: studentdetail PK_Student; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY studentdetail
    ADD CONSTRAINT "PK_Student" PRIMARY KEY (admissionno);


--
-- TOC entry 2245 (class 2606 OID 20289)
-- Name: StudentBookIssue PK_StudentBookIssue; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "StudentBookIssue"
    ADD CONSTRAINT "PK_StudentBookIssue" PRIMARY KEY ("TransactionID");


--
-- TOC entry 2247 (class 2606 OID 20299)
-- Name: Supplier PK_Supplier; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Supplier"
    ADD CONSTRAINT "PK_Supplier" PRIMARY KEY ("ID");


--
-- TOC entry 2252 (class 2606 OID 20323)
-- Name: Transportation PK_Transportation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Transportation"
    ADD CONSTRAINT "PK_Transportation" PRIMARY KEY ("RouteID");


--
-- TOC entry 2254 (class 2606 OID 20331)
-- Name: user_registration PK_User_Registration_1; Type: CONSTRAINT; Schema: public; Owner: postgres
--




--
-- TOC entry 2249 (class 2606 OID 20312)
-- Name: sysdiagrams PK__sysdiagr__C2B05B6109DE7BCC; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sysdiagrams
    ADD CONSTRAINT "PK__sysdiagr__C2B05B6109DE7BCC" PRIMARY KEY (diagram_id);


--
-- TOC entry 2258 (class 2606 OID 20572)
-- Name: subject SubjectPKey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subject
    ADD CONSTRAINT "SubjectPKey" PRIMARY KEY (id);


--
-- TOC entry 2213 (class 2606 OID 19667)
-- Name: schoolterm simple_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schoolterm
    ADD CONSTRAINT simple_table_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 1259 OID 20313)
-- Name: UK_principal_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UK_principal_name" ON sysdiagrams USING btree (principal_id, name);


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 229
-- Name: feeschedule; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE feeschedule TO PUBLIC;
INSERT INTO public.usertype(id, type)     VALUES (1, 'Admin'),(2, 'Cashier'),(3, 'Librarian');
INSERT INTO public.user_registration(
            userid, password, name, phone, email, doj,usertype)
    VALUES ('admin','1234', 'Admin', '', '', '', 'Admin');

-- Completed on 2017-08-02 19:06:19

--
-- PostgreSQL database dump complete
--

