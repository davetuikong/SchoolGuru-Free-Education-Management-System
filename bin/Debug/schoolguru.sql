--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-08-07 14:44:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "RetailStar";
--
-- TOC entry 2486 (class 1262 OID 16384)
-- Name: RetailStar; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "RetailStar" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "RetailStar" OWNER TO postgres;

\connect "RetailStar"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
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
-- TOC entry 2489 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 19315)
-- Name: attransactiondetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE attransactiondetails (
    attdid integer NOT NULL,
    atprice real,
    quantity integer,
    productname text,
    atinvoiceno text
);


ALTER TABLE attransactiondetails OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 19313)
-- Name: attransactiondetails_attdid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attransactiondetails_attdid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attransactiondetails_attdid_seq OWNER TO postgres;

--
-- TOC entry 2490 (class 0 OID 0)
-- Dependencies: 185
-- Name: attransactiondetails_attdid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attransactiondetails_attdid_seq OWNED BY attransactiondetails.attdid;


--
-- TOC entry 188 (class 1259 OID 19324)
-- Name: atvoucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE atvoucher (
    atvoucherid integer NOT NULL,
    supplier text,
    product text,
    voucherno text,
    expirydate text,
    pinno text
);


ALTER TABLE atvoucher OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 19322)
-- Name: atvoucher_atvoucherid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atvoucher_atvoucherid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE atvoucher_atvoucherid_seq OWNER TO postgres;

--
-- TOC entry 2491 (class 0 OID 0)
-- Dependencies: 187
-- Name: atvoucher_atvoucherid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atvoucher_atvoucherid_seq OWNED BY atvoucher.atvoucherid;


--
-- TOC entry 190 (class 1259 OID 19333)
-- Name: batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE batches (
    id integer NOT NULL,
    "BatchNo" text,
    "DateIn" text,
    "BuyingPrice" double precision DEFAULT 0,
    "ItemPrice" double precision DEFAULT 0,
    "ProductNo" text,
    "Quantity" integer,
    "Remaining" text,
    "ExpiryDate" text
);


ALTER TABLE batches OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 19331)
-- Name: batches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE batches_id_seq OWNER TO postgres;

--
-- TOC entry 2492 (class 0 OID 0)
-- Dependencies: 189
-- Name: batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE batches_id_seq OWNED BY batches.id;


--
-- TOC entry 192 (class 1259 OID 19344)
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE branches (
    id integer NOT NULL,
    "BranchName" text,
    "BranchCode" text
);


ALTER TABLE branches OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 19342)
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE branches_id_seq OWNER TO postgres;

--
-- TOC entry 2493 (class 0 OID 0)
-- Dependencies: 191
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE branches_id_seq OWNED BY branches.id;


--
-- TOC entry 193 (class 1259 OID 19353)
-- Name: cashdrawer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cashdrawer (
    "DateIn" text,
    "Operation" text,
    "Amount" double precision DEFAULT 0,
    "BranchCode" text,
    "StaffId" text
);


ALTER TABLE cashdrawer OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 19362)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    categoryno integer NOT NULL,
    categoryname text,
    description text
);


ALTER TABLE category OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 19360)
-- Name: category_categoryno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_categoryno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_categoryno_seq OWNER TO postgres;

--
-- TOC entry 2494 (class 0 OID 0)
-- Dependencies: 194
-- Name: category_categoryno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE category_categoryno_seq OWNED BY category.categoryno;


--
-- TOC entry 197 (class 1259 OID 19371)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE company (
    companyid integer NOT NULL,
    name text,
    address text,
    phoneno text,
    email text,
    website text,
    tinnumber text,
    currency text,
    cash integer,
    mobile integer,
    card integer,
    cheque integer,
    firstinvoice integer,
    logo text,
    showtax text DEFAULT 1,
    receiptmessage text,
    invoicemessage text,
    taxmessage text
);


ALTER TABLE company OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 19369)
-- Name: company_companyid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE company_companyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company_companyid_seq OWNER TO postgres;

--
-- TOC entry 2495 (class 0 OID 0)
-- Dependencies: 196
-- Name: company_companyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE company_companyid_seq OWNED BY company.companyid;


--
-- TOC entry 198 (class 1259 OID 19380)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE customers (
    "CustId" integer DEFAULT 1 NOT NULL,
    "CName" text,
    "Address" text,
    "Phone" text,
    "Email" text,
    "CreditLimit" real,
    "Balance" real,
    "LoyaltyPoints" integer
);


ALTER TABLE customers OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 19391)
-- Name: expensecategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE expensecategory (
    id integer NOT NULL,
    category text
);


ALTER TABLE expensecategory OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 19389)
-- Name: expensecategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE expensecategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expensecategory_id_seq OWNER TO postgres;

--
-- TOC entry 2496 (class 0 OID 0)
-- Dependencies: 199
-- Name: expensecategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE expensecategory_id_seq OWNED BY expensecategory.id;


--
-- TOC entry 202 (class 1259 OID 19400)
-- Name: expenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE expenses (
    "Id" integer NOT NULL,
    "Ref" text,
    "Detail" text,
    "Amount" integer,
    "DateIn" text,
    "StaffId" integer DEFAULT 0,
    "PaymentType" text,
    "Category" text
);


ALTER TABLE expenses OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 19398)
-- Name: expenses_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "expenses_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "expenses_Id_seq" OWNER TO postgres;

--
-- TOC entry 2497 (class 0 OID 0)
-- Dependencies: 201
-- Name: expenses_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "expenses_Id_seq" OWNED BY expenses."Id";


--
-- TOC entry 204 (class 1259 OID 19410)
-- Name: heldsales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE heldsales (
    "Id" integer NOT NULL,
    "Ttime" text,
    "ProductNo" integer,
    "Quantity" integer,
    "HoldId" integer,
    "StaffId" integer,
    "Units" text
);


ALTER TABLE heldsales OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19408)
-- Name: heldsales_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "heldsales_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "heldsales_Id_seq" OWNER TO postgres;

--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 203
-- Name: heldsales_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "heldsales_Id_seq" OWNED BY heldsales."Id";


--
-- TOC entry 206 (class 1259 OID 19419)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE inventory (
    id integer NOT NULL,
    "InventoryId" text,
    "ProductNo" integer,
    "Quantity" real,
    "DateIn" text,
    "ExpiryDate" text,
    "SupplierID" integer,
    "BuyingPrice" double precision,
    "Initial" integer DEFAULT 0,
    "Balance" real DEFAULT 0,
    "BatchNo" text,
    "BranchCode" text NOT NULL,
    "Mode" text DEFAULT 0,
    "StaffId" integer,
    "CustId" integer,
    "CustomerName" text,
    "StaffName" text,
    "Comment" text,
    "ItemPrice" numeric,
    "PONo" text
);


ALTER TABLE inventory OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19417)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inventory_id_seq OWNER TO postgres;

--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 205
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE inventory_id_seq OWNED BY inventory.id;


--
-- TOC entry 208 (class 1259 OID 19431)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment (
    "Id" integer NOT NULL,
    "PaymentId" text,
    "InvoiceNo" text,
    "Amount" integer,
    "Cash" real,
    "MobileAmount" integer,
    "Phone" text,
    "TxCode" text,
    "CardAmount" real,
    "ChangeGiven" real,
    "CustId" integer,
    "DateIn" text,
    "Overpayment" real,
    "StaffId" integer DEFAULT 0,
    "PaymentType" text
);


ALTER TABLE payment OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 19429)
-- Name: payment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "payment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "payment_Id_seq" OWNER TO postgres;

--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 207
-- Name: payment_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "payment_Id_seq" OWNED BY payment."Id";


--
-- TOC entry 210 (class 1259 OID 19441)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE permissions (
    "Id" integer NOT NULL,
    "StaffId" text,
    "Function" text
);


ALTER TABLE permissions OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19439)
-- Name: permissions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "permissions_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "permissions_Id_seq" OWNER TO postgres;

--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 209
-- Name: permissions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "permissions_Id_seq" OWNED BY permissions."Id";


--
-- TOC entry 211 (class 1259 OID 19448)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE product (
    "ProductNo" integer NOT NULL,
    "ProductCode" text,
    "Description" text,
    "Barcode" text,
    "ItemPrice" real DEFAULT 0,
    "BuyingPrice" real DEFAULT 0,
    "ReorderLevel" integer,
    "CategoryNo" integer,
    "Units" text,
    "Tax1" integer,
    "Tax2" integer,
    "Tax3" integer,
    "Expires" integer DEFAULT 0 NOT NULL,
    "Batch" text DEFAULT 0,
    "prodImage" text
);


ALTER TABLE product OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 19462)
-- Name: purchase_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order (
    "PONo" integer NOT NULL,
    supplierid integer,
    "DateIn" character varying(50) DEFAULT NULL::character varying,
    shippinginstructions text,
    additionalinstructions text,
    "DeclaredAs" text,
    "DeclaredValue" text,
    "Remarks" text,
    "Gross" numeric(10,2),
    "Discount" text,
    "TaxBase" numeric(10,2),
    "VAT" numeric(10,2),
    "NetAmount" numeric(10,2),
    "CreatedOn" character varying(50),
    "CreatedBy" text,
    "ModifiedOn" character varying(50),
    "ModifiedBy" text,
    salesman text,
    committed integer DEFAULT 0
);


ALTER TABLE purchase_order OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 19460)
-- Name: purchase_order_PONo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "purchase_order_PONo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "purchase_order_PONo_seq" OWNER TO postgres;

--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 212
-- Name: purchase_order_PONo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "purchase_order_PONo_seq" OWNED BY purchase_order."PONo";


--
-- TOC entry 214 (class 1259 OID 19471)
-- Name: purchase_order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order_detail (
    "PurchaseOrderDetailID" integer NOT NULL,
    "PONo" integer,
    "ProductNo" character varying(50) DEFAULT NULL::character varying,
    "Qty" integer NOT NULL,
    "BuyingPrice" integer,
    "ItemPrice" integer,
    "Discount" integer,
    "CreatedOn" character varying(25),
    "CreatedBy" text,
    "ModifiedOn" character varying(25)
);


ALTER TABLE purchase_order_detail OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 19482)
-- Name: purchase_order_expense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order_expense (
    "ExpenseNo" integer NOT NULL,
    "PONo" integer,
    "Narration" integer,
    "Amount" integer,
    "PaymentType" text,
    "DateIn" text
);


ALTER TABLE purchase_order_expense OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 19480)
-- Name: purchase_order_expense_ExpenseNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "purchase_order_expense_ExpenseNo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "purchase_order_expense_ExpenseNo_seq" OWNER TO postgres;

--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 215
-- Name: purchase_order_expense_ExpenseNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "purchase_order_expense_ExpenseNo_seq" OWNED BY purchase_order_expense."ExpenseNo";


--
-- TOC entry 218 (class 1259 OID 19491)
-- Name: purchase_order_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order_payment (
    "PaymentNo" integer NOT NULL,
    "PONo" character varying(45),
    "Amount" double precision,
    "PaymentType" character varying(50) DEFAULT NULL::character varying,
    "DateIn" character varying(45) DEFAULT NULL::character varying,
    "StaffId" integer,
    "InvoiceNo" text,
    "Narration" text
);


ALTER TABLE purchase_order_payment OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19489)
-- Name: purchase_order_payment_PaymentNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "purchase_order_payment_PaymentNo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "purchase_order_payment_PaymentNo_seq" OWNER TO postgres;

--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 217
-- Name: purchase_order_payment_PaymentNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "purchase_order_payment_PaymentNo_seq" OWNED BY purchase_order_payment."PaymentNo";


--
-- TOC entry 220 (class 1259 OID 19502)
-- Name: purchase_order_receive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order_receive (
    "ReceiveId" integer NOT NULL,
    "PONo" integer,
    "Description" character varying(45),
    "Address" character varying(139),
    "DateIn" character varying(50) DEFAULT NULL::character varying,
    "InvoiceNo" character varying(45),
    "InvoiceDate" character varying(25),
    "DeliveryDate" character varying(25),
    "Agent" character varying(45),
    "Shipper" character varying(45),
    "WayBill" character varying(45),
    "Terms" character varying(45),
    "Remarks" character varying(45),
    "Gross" numeric(10,2),
    "Discount" numeric(10,2),
    "TaxBase" numeric(10,2),
    "VAT" numeric(10,2),
    "NetAmount" numeric(10,2),
    "QtyRcvd" numeric,
    "Returned" numeric(32,0),
    "CreatedOn" text,
    "CreatedBy" text,
    "DeliveryNo" text
);


ALTER TABLE purchase_order_receive OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19500)
-- Name: purchase_order_receive_ReceiveId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "purchase_order_receive_ReceiveId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "purchase_order_receive_ReceiveId_seq" OWNER TO postgres;

--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 219
-- Name: purchase_order_receive_ReceiveId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "purchase_order_receive_ReceiveId_seq" OWNED BY purchase_order_receive."ReceiveId";


--
-- TOC entry 222 (class 1259 OID 19512)
-- Name: purchase_order_receiving_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order_receiving_detail (
    "DeliveryId" integer NOT NULL,
    "PONo" text,
    "ProductNo" integer,
    "Qty" integer,
    "Mode" text,
    "Unit" text,
    "CreatedOn" date,
    "CreatedBy" text,
    "ModifiedOn" date,
    "ModifiedBy" text,
    "DeliveryNo" character varying(1) DEFAULT NULL::character varying
);


ALTER TABLE purchase_order_receiving_detail OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 19510)
-- Name: purchase_order_receiving_detail_DeliveryId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "purchase_order_receiving_detail_DeliveryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "purchase_order_receiving_detail_DeliveryId_seq" OWNER TO postgres;

--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 221
-- Name: purchase_order_receiving_detail_DeliveryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "purchase_order_receiving_detail_DeliveryId_seq" OWNED BY purchase_order_receiving_detail."DeliveryId";


--
-- TOC entry 224 (class 1259 OID 19522)
-- Name: purchase_order_return; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE purchase_order_return (
    "PurchaseOrderReturnID" integer NOT NULL,
    "InvoiceID" integer,
    "DebitMemoNo" text,
    "DebitMemoDate" text,
    "Purchase_Order_Returncol" date,
    "Reason" text,
    "ApprovedBy" text,
    "PostedBy" text,
    "Date" date,
    "AcknowledgedBy" text,
    "Remarks" text,
    "Gross" text,
    "Discount" text,
    "TaxBase" text,
    "VAT" text,
    "NetAmount" text,
    "CreatedOn" character varying(25),
    "CreatedBy" text
);


ALTER TABLE purchase_order_return OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19520)
-- Name: purchase_order_return_PurchaseOrderReturnID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "purchase_order_return_PurchaseOrderReturnID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "purchase_order_return_PurchaseOrderReturnID_seq" OWNER TO postgres;

--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 223
-- Name: purchase_order_return_PurchaseOrderReturnID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "purchase_order_return_PurchaseOrderReturnID_seq" OWNED BY purchase_order_return."PurchaseOrderReturnID";


--
-- TOC entry 225 (class 1259 OID 19529)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE staff (
    "StaffID" integer NOT NULL,
    "StaffName" text,
    "Street" text,
    "Email" text,
    "City" text,
    "State" text,
    "ContactNo" text,
    "Username" text,
    "Role" text,
    "UPassword" text,
    "ReceiveStock" integer DEFAULT 0,
    "PreviewReceipt" integer,
    "BranchCode" integer DEFAULT 0
);


ALTER TABLE staff OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19541)
-- Name: suppliercategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE suppliercategory (
    id integer NOT NULL,
    supplierid integer,
    categoryno integer
);


ALTER TABLE suppliercategory OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19539)
-- Name: suppliercategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE suppliercategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE suppliercategory_id_seq OWNER TO postgres;

--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 226
-- Name: suppliercategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE suppliercategory_id_seq OWNED BY suppliercategory.id;


--
-- TOC entry 229 (class 1259 OID 19547)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE suppliers (
    suppid integer NOT NULL,
    suppliername text,
    address text,
    phone text,
    email text
);


ALTER TABLE suppliers OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 19545)
-- Name: suppliers_suppid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE suppliers_suppid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE suppliers_suppid_seq OWNER TO postgres;

--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 228
-- Name: suppliers_suppid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE suppliers_suppid_seq OWNED BY suppliers.suppid;


--
-- TOC entry 231 (class 1259 OID 19556)
-- Name: syncmarker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE syncmarker (
    id integer NOT NULL,
    tablename text,
    lastkey integer,
    timestmp timestamp(0) without time zone
);


ALTER TABLE syncmarker OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 19554)
-- Name: syncmarker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE syncmarker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE syncmarker_id_seq OWNER TO postgres;

--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 230
-- Name: syncmarker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE syncmarker_id_seq OWNED BY syncmarker.id;


--
-- TOC entry 233 (class 1259 OID 19565)
-- Name: taxsetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE taxsetting (
    taxid integer NOT NULL,
    taxname text,
    taxrate real
);


ALTER TABLE taxsetting OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 19563)
-- Name: taxsetting_taxid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE taxsetting_taxid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taxsetting_taxid_seq OWNER TO postgres;

--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 232
-- Name: taxsetting_taxid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE taxsetting_taxid_seq OWNED BY taxsetting.taxid;


--
-- TOC entry 235 (class 1259 OID 19574)
-- Name: transactiondetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transactiondetails (
    id integer NOT NULL,
    transid text,
    invoiceno text,
    productno integer,
    barcode text,
    itemprice real,
    quantity real,
    discount real,
    "Tax1" real DEFAULT 0 NOT NULL,
    "Tax2" real DEFAULT 0 NOT NULL,
    "Tax3" real DEFAULT 0 NOT NULL,
    "DateIn" text,
    "StaffId" integer,
    "BuyingPrice" real DEFAULT 0 NOT NULL
);


ALTER TABLE transactiondetails OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 19572)
-- Name: transactiondetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transactiondetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactiondetails_id_seq OWNER TO postgres;

--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 234
-- Name: transactiondetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transactiondetails_id_seq OWNED BY transactiondetails.id;


--
-- TOC entry 236 (class 1259 OID 19585)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transactions (
    id integer NOT NULL,
    "InvoiceNo" text,
    "DateIn" text,
    "NonVatTotal" real,
    "VatAmount" real DEFAULT 0,
    "TotalAmount" real DEFAULT 0,
    "Balance" real DEFAULT 0,
    "StaffID" integer,
    "CustID" integer DEFAULT 1,
    "BranchCode" text,
    "Discount" double precision DEFAULT 0
);


ALTER TABLE transactions OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 19600)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE units (
    id integer NOT NULL,
    unit text
);


ALTER TABLE units OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 19598)
-- Name: units_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE units_id_seq OWNER TO postgres;

--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 237
-- Name: units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE units_id_seq OWNED BY units.id;


--
-- TOC entry 240 (class 1259 OID 19611)
-- Name: zinventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE zinventory (
    id integer NOT NULL,
    "InventoryId" text,
    "ProductNo" integer,
    "Quantity" real,
    "DateIn" text,
    "ExpiryDate" text,
    "SupplierID" integer,
    "BuyingPrice" double precision,
    "BatchNo" character(1),
    "Balance" real DEFAULT 0,
    "BatchState" text DEFAULT 1,
    "BranchCode" text NOT NULL,
    "Mode" text DEFAULT 0,
    "StaffId" integer,
    "CustId" integer,
    "CustomerName" text,
    "StaffName" text,
    "Comment" text
);


ALTER TABLE zinventory OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 19609)
-- Name: zinventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zinventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zinventory_id_seq OWNER TO postgres;

--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 239
-- Name: zinventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zinventory_id_seq OWNED BY zinventory.id;


--
-- TOC entry 242 (class 1259 OID 19623)
-- Name: zpayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE zpayment (
    "Id" integer NOT NULL,
    "PaymentId" text,
    "InvoiceNo" integer,
    "Total" integer,
    "Cash" real,
    "MobileAmount" integer,
    "Phone" text,
    "TxCode" text,
    "CardAmount" real,
    "ChangeGiven" real,
    "CustId" integer,
    "Ptime" text,
    "Overpayment" real,
    "StaffId" integer DEFAULT 0
);


ALTER TABLE zpayment OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 19621)
-- Name: zpayment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "zpayment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "zpayment_Id_seq" OWNER TO postgres;

--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 241
-- Name: zpayment_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "zpayment_Id_seq" OWNED BY zpayment."Id";


--
-- TOC entry 244 (class 1259 OID 19633)
-- Name: ztransactiondetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ztransactiondetails (
    id integer NOT NULL,
    transid text,
    invoiceno text,
    productno integer,
    barcode text,
    itemprice real,
    quantity real,
    discount real,
    "Tax1" real DEFAULT 0 NOT NULL,
    "Tax2" real DEFAULT 0 NOT NULL,
    "Tax3" real DEFAULT 0 NOT NULL
);


ALTER TABLE ztransactiondetails OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 19631)
-- Name: ztransactiondetails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ztransactiondetails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ztransactiondetails_id_seq OWNER TO postgres;

--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 243
-- Name: ztransactiondetails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ztransactiondetails_id_seq OWNED BY ztransactiondetails.id;


--
-- TOC entry 245 (class 1259 OID 19643)
-- Name: ztransactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ztransactions (
    id integer NOT NULL,
    "InvoiceNo" text,
    "TDate" text,
    "NonVatTotal" real,
    "VatAmount" real DEFAULT 0,
    "TotalAmount" real DEFAULT 0,
    "Balance" real DEFAULT 0,
    "StaffID" integer,
    "CustID" integer DEFAULT 1
);


ALTER TABLE ztransactions OWNER TO postgres;

--
-- TOC entry 2218 (class 2604 OID 19318)
-- Name: attransactiondetails attdid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attransactiondetails ALTER COLUMN attdid SET DEFAULT nextval('attransactiondetails_attdid_seq'::regclass);


--
-- TOC entry 2219 (class 2604 OID 19327)
-- Name: atvoucher atvoucherid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atvoucher ALTER COLUMN atvoucherid SET DEFAULT nextval('atvoucher_atvoucherid_seq'::regclass);


--
-- TOC entry 2220 (class 2604 OID 19336)
-- Name: batches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY batches ALTER COLUMN id SET DEFAULT nextval('batches_id_seq'::regclass);


--
-- TOC entry 2223 (class 2604 OID 19347)
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 19365)
-- Name: category categoryno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category ALTER COLUMN categoryno SET DEFAULT nextval('category_categoryno_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 19374)
-- Name: company companyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY company ALTER COLUMN companyid SET DEFAULT nextval('company_companyid_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 19394)
-- Name: expensecategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expensecategory ALTER COLUMN id SET DEFAULT nextval('expensecategory_id_seq'::regclass);


--
-- TOC entry 2230 (class 2604 OID 19403)
-- Name: expenses Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY expenses ALTER COLUMN "Id" SET DEFAULT nextval('"expenses_Id_seq"'::regclass);


--
-- TOC entry 2232 (class 2604 OID 19413)
-- Name: heldsales Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY heldsales ALTER COLUMN "Id" SET DEFAULT nextval('"heldsales_Id_seq"'::regclass);


--
-- TOC entry 2233 (class 2604 OID 19422)
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventory ALTER COLUMN id SET DEFAULT nextval('inventory_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 19434)
-- Name: payment Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment ALTER COLUMN "Id" SET DEFAULT nextval('"payment_Id_seq"'::regclass);


--
-- TOC entry 2239 (class 2604 OID 19444)
-- Name: permissions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN "Id" SET DEFAULT nextval('"permissions_Id_seq"'::regclass);


--
-- TOC entry 2244 (class 2604 OID 19465)
-- Name: purchase_order PONo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order ALTER COLUMN "PONo" SET DEFAULT nextval('"purchase_order_PONo_seq"'::regclass);


--
-- TOC entry 2248 (class 2604 OID 19485)
-- Name: purchase_order_expense ExpenseNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order_expense ALTER COLUMN "ExpenseNo" SET DEFAULT nextval('"purchase_order_expense_ExpenseNo_seq"'::regclass);


--
-- TOC entry 2249 (class 2604 OID 19494)
-- Name: purchase_order_payment PaymentNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order_payment ALTER COLUMN "PaymentNo" SET DEFAULT nextval('"purchase_order_payment_PaymentNo_seq"'::regclass);


--
-- TOC entry 2252 (class 2604 OID 19505)
-- Name: purchase_order_receive ReceiveId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order_receive ALTER COLUMN "ReceiveId" SET DEFAULT nextval('"purchase_order_receive_ReceiveId_seq"'::regclass);


--
-- TOC entry 2254 (class 2604 OID 19515)
-- Name: purchase_order_receiving_detail DeliveryId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order_receiving_detail ALTER COLUMN "DeliveryId" SET DEFAULT nextval('"purchase_order_receiving_detail_DeliveryId_seq"'::regclass);


--
-- TOC entry 2256 (class 2604 OID 19525)
-- Name: purchase_order_return PurchaseOrderReturnID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order_return ALTER COLUMN "PurchaseOrderReturnID" SET DEFAULT nextval('"purchase_order_return_PurchaseOrderReturnID_seq"'::regclass);


--
-- TOC entry 2259 (class 2604 OID 19544)
-- Name: suppliercategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY suppliercategory ALTER COLUMN id SET DEFAULT nextval('suppliercategory_id_seq'::regclass);


--
-- TOC entry 2260 (class 2604 OID 19550)
-- Name: suppliers suppid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY suppliers ALTER COLUMN suppid SET DEFAULT nextval('suppliers_suppid_seq'::regclass);


--
-- TOC entry 2261 (class 2604 OID 19559)
-- Name: syncmarker id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY syncmarker ALTER COLUMN id SET DEFAULT nextval('syncmarker_id_seq'::regclass);


--
-- TOC entry 2262 (class 2604 OID 19568)
-- Name: taxsetting taxid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY taxsetting ALTER COLUMN taxid SET DEFAULT nextval('taxsetting_taxid_seq'::regclass);


--
-- TOC entry 2263 (class 2604 OID 19577)
-- Name: transactiondetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transactiondetails ALTER COLUMN id SET DEFAULT nextval('transactiondetails_id_seq'::regclass);


--
-- TOC entry 2273 (class 2604 OID 19603)
-- Name: units id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units ALTER COLUMN id SET DEFAULT nextval('units_id_seq'::regclass);


--
-- TOC entry 2274 (class 2604 OID 19614)
-- Name: zinventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zinventory ALTER COLUMN id SET DEFAULT nextval('zinventory_id_seq'::regclass);


--
-- TOC entry 2278 (class 2604 OID 19626)
-- Name: zpayment Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zpayment ALTER COLUMN "Id" SET DEFAULT nextval('"zpayment_Id_seq"'::regclass);


--
-- TOC entry 2280 (class 2604 OID 19636)
-- Name: ztransactiondetails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ztransactiondetails ALTER COLUMN id SET DEFAULT nextval('ztransactiondetails_id_seq'::regclass);


--
-- TOC entry 2422 (class 0 OID 19315)
-- Dependencies: 186
-- Data for Name: attransactiondetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO attransactiondetails (attdid, atprice, quantity, productname, atinvoiceno) VALUES (3, 5, 1, 'VODACOM R5', '100100062');
INSERT INTO attransactiondetails (attdid, atprice, quantity, productname, atinvoiceno) VALUES (4, 50, 1, 'TELKOM R50', '100100062');
INSERT INTO attransactiondetails (attdid, atprice, quantity, productname, atinvoiceno) VALUES (5, 5, 1, 'CELL C R5', '100100066');
INSERT INTO attransactiondetails (attdid, atprice, quantity, productname, atinvoiceno) VALUES (6, 10, 1, 'CELL C R10', '100100066');
INSERT INTO attransactiondetails (attdid, atprice, quantity, productname, atinvoiceno) VALUES (7, 25, 1, 'CELL C R25', '100100066');


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 185
-- Name: attransactiondetails_attdid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attransactiondetails_attdid_seq', 1, false);


--
-- TOC entry 2424 (class 0 OID 19324)
-- Dependencies: 188
-- Data for Name: atvoucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO atvoucher (atvoucherid, supplier, product, voucherno, expirydate, pinno) VALUES (1, 'VODACOM', 'R5', '100100062', '12/31/2016', '263209252712');
INSERT INTO atvoucher (atvoucherid, supplier, product, voucherno, expirydate, pinno) VALUES (2, 'TELKOM', 'R50', '100100062', '12/31/2016', '263209252712');
INSERT INTO atvoucher (atvoucherid, supplier, product, voucherno, expirydate, pinno) VALUES (3, 'CELL C', 'R5', '100100066', '12/31/2016', '263209252712');
INSERT INTO atvoucher (atvoucherid, supplier, product, voucherno, expirydate, pinno) VALUES (4, 'CELL C', 'R10', '100100066', '12/31/2016', '263209252712');
INSERT INTO atvoucher (atvoucherid, supplier, product, voucherno, expirydate, pinno) VALUES (5, 'CELL C', 'R25', '100100066', '12/31/2016', '263209252712');


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 187
-- Name: atvoucher_atvoucherid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atvoucher_atvoucherid_seq', 1, false);


--
-- TOC entry 2426 (class 0 OID 19333)
-- Dependencies: 190
-- Data for Name: batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO batches (id, "BatchNo", "DateIn", "BuyingPrice", "ItemPrice", "ProductNo", "Quantity", "Remaining", "ExpiryDate") VALUES (1, 'QWC1811190036', '2017-07-11 14:20:31', 57, 1000, '222', 4, '0', '2017-07-11 23:59:59');
INSERT INTO batches (id, "BatchNo", "DateIn", "BuyingPrice", "ItemPrice", "ProductNo", "Quantity", "Remaining", "ExpiryDate") VALUES (2, 'QWC1811190039', '2017-04-11 14:20:31', 60, 505, '222', 4, '1', '2017-07-11 23:59:59');
INSERT INTO batches (id, "BatchNo", "DateIn", "BuyingPrice", "ItemPrice", "ProductNo", "Quantity", "Remaining", "ExpiryDate") VALUES (3, '1001304539646', '2017-07-17 12:40:31', 57, 65, '222', 4, '4', '2017-07-17 23:59:59');


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 189
-- Name: batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('batches_id_seq', 1, false);


--
-- TOC entry 2428 (class 0 OID 19344)
-- Dependencies: 192
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO branches (id, "BranchName", "BranchCode") VALUES (1, 'Headquarters', '100');


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 191
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('branches_id_seq', 1, false);


--
-- TOC entry 2429 (class 0 OID 19353)
-- Dependencies: 193
-- Data for Name: cashdrawer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cashdrawer ("DateIn", "Operation", "Amount", "BranchCode", "StaffId") VALUES ('2017-07-19 08:55:23', 'Opening', 120, '100', '1');
INSERT INTO cashdrawer ("DateIn", "Operation", "Amount", "BranchCode", "StaffId") VALUES ('2017-07-19 08:55:37', 'Add', 34, '100', '1');
INSERT INTO cashdrawer ("DateIn", "Operation", "Amount", "BranchCode", "StaffId") VALUES ('2017-07-19 08:55:44', 'Remove', 20, '100', '1');


--
-- TOC entry 2431 (class 0 OID 19362)
-- Dependencies: 195
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO category (categoryno, categoryname, description) VALUES (1, 'Jewellery', 'Jewellery');
INSERT INTO category (categoryno, categoryname, description) VALUES (2, 'Hair Band', 'Hair Band');
INSERT INTO category (categoryno, categoryname, description) VALUES (3, 'Cream', 'Cream');
INSERT INTO category (categoryno, categoryname, description) VALUES (4, 'Glycerine', 'Glycerine ');
INSERT INTO category (categoryno, categoryname, description) VALUES (5, 'Braids & Weaves', 'Braids and Weave');


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 194
-- Name: category_categoryno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('category_categoryno_seq', 1, false);


--
-- TOC entry 2433 (class 0 OID 19371)
-- Dependencies: 197
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO company (companyid, name, address, phoneno, email, website, tinnumber, currency, cash, mobile, card, cheque, firstinvoice, logo, showtax, receiptmessage, invoicemessage, taxmessage) VALUES (1, 'Queens World Cosmetics', 'Kasarani, Equity area, Nairobi
', '0789-141-568 ', 'queensworldcosmetics@gmail.com', 'www.queensworld.co.ke', '0', 'KES', 1, 1, 0, 0, 12320, '4AAQSkZJRgABAQEAYABgAAD/4QA6RXhpZgAATU0AKgAAAAgAA1EQAAEAAAABAQAAAFERAAQAAAABAAAAAFESAAQAAAABAAAAAAAAAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAByAUcDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD3+iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiq99ewadYzXly+yGFSzH2/xoAqajr1hpd/ZWV1Ltmu32oB29z6AnA//Ua06+e9b1e41vV5r+ckM5+Rc/cUdFH0r1/wR4g/t7Q185s3ltiObPVvRvxA/MGuirh3CCl942rHS0UUVziCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACvL/id4h3zR6Hbv8AKmJLgg9T1VfwHP4j0r0PV9Si0jSbrUJvuQRlsZxuPYficD8a+eLu8mvrya6nfdNM5dz6knNdmEpc0uZ9BXsN3VueEteOga9DcsT9nf8Adzgd0Pf8Dg/hXP7qN1ejKCkrMOY+mVYMoZSCpGQQeCKWuM+G+vf2poP2KZ83NlhOTy0f8J/DkfgPWuzrxJwcJOLGFFFFSAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABWYdf06PVZNNmnENymMCTgPkAjB6d6068z+JFp5WrW10B8s0O0/VT/gRVwipOzOjDUo1Z8kj0yivHNH8X6ro22NZfPtx/wAsZjkAex6j+XtXoWi+MtL1nZF5n2a6P/LGU4yf9k9D/P2pypyiVWwlSlrujoaKKKzOU81+LOrmOCz0iNiDJ+/lHsOFH57vyFeV10Pji+N/4x1Fz92KTyVHps+U/qCfxql4e0aXXtcttPjJUSNmRwPuIOSfy/XFezRiqdJX9TJ6s6fwZ4EGvaXdX18zRxyI0drj+/8A3z6gHjHfn0riru1msbya1uE2TQuUdfQg4r6TtreKztYraBAkMSBEUdgBgV5d8VdCEN3BrUKAJNiKfH98D5T+IGP+Aj1rnoYlzqtS2exTjZHM+Cda/sTxPbTO+23mPkzem1u/4HB/CvfK+Ya+hvCuotqvhbTrxyTI8QVye7KSpP4kGljoaqYQfQ2KKK53XvGOnaIWh3fabsf8sYz90/7R7fzrgSbdkawhKbtFHREhQSTgDqTXL6z480jSi0cTm8uB/BCflB926flmvOdb8VaprjFZ5vLtz0giyF/H1/GsRI2mlSNBl3YKo9Sa6YUFvI7oYO2s2e86FqE2q6LbX08SxPOpbYpyAMnHP0xWhUFlbLZWNvap92GNYx9AMVPXM7X0OCVruwUUUUhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFcr4/sDd+HTOoy9q4fj+6eD/MH8K6qorm3jurWW3lGY5UKMPYjFOLs7mlKfs5qXY8Hgt5rudYIIzJK/CovU/SoZY3ikaORGR1OCrDBH4Voyxz6Dru1v9dZzgj3wcg/Q/1r1y/0fSvEllFJcQLIsiBo5l4cAjIwf6dK65VOW3Y9mviVTabV0zzjQPHV/pLJBdlruzHG1j86D/ZP9D+lep6dqNrqtkl3ZyiSF+hHUH0I7GvLfEPgS/0pXuLQm7tRydo+dB7jv9R+lZ3hXxFL4f1RXZmNnKQs8ft/eA9RUypxmuaJyVaUKseenuczqocaxfCTG/7RJux67jmvT/hRpCw6bc6s6/vJ38qMkdEXrj6n/wBBrjvH+ktpviiedRm2vT9oicdCTyw/PP4EV614Pt1tvB+lRoQQbdZOPVvmP6mujE1L0VbqeVFam3WV4k0saz4dvrHbl5IiY/8AfHK/qBWrRXnJtO6LPmHpXtfwxYjwapkOEWeTBPAxx/XNeT6zZlfFF/ZWyFyLySKJF5J+cgD613+vTv4c8Laf4ahfEph33TKfUklfoWJ/AD1r08U1KCj3Hh6Tq1FBD/FPjiWd5LLSZCkA+V7hfvP/ALp7D371wmGd8AFmY/Uk11GgeDL7Wgs8ubazPIkYfM4/2R/X+dej6T4c0zRUH2S2XzcczP8AM5/Ht+GK5eeNNWR60q1HDLkhq/63PIpvDWqW+lyajdW5t7dMf647WYk4AC9ateB9O/tDxVa5XMdvmd/+A9P/AB4iuj+Juqg/ZdKjbp++lx+Sj+Z/KtD4b6V9l0eXUJFxJdthM/3F4/U5/IVTm/Z3fUznWk6LnLqdrRRRXGeYFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHA/ETQi6JrECZKgJcAenZv6flVz4e6yLzSW06Rv39r90HvGen5Hj8q7CWJJonilQPG6lWVhkEHqDXmWqaDqHg/V11bS1aWzQ5PfYD1Vvb3/AK1tFqUeVndTmqtL2Mt1sen1xHjDwRFqEUl/pkYjvF+Z4lGBL9B2b+ddPo2tWeuWK3No+f78ZPzIfQitCs4ylBnLGU6UvM4+y0S38VeALC2vgVkWLEUoHzRspKg/kOR3/WtTwpaXumaKmmXyDzLQlElU5WVM5Uj09Me3vWzFFHCmyJAq5JwOmScn9TT6bqNpx6ESs5NhUc7vHA7xRGWQKSqA43HsMnpUlFQI5Lwz4Kj0q9l1bUpEutVmdnLKPkjLHJ256nnr/kx2/h1dX8V3+p6im+3ilEcMZHDlQBk+w/U12NAAHQYrR1JSd2aU6jpp8vUAAAABgCq99ewadYzXdw22KJSzH+g9z0p1zdW9lA09zMkUS9Wc4Feea1dar42ultNKtpF02Ns+a4Kq5/vE/wAh1/ooR5nrsVRpc7u9F1ZzsEF54x8UnOQ1w++RhyI4x/gMAfhXs9vBHa28cEKhIo1CIo7ADArK8O+HbXw9ZeVF+8uHwZZiOWPoPQe1bNOpPmdlsisRWVR2jsgooorM5wooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACkDAnAI/OuKmvpfE3j260DzZYtL0uASXKxSFDcSvjarEc7ACeMjJ65FaOpeBdDurN1sbCDTL1QTBd2KCCSJ8EA7kwSOeQeK05ErczNXTUbKTtc6WiuA8IePYj4Vmm8TXkUF1YXD2ssrHHnMozkAclsdgM8V1uqa/pejQxS6heR24mIESufmckgYVep6jOBxRKnKMuWwTozjLlsaVFUdR1ey0qON7uUq0rbYo0QvJIfRUUFmP0Bpmma7p2sNOlpOTNbsFmhljaKSPIyNyOAwB7Ejmo5Xa9tCOWVr20NGisGbxlocDt5l24hWQRNdCCQ26tnGDMF2Dnj73B4qxe+JtE067S1vNUtYZ3GQjygEDaW3H0GAeTxT5Jdh+zn2ZrUVz+h+NvD3iO7ktNL1JJp0G4xlGQkeo3AZ/Cp9R8U6XpZm+0SXDLAMzyQWssyRcZIdkUhTjBwSDgg96OSV7W1B05p8rTubNJkHjIpsMqTwRzRndHIoZTjGQeRXnmnaRp2k/GS8iFhbqLyyW6tm8lf3bg7X2nsTyTj1pwhzX8hwgpXu9lc7QaDpiXv2uC3Fvc93gYx5+oHB/EGtHIHBPNedat4gurT4jaffZH9jrMdIY5P8ArXCuW+mdo/4Ca1vEGj6drvjbRrW5sbef7PDLdTtJErFlGFRCSOV3OTg8fLVum9OZ9LmjpPTne6udhRWXea7p2mzi0YyyTKoJgtLd53RexKxqSo9CQBTbXxNot5o51aHUrf7Cpw8zuECH0bONp5HBweaz5ZWvYx5JWvY1ulICD0Oa56PxP4f12WHSrfUHkmvYDKiwmRHCf3ty4KfiQaz/AIbXCxfDu0uLmYBVad5JZX6DzXJZifzyap02o3f9f1Yt0pKLk9Nvxv8A5HYlgvUgUteb+OtY0vUY9NiimvY7k30AjWRJ4Yp4/NXdtyAknVTkZ45HFejjoPpSlBxim+op03GKb6iPGj43orY6bhnFKGXoCPzrgba5k8ceMNWsZp5U0LSSIWt4nKfapTkHzCDkoMN8vQ8ZzWzqfgfRLiyYafplpYXqZaC5tE+zuj4IB3IAcc9KpwUWlJ6lOmotKb1OmorPv9ZsdLaOK4kdpnGUhhiaaVgOpCICxA7nGBTNL8QaXrKTtZXQZrdis8bqY5IiMjDowDL0PUdqz5Xa9tDPkla9tDTorETxZpL3ltbCS5BupPLt5DaSiKU4JG2QrsYEAkEHBFV73x74Y0+S4S51i3V7fAlCkuQSSNvyg5bIOQOR3AqvZz2sNUpt25WdHRXM3PxB8LWmm2uoTatELe6z5JVGZmx1yoBIx7gVtnVLEab/AGibuAWWzzPPMg2bfXd0xScJLdA6c1ui3RWNZ+KdJvb2GzSaaG4nUvClzbSQeaB12b1G78M1jweNLJ/G97p8ur6etlFbxiIecgLzFiGXOeSMAY96apyd9BqlN302Oxorn9FutLutf1d7DWZ76Y+WZoDP5kNtwQAmBhScHIyTkdqlv/Fmj6d55mmmdLfPnyW9tLMkRHUOyKQpHXBINHI72SF7OV7JG3RWXeeIdPsiqu1xK5QSFba2knZFPQsEUlQcHGcZwfQ1a07ULXVtPgv7KTzLadd8b7SuR9DzUuLSvYTjJK7WhaooopEhRRRQAUUUUAFFFFAHm88o8GfFK51K+/daPrcSp9qIwkUygYDnoM4P5+xrutS1ix0rT2vbq4RYgPkwcmQnoqgfeJ7AdasXdul3aTW8scUiSIVKypvQ5HdT1HtXB23w3vNC1A6t4f1iCG/ZP30dxYR+TKf7qhADEhPXbk9OTjne8KluZ2a/H/I6bwq2c3ZrT1/yMW40C80r4Qa9cXsRivNQnF7LD3iBkUhT7gDJrZ8ceI9F1DwrDFZaha3shu7YlLeQSbQJFPzYztHBHOOeK6/SIdXk014/ER06WeTIaOzjbytvTB3kls/QenvSp4c0OOzks00bT1tZGDvCLZAjMOhK4wTVe1XNeXR30+X+RXt1zXnunfT5f5HFeIJru1+LGlSG9trOK4sGhtJrqFpY/M3fMuA6YYjAznuB3q1qnh7U1vdY1Qa1bT6pPpElvHa21uYSwByH5kY5BOM+4rsJ9G0u6sorK402zmtIseXBJArImBgYUjA4p9hpen6VG8enWFraI5yy28Kxhj6nAGan21krdCfb2St0Vuh554ZtLrxF8NobGDXNLisWtTbzRmwcyQnGGDHzgN3fOB64q5d2kVr4m+H1qblLwQQzqLjA/eBYRh+p9M9TXWt4Y0B7o3T6HprXBfzDKbRCxbOd2cZznnNS3Og6Pe3gvLrSrGe6GMTS26M4x0+YjPFN1lzN9NfxG665m+jv26qxz/iMRp8QfCEhIWUtdJnplfKzgn64qlf6fq2nf2prOgeJLVLISyzTWF/bqYvMHEmZBhgOMgeo9DXZXuladqTRNfWFrdNCcxGeFX2H1GRx0HT0qufDmhm9+2nRtP8AtfmeZ5/2VN+/Od27Gc55zUqokl/XUmNVJLyXk+tx+hXU97oNhdXNsLaea3R3hAwEJA4x2+lcf8RLg6FrHh7xIkTObaWS3dU6sHQ7R78ivQKhubO2vURLq3hnVHEiiVAwVh0YZ6EetTCajPmtoRTqKM+ZrT/M43X/AAvLN8MZ7A4OoRR/bC6cE3AO9iPqSw/GpfAGoHxFFd+I5EKtcLFbKD6Rplse293/ACrsyAQQRkGobSztbC3W3s7aG3gUkrHCgRRk5OAOOtP2t4OLH7a8HF7t/wDD/kjivBFz9n8U+K9OvpAuotffaFD8NJCQAhHqAMD2zVbQrVV1XxzqFsAdJuDiNlPyySKh8wr68nGfX6V22oaNpeqtG2o6bZ3hjyENxAsm3PXGQcdKln0+yurL7FcWdvNaYA8iSMMmB0G0jHGKp1Vq+9vwKdZavva/yt/kYHgKK3XwHokixxgraht20ZBI5OfeuAS4Nt8INCnZj9ji1VWvABn90JnPPtnbXq0GgaNbW09tBpFhFbzgCaKO2RVkx/eAGD+NPtdF0qytpra00yzggmBEsUUCosgIwdwAweOOaaqpNvzv+f8AmUq8VJvu7/n/AJnJ+PdY0+40XTEt7mO4M1/ayqYTvATzB85IzgHBAPc8V3KnKis1fDmhpZPZro2nrau4d4BapsZh0JXGCfer9vbw2lukFtDHDDGNqRxqFVR6ADgVnKUXFJGU5RcVGPQ800y5XwH8QdYh1b9xpetSie2vXGI1fJJVm6DqRz6A9DXo8moWcVmbyS7gS1ChzM0gCbT33dMVJPBDdQPBcRRzQyKVeORQysD1BB4IrPtfDOg2Vylxa6JpsE6HKSRWqKyn2IGRTnOM9XuOdSNSzlv+Zy+mXQtPi3q8V9IqtfWcJsGfgOi53Kp+uTj2NQyWdvcfEjXb1Gxpi6T5GoSxnjzD246sEH4cetdxf6Zp+qxLFqFjbXcatuVLiJZAD6gEdadHYWcVj9hjtIEs9hTyFjAj2nqNvTHtT9qt/KxXtlut7WOFaPxL4WfS411mz1vT57mK3jt57YRzImeDGVOGIXJJPQLn1rR0YRn4oeJWIXeLa1APfGDn+QrobHQdH0udptP0qxtJWXaXgt0RiPTIHTgU2Pw9osN091Ho+npcPu3yrbIHbd97Jxk5yc+tN1E0wdaLT812t1OY8DxW7DxaqpGVfWLlSAByuBx9OTXI3zXCfCLw1OhVbW3vY3uSVLgRh2ALKCNwzjIyK9YstC0jTXd7DSrG1Z12uYLdELD0OByKW20XSrO1mtbXTLOC2mz5sMUCqj5GDuAGDxxzVKslK/mi1iIqXNbqn9yscxqGj3mtvo17d+JdMMFtdxXNvJbWbJ5p7KGMzDDA46VJp8scPxQ19pXVAbG2OWOOMtzXQWXh/RdNuPtFjpFhazYI8yC2RGweoyBmp59M0+5vIbyextpbqH/VTSRKzx/7rEZH4VHtFt0M/aqzXS3l3ucXbNM3jHx4LNv9KNrbiLbyd/ktjH41Y+Gupadd/D6ziWSIG2jaO6jcjKNkklh78nn1rprXQdHsrs3dppVjBcnOZordFc56/MBnmmy+HdEnvTezaPp8l2WDmd7ZC+4dDuxnPA5pyqRat6fgrDlVhKPL6fgrHP6hpGoTazeal4b8RxWUgVBc2s1uskUjKoKZbqilSMkZ9ula3hDUrvVvDdveXsEEU7s4P2cERuAxAdM87WxkHvnNWbvw5od/dNc3mjafcXDY3SzWyOxxwMkjNaYGBgdKiU042InUTio/1/wQooorMyCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD/9k=', 'False', 'Thank you for shopping with us, please come again!', '', '');


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 196
-- Name: company_companyid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('company_companyid_seq', 1, false);


--
-- TOC entry 2434 (class 0 OID 19380)
-- Dependencies: 198
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO customers ("CustId", "CName", "Address", "Phone", "Email", "CreditLimit", "Balance", "LoyaltyPoints") VALUES (0, 'Quick Sale', ' N/A', NULL, NULL, NULL, NULL, NULL);
INSERT INTO customers ("CustId", "CName", "Address", "Phone", "Email", "CreditLimit", "Balance", "LoyaltyPoints") VALUES (1, 'alex', '', '', '', 5000, NULL, NULL);


--
-- TOC entry 2436 (class 0 OID 19391)
-- Dependencies: 200
-- Data for Name: expensecategory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 199
-- Name: expensecategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('expensecategory_id_seq', 1, false);


--
-- TOC entry 2438 (class 0 OID 19400)
-- Dependencies: 202
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 201
-- Name: expenses_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"expenses_Id_seq"', 1, false);


--
-- TOC entry 2440 (class 0 OID 19410)
-- Dependencies: 204
-- Data for Name: heldsales; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 203
-- Name: heldsales_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"heldsales_Id_seq"', 1, false);


--
-- TOC entry 2442 (class 0 OID 19419)
-- Dependencies: 206
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (1, 'QWC8306465', 1, 12, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (2, 'QWC5895043', 2, 12, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (3, 'QWC4158217', 3, 48, '2017-06-22 23:59:00', NULL, NULL, 5, 0, 48, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (4, 'QWC9036225', 4, 36, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 36, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (5, 'QWC3601368', 5, 24, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (6, 'QWC7760020', 6, 48, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 48, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (7, 'QWC1587784', 7, 12, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (8, 'QWC1643915', 8, 24, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (9, 'QWC7752479', 9, 12, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (10, 'QWC3942056', 10, 12, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (11, 'QWC6158182', 11, 24, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (12, 'QWC8600451', 12, 36, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 36, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (13, 'QWC4383908', 13, 24, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (14, 'QWC8736210', 14, 12, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (15, 'QWC5272583', 15, 48, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 48, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (16, 'QWC6486336', 16, 24, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (17, 'QWC5902185', 17, 12, '2017-06-22 23:59:00', NULL, NULL, 13, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (18, 'QWC3954189', 18, 36, '2017-06-22 23:59:00', NULL, NULL, 9, 0, 36, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (19, 'QWC2510993', 19, 24, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (20, 'QWC8631769', 20, 12, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (21, 'QWC4973026', 21, 12, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (22, 'QWC3811881', 22, 12, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (23, 'QWC9909130', 23, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (24, 'QWC2773762', 24, 24, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (25, 'QWC7847466', 25, 12, '2017-06-22 23:59:00', NULL, NULL, 13, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (26, 'QWC2433138', 26, 6, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (27, 'QWC4041795', 27, 24, '2017-06-22 23:59:00', NULL, NULL, 60, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (28, 'QWC7300908', 28, 12, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (29, 'QWC2159601', 29, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (30, 'QWC6527069', 30, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (31, 'QWC9721577', 31, 12, '2017-06-22 23:59:00', NULL, NULL, 35, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (32, 'QWC5856008', 32, 12, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (33, 'QWC3218342', 33, 12, '2017-06-22 23:59:00', NULL, NULL, 13, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (34, 'QWC6728481', 34, 12, '2017-06-22 23:59:00', NULL, NULL, 13, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (35, 'QWC5647967', 35, 24, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (36, 'QWC7831162', 36, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (37, 'QWC7912280', 37, 24, '2017-06-22 23:59:00', NULL, NULL, 9, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (38, 'QWC4535471', 38, 24, '2017-06-22 23:59:00', NULL, NULL, 8, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (39, 'QWC3511764', 39, 12, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (40, 'QWC6926999', 40, 12, '2017-06-22 23:59:00', NULL, NULL, 17, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (41, 'QWC8634443', 41, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (42, 'QWC1918771', 42, 6, '2017-06-22 23:59:00', NULL, NULL, 35, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (43, 'QWC9633375', 43, 3, '2017-06-22 23:59:00', NULL, NULL, 180, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (44, 'QWC2943865', 44, 3, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (45, 'QWC3789304', 45, 3, '2017-06-22 23:59:00', NULL, NULL, 150, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (46, 'QWC5499048', 46, 3, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (47, 'QWC4614169', 47, 24, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (48, 'QWC7267430', 48, 24, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (49, 'QWC8185465', 49, 24, '2017-06-22 23:59:00', NULL, NULL, 11, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (50, 'QWC1675908', 50, 12, '2017-06-22 23:59:00', NULL, NULL, 75, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (51, 'QWC5683030', 51, 12, '2017-06-22 23:59:00', NULL, NULL, 60, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (52, 'QWC6396038', 52, 6, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (53, 'QWC4425344', 53, 6, '2017-06-22 23:59:00', NULL, NULL, 150, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (54, 'QWC4279917', 54, 12, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (55, 'QWC4586543', 55, 12, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (56, 'QWC7811556', 56, 12, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (57, 'QWC7861045', 57, 12, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (58, 'QWC8054749', 58, 24, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (59, 'QWC5786951', 59, 12, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (60, 'QWC6686492', 60, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (61, 'QWC1174244', 61, 12, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (62, 'QWC8191092', 62, 12, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (63, 'QWC4957728', 63, 6, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (64, 'QWC2751001', 64, 6, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (65, 'QWC2743809', 65, 12, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (66, 'QWC9561668', 66, 12, '2017-06-22 23:59:00', NULL, NULL, 35, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (67, 'QWC1075722', 67, 60, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 60, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (68, 'QWC9087480', 68, 12, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (69, 'QWC4608212', 69, 60, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 60, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (70, 'QWC8862778', 70, 12, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (71, 'QWC6390949', 71, 24, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (72, 'QWC2186498', 72, 12, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (73, 'QWC9409389', 73, 24, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (74, 'QWC6225477', 74, 24, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (75, 'QWC2338505', 75, 24, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (76, 'QWC7273220', 76, 36, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 36, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (77, 'QWC5563743', 77, 12, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (78, 'QWC1351095', 78, 24, '2017-06-22 23:59:00', NULL, NULL, 20, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (79, 'QWC9441318', 79, 24, '2017-06-22 23:59:00', NULL, NULL, 10, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (80, 'QWC6161195', 80, 24, '2017-06-22 23:59:00', NULL, NULL, 5, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (81, 'QWC8441008', 81, 24, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (82, 'QWC5994028', 82, 12, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (83, 'QWC1575179', 83, 12, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (84, 'QWC7318773', 84, 12, '2017-06-22 23:59:00', NULL, NULL, 15, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (85, 'QWC5676339', 85, 12, '2017-06-22 23:59:00', NULL, NULL, 13, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (86, 'QWC1429685', 86, 1, '2017-06-22 23:59:00', NULL, NULL, 350, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (87, 'QWC9359752', 87, 2, '2017-06-22 23:59:00', NULL, NULL, 120, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (88, 'QWC8469161', 88, 2, '2017-06-22 23:59:00', NULL, NULL, 200, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (89, 'QWC8690627', 89, 4, '2017-06-22 23:59:00', NULL, NULL, 160, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (90, 'QWC8104991', 90, 4, '2017-06-22 23:59:00', NULL, NULL, 85, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (91, 'QWC5949389', 91, 4, '2017-06-22 23:59:00', NULL, NULL, 130, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (92, 'QWC8459608', 92, 6, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (93, 'QWC9644440', 93, 6, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (94, 'QWC3464065', 94, 3, '2017-06-22 23:59:00', NULL, NULL, 160, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (95, 'QWC8998606', 95, 6, '2017-06-22 23:59:00', NULL, NULL, 25, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (96, 'QWC4283130', 96, 2, '2017-06-22 23:59:00', NULL, NULL, 400, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (97, 'QWC3278280', 97, 1, '2017-06-22 23:59:00', NULL, NULL, 190, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (98, 'QWC2019382', 98, 4, '2017-06-22 23:59:00', NULL, NULL, 110, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (99, 'QWC8177663', 99, 6, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (100, 'QWC4505419', 100, 2, '2017-06-22 23:59:00', NULL, NULL, 310, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (101, 'QWC7902440', 101, 2, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (102, 'QWC7652158', 102, 2, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (103, 'QWC7283365', 103, 6, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (104, 'QWC8655736', 104, 6, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (105, 'QWC2687785', 105, 2, '2017-06-22 23:59:00', NULL, NULL, 300, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (106, 'QWC6602829', 106, 2, '2017-06-22 23:59:00', NULL, NULL, 420, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (107, 'QWC7945846', 107, 2, '2017-06-22 23:59:00', NULL, NULL, 260, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (108, 'QWC8658699', 108, 6, '2017-06-22 23:59:00', NULL, NULL, 230, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (109, 'QWC5854079', 109, 12, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (110, 'QWC5930216', 110, 1, '2017-06-22 23:59:00', NULL, NULL, 230, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (111, 'QWC8894351', 111, 1, '2017-06-22 23:59:00', NULL, NULL, 230, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (112, 'QWC4175820', 112, 3, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (113, 'QWC2152274', 113, 2, '2017-06-22 23:59:00', NULL, NULL, 120, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (114, 'QWC5884185', 114, 2, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (115, 'QWC5523195', 115, 2, '2017-06-22 23:59:00', NULL, NULL, 75, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (116, 'QWC7576695', 116, 2, '2017-06-22 23:59:00', NULL, NULL, 120, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (117, 'QWC6041704', 117, 2, '2017-06-22 23:59:00', NULL, NULL, 35, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (118, 'QWC6938286', 118, 2, '2017-06-22 23:59:00', NULL, NULL, 95, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (119, 'QWC6902737', 119, 2, '2017-06-22 23:59:00', NULL, NULL, 150, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (120, 'QWC4826114', 120, 2, '2017-06-22 23:59:00', NULL, NULL, 65, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (121, 'QWC1610368', 121, 6, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (122, 'QWC6713210', 122, 12, '2017-06-22 23:59:00', NULL, NULL, 400, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (123, 'QWC7225406', 123, 2, '2017-06-22 23:59:00', NULL, NULL, 250, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (124, 'QWC5154570', 124, 2, '2017-06-22 23:59:00', NULL, NULL, 390, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (125, 'QWC5154631', 125, 2, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (126, 'QWC8177600', 126, 2, '2017-06-22 23:59:00', NULL, NULL, 45, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (127, 'QWC9194055', 127, 6, '2017-06-22 23:59:00', NULL, NULL, 360, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (128, 'QWC1896833', 128, 1, '2017-06-22 23:59:00', NULL, NULL, 850, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (129, 'QWC8053223', 129, 2, '2017-06-22 23:59:00', NULL, NULL, 110, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (130, 'QWC9310293', 130, 2, '2017-06-22 23:59:00', NULL, NULL, 170, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (131, 'QWC6016208', 131, 2, '2017-06-22 23:59:00', NULL, NULL, 230, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (132, 'QWC6923638', 132, 2, '2017-06-22 23:59:00', NULL, NULL, 240, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (133, 'QWC6594231', 133, 2, '2017-06-22 23:59:00', NULL, NULL, 150, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (134, 'QWC5775195', 134, 1, '2017-06-22 23:59:00', NULL, NULL, 190, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (135, 'QWC5288075', 135, 1, '2017-06-22 23:59:00', NULL, NULL, 320, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (136, 'QWC1819015', 136, 2, '2017-06-22 23:59:00', NULL, NULL, 95, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (137, 'QWC4026830', 137, 3, '2017-06-22 23:59:00', NULL, NULL, 95, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (138, 'QWC4464062', 138, 2, '2017-06-22 23:59:00', NULL, NULL, 180, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (139, 'QWC6708291', 139, 2, '2017-06-22 23:59:00', NULL, NULL, 280, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (140, 'QWC7156812', 140, 2, '2017-06-22 23:59:00', NULL, NULL, 85, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (141, 'QWC1157775', 141, 1, '2017-06-22 23:59:00', NULL, NULL, 180, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (142, 'QWC2398201', 142, 1, '2017-06-22 23:59:00', NULL, NULL, 320, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (143, 'QWC4175844', 143, 6, '2017-06-22 23:59:00', NULL, NULL, 170, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (144, 'QWC2570581', 144, 6, '2017-06-22 23:59:00', NULL, NULL, 280, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (145, 'QWC5554253', 145, 3, '2017-06-22 23:59:00', NULL, NULL, 95, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (146, 'QWC7131459', 146, 12, '2017-06-22 23:59:00', NULL, NULL, 145, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (147, 'QWC5947051', 147, 12, '2017-06-22 23:59:00', NULL, NULL, 260, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (148, 'QWC2773929', 148, 4, '2017-06-22 23:59:00', NULL, NULL, 153, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (149, 'QWC6159440', 149, 4, '2017-06-22 23:59:00', NULL, NULL, 210, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (150, 'QWC2863640', 150, 2, '2017-06-22 23:59:00', NULL, NULL, 380, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (151, 'QWC4869586', 151, 2, '2017-06-22 23:59:00', NULL, NULL, 140, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (152, 'QWC3908853', 152, 2, '2017-06-22 23:59:00', NULL, NULL, 230, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (153, 'QWC3163021', 153, 2, '2017-06-22 23:59:00', NULL, NULL, 330, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (154, 'QWC8832233', 154, 2, '2017-06-22 23:59:00', NULL, NULL, 530, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (155, 'QWC4385646', 155, 12, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (156, 'QWC1422273', 156, 6, '2017-06-22 23:59:00', NULL, NULL, 270, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (157, 'QWC2442141', 157, 6, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (158, 'QWC9497589', 158, 3, '2017-06-22 23:59:00', NULL, NULL, 120, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (159, 'QWC6613268', 159, 6, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (160, 'QWC9263032', 160, 6, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (161, 'QWC1862691', 161, 3, '2017-06-22 23:59:00', NULL, NULL, 320, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (162, 'QWC1881051', 162, 6, '2017-06-22 23:59:00', NULL, NULL, 55, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (163, 'QWC8541599', 163, 12, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (164, 'QWC1377580', 164, 1, '2017-06-22 23:59:00', NULL, NULL, 330, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (165, 'QWC2237312', 165, 4, '2017-06-22 23:59:00', NULL, NULL, 80, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (166, 'QWC7467189', 166, 2, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (167, 'QWC3818240', 167, 6, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (168, 'QWC2661386', 168, 6, '2017-06-22 23:59:00', NULL, NULL, 85, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (169, 'QWC4008409', 169, 6, '2017-06-22 23:59:00', NULL, NULL, 125, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (170, 'QWC7004949', 170, 6, '2017-06-22 23:59:00', NULL, NULL, 220, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (171, 'QWC2110641', 171, 2, '2017-06-22 23:59:00', NULL, NULL, 260, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (172, 'QWC8033482', 172, 4, '2017-06-22 23:59:00', NULL, NULL, 280, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (173, 'QWC8979072', 173, 3, '2017-06-22 23:59:00', NULL, NULL, 220, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (174, 'QWC3451328', 174, 1, '2017-06-22 23:59:00', NULL, NULL, 290, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (175, 'QWC3607906', 175, 2, '2017-06-22 23:59:00', NULL, NULL, 240, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (176, 'QWC3223160', 176, 2, '2017-06-22 23:59:00', NULL, NULL, 250, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (177, 'QWC6000036', 177, 1, '2017-06-22 23:59:00', NULL, NULL, 110, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (178, 'QWC9315838', 178, 1, '2017-06-22 23:59:00', NULL, NULL, 180, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (179, 'QWC7560061', 179, 2, '2017-06-22 23:59:00', NULL, NULL, 35, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (180, 'QWC5294550', 180, 2, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (181, 'QWC2659650', 181, 1, '2017-06-22 23:59:00', NULL, NULL, 180, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (182, 'QWC8607546', 182, 6, '2017-06-22 23:59:00', NULL, NULL, 60, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (183, 'QWC4452966', 183, 2, '2017-06-22 23:59:00', NULL, NULL, 110, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (184, 'QWC1324719', 184, 2, '2017-06-22 23:59:00', NULL, NULL, 170, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (185, 'QWC1669433', 185, 2, '2017-06-22 23:59:00', NULL, NULL, 60, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (186, 'QWC3862097', 186, 2, '2017-06-22 23:59:00', NULL, NULL, 65, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (187, 'QWC1876533', 187, 2, '2017-06-22 23:59:00', NULL, NULL, 175, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (188, 'QWC5161907', 188, 6, '2017-06-22 23:59:00', NULL, NULL, 150, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (189, 'QWC5148702', 189, 2, '2017-06-22 23:59:00', NULL, NULL, 320, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (190, 'QWC9042250', 190, 2, '2017-06-22 23:59:00', NULL, NULL, 125, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (191, 'QWC6065913', 191, 2, '2017-06-22 23:59:00', NULL, NULL, 220, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (192, 'QWC2092893', 192, 2, '2017-06-22 23:59:00', NULL, NULL, 320, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (193, 'QWC5548589', 193, 2, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (194, 'QWC8940959', 194, 6, '2017-06-22 23:59:00', NULL, NULL, 220, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (195, 'QWC4837982', 195, 2, '2017-06-22 23:59:00', NULL, NULL, 330, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (196, 'QWC9046095', 196, 6, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (197, 'QWC3745378', 197, 4, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (198, 'QWC5346222', 198, 2, '2017-06-22 23:59:00', NULL, NULL, 65, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (199, 'QWC8610741', 199, 12, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (200, 'QWC9599067', 200, 6, '2017-06-22 23:59:00', NULL, NULL, 260, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (201, 'QWC3332409', 201, 6, '2017-06-22 23:59:00', NULL, NULL, 370, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (202, 'QWC5094017', 202, 2, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (203, 'QWC4764485', 203, 12, '2017-06-22 23:59:00', NULL, NULL, 190, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (204, 'QWC5524452', 204, 12, '2017-06-22 23:59:00', NULL, NULL, 285, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (205, 'QWC2538051', 205, 2, '2017-06-22 23:59:00', NULL, NULL, 650, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (206, 'QWC1094522', 206, 6, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (207, 'QWC4308792', 207, 2, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (208, 'QWC5097050', 208, 2, '2017-06-22 23:59:00', NULL, NULL, 65, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (209, 'QWC2437284', 209, 2, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (210, 'QWC2259772', 210, 3, '2017-06-22 23:59:00', NULL, NULL, 190, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (211, 'QWC7720072', 211, 2, '2017-06-22 23:59:00', NULL, NULL, 290, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (212, 'QWC8551061', 212, 3, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (213, 'QWC6383226', 213, 3, '2017-06-22 23:59:00', NULL, NULL, 200, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (214, 'QWC3824247', 214, 6, '2017-06-22 23:59:00', NULL, NULL, 75, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (215, 'QWC4412446', 215, 3, '2017-06-22 23:59:00', NULL, NULL, 300, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (216, 'QWC3986840', 216, 2, '2017-06-22 23:59:00', NULL, NULL, 420, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (217, 'QWC8573133', 217, 1, '2017-06-22 23:59:00', NULL, NULL, 300, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (218, 'QWC5476146', 218, 6, '2017-06-22 23:59:00', NULL, NULL, 110, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (219, 'QWC9146636', 219, 2, '2017-06-22 23:59:00', NULL, NULL, 550, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (220, 'QWC4243755', 220, 2, '2017-06-22 23:59:00', NULL, NULL, 420, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (221, 'QWC1259146', 221, 72, '2017-06-22 23:59:00', NULL, NULL, 57, 0, 72, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (222, 'QWC9246268', 222, 78, '2017-06-22 23:59:00', NULL, NULL, 57, 0, 78, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (223, 'QWC2548363', 223, 2, '2017-06-22 23:59:00', NULL, NULL, 420, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (224, 'QWC3714695', 224, 2, '2017-06-22 23:59:00', NULL, NULL, 410, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (225, 'QWC6246566', 225, 2, '2017-06-22 23:59:00', NULL, NULL, 615, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (226, 'QWC3694378', 226, 3, '2017-06-22 23:59:00', NULL, NULL, 450, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (227, 'QWC2618737', 227, 2, '2017-06-22 23:59:00', NULL, NULL, 405, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (228, 'QWC6129882', 228, 2, '2017-06-22 23:59:00', NULL, NULL, 640, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (229, 'QWC3705361', 229, 2, '2017-06-22 23:59:00', NULL, NULL, 710, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (230, 'QWC3854837', 230, 2, '2017-06-22 23:59:00', NULL, NULL, 570, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (231, 'QWC6198686', 231, 2, '2017-06-22 23:59:00', NULL, NULL, 425, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (232, 'QWC9371676', 232, 6, '2017-06-22 23:59:00', NULL, NULL, 255, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (233, 'QWC5481237', 233, 30, '2017-06-22 23:59:00', NULL, NULL, 52, 0, 30, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (234, 'QWC1655079', 234, 2, '2017-06-22 23:59:00', NULL, NULL, 570, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (235, 'QWC1698864', 235, 18, '2017-06-22 23:59:00', NULL, NULL, 145, 0, 18, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (236, 'QWC7420824', 236, 16, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 16, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (237, 'QWC1055422', 237, 1, '2017-06-22 23:59:00', NULL, NULL, 430, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (238, 'QWC8797231', 238, 10, '2017-06-22 23:59:00', NULL, NULL, 340, 0, 10, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (239, 'QWC3399738', 239, 2, '2017-06-22 23:59:00', NULL, NULL, 425, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (240, 'QWC5170164', 240, 2, '2017-06-22 23:59:00', NULL, NULL, 425, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (241, 'QWC7864630', 241, 3, '2017-06-22 23:59:00', NULL, NULL, 475, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (242, 'QWC4443252', 242, 18, '2017-06-22 23:59:00', NULL, NULL, 285, 0, 18, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (243, 'QWC7921044', 243, 16, '2017-06-22 23:59:00', NULL, NULL, 145, 0, 16, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (244, 'QWC7846579', 244, 2, '2017-06-22 23:59:00', NULL, NULL, 435, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (245, 'QWC7035338', 245, 2, '2017-06-22 23:59:00', NULL, NULL, 420, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (246, 'QWC1754451', 246, 34, '2017-06-22 23:59:00', NULL, NULL, 45, 0, 34, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (247, 'QWC3889898', 247, 10, '2017-06-22 23:59:00', NULL, NULL, 250, 0, 10, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (248, 'QWC1296287', 248, 3, '2017-06-22 23:59:00', NULL, NULL, 78, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (249, 'QWC8879082', 249, 3, '2017-06-22 23:59:00', NULL, NULL, 70, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (250, 'QWC9032905', 250, 2, '2017-06-22 23:59:00', NULL, NULL, 83, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (251, 'QWC7614989', 251, 2, '2017-06-22 23:59:00', NULL, NULL, 52, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (252, 'QWC3130339', 252, 8, '2017-06-22 23:59:00', NULL, NULL, 250, 0, 8, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (253, 'QWC4211618', 253, 84, '2017-06-22 23:59:00', NULL, NULL, 53, 0, 84, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (254, 'QWC6201533', 254, 84, '2017-06-22 23:59:00', NULL, NULL, 53, 0, 84, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (255, 'QWC9194391', 255, 3, '2017-06-22 23:59:00', NULL, NULL, 415, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (256, 'QWC5155919', 256, 9, '2017-06-22 23:59:00', NULL, NULL, 410, 0, 9, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (257, 'QWC5453698', 257, 2, '2017-06-22 23:59:00', NULL, NULL, 490, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (258, 'QWC2623042', 258, 2, '2017-06-22 23:59:00', NULL, NULL, 430, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (259, 'QWC9731122', 259, 9, '2017-06-22 23:59:00', NULL, NULL, 340, 0, 9, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (260, 'QWC8841142', 260, 9, '2017-06-22 23:59:00', NULL, NULL, 340, 0, 9, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (261, 'QWC9193242', 261, 3, '2017-06-22 23:59:00', NULL, NULL, 560, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (262, 'QWC3349649', 262, 2, '2017-06-22 23:59:00', NULL, NULL, 440, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (263, 'QWC5546988', 263, 2, '2017-06-22 23:59:00', NULL, NULL, 415, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (264, 'QWC8688755', 264, 12, '2017-06-22 23:59:00', NULL, NULL, 135, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (265, 'QWC4374924', 265, 2, '2017-06-22 23:59:00', NULL, NULL, 510, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (266, 'QWC4496003', 266, 18, '2017-06-22 23:59:00', NULL, NULL, 250, 0, 18, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (267, 'QWC7895366', 267, 2, '2017-06-22 23:59:00', NULL, NULL, 430, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (268, 'QWC1683078', 268, 12, '2017-06-22 23:59:00', NULL, NULL, 155, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (269, 'QWC1623124', 269, 3, '2017-06-22 23:59:00', NULL, NULL, 450, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (270, 'QWC5993924', 270, 3, '2017-06-22 23:59:00', NULL, NULL, 415, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (271, 'QWC6028139', 271, 2, '2017-06-22 23:59:00', NULL, NULL, 430, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (272, 'QWC2053581', 272, 2, '2017-06-22 23:59:00', NULL, NULL, 490, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (273, 'QWC5165416', 273, 4, '2017-06-22 23:59:00', NULL, NULL, 50, 0, 4, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (274, 'QWC1787401', 274, 2, '2017-06-22 23:59:00', NULL, NULL, 420, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (275, 'QWC4763483', 275, 2, '2017-06-22 23:59:00', NULL, NULL, 550, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (276, 'QWC2913376', 276, 6, '2017-06-22 23:59:00', NULL, NULL, 120, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (277, 'QWC7811214', 277, 6, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (278, 'QWC8596620', 278, 3, '2017-06-22 23:59:00', NULL, NULL, 335, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (279, 'QWC7924508', 279, 24, '2017-06-22 23:59:00', NULL, NULL, 30, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (280, 'QWC5495350', 280, 24, '2017-06-22 23:59:00', NULL, NULL, 13, 0, 24, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (281, 'QWC1867956', 281, 1, '2017-06-22 23:59:00', NULL, NULL, 650, 0, 1, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (282, 'QWC3351946', 282, 6, '2017-06-22 23:59:00', NULL, NULL, 45, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (283, 'QWC6219032', 283, 6, '2017-06-22 23:59:00', NULL, NULL, 90, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (284, 'QWC3680734', 284, 3, '2017-06-22 23:59:00', NULL, NULL, 130, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (285, 'QWC7813823', 285, 3, '2017-06-22 23:59:00', NULL, NULL, 220, 0, 3, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (286, 'QWC8012706', 286, 2, '2017-06-22 23:59:00', NULL, NULL, 100, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (287, 'QWC3927458', 287, 2, '2017-06-22 23:59:00', NULL, NULL, 180, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (288, 'QWC9841237', 288, 2, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (289, 'QWC8271831', 289, 2, '2017-06-22 23:59:00', NULL, NULL, 40, 0, 2, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (290, 'QWC9134650', 290, 6, '2017-06-22 23:59:00', NULL, NULL, 85, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (291, 'QWC4221005', 291, 6, '2017-06-22 23:59:00', NULL, NULL, 35, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (292, 'QWC8245349', 292, 6, '2017-06-22 23:59:00', NULL, NULL, 60, 0, 6, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (293, 'QWC1605197', 293, 12, '2017-06-22 23:59:00', NULL, NULL, 120, 0, 12, '1', '100', 'In', 1, NULL, NULL, NULL, 'Stock Purchase', NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (294, 'QWC889013132', 294, 50, '2017-06-04 18:22:57', '2017-06-04 23:59:59', 0, 6, 0, 50, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (295, 'QWC1245745251', 295, 144, '2017-06-04 18:23:24', '2017-06-04 23:59:59', 0, 1, 0, 144, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (296, 'QWC1138708804', 298, 90, '2017-06-04 18:24:10', '2017-06-04 23:59:59', 0, 3, 0, 90, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (297, 'QWC1213583883', 299, 60, '2017-06-04 18:25:02', '2017-06-04 23:59:59', 0, 5, 0, 60, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (298, 'QWC664219782', 296, 100, '2017-06-04 18:26:13', '2017-06-04 23:59:59', 0, 1, 0, 100, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (299, 'QWC54330581', 302, 864, '2017-06-04 18:27:15', '2017-06-04 23:59:59', 0, 0, 0, 864, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (300, 'QWC996049579', 303, 12, '2017-06-04 18:29:15', '2017-06-04 23:59:59', 0, 10, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (301, 'QWC380632037', 10, 1, '2017-06-04 19:02:55', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (302, 'QWC1864624203', 232, 2, '2017-06-04 19:03:37', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (303, 'QWC498388940', 264, 2, '2017-06-04 19:03:37', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (304, 'QWC204080739', 72, 1, '2017-06-05 11:22:34', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (305, 'QWC300396730', 124, 1, '2017-06-05 11:35:12', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 450, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (306, 'QWC960426801', 123, 1, '2017-06-05 11:37:14', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (307, 'QWC1896785571', 72, 1, '2017-06-05 11:54:45', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (308, 'QWC512738919', 59, 1, '2017-06-05 13:31:07', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (309, 'QWC1325980558', 53, 1, '2017-06-05 14:08:07', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (310, 'QWC2014542474', 304, 12, '2017-06-05 19:32:36', '2017-06-05 23:59:59', 0, 12, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (311, 'QWC27529441', 305, 10, '2017-06-05 19:34:15', '2017-06-05 23:59:59', 0, 140, 0, 10, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (312, 'QWC191629578', 306, 12, '2017-06-05 19:37:09', '2017-06-05 23:59:59', 0, 30, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (313, 'QWC855121059', 307, 6, '2017-06-05 19:39:32', '2017-06-05 23:59:59', 0, 300, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (314, 'QWC1461548850', 308, 6, '2017-06-05 19:42:10', '2017-06-05 23:59:59', 0, 100, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (315, 'QWC1434747710', 309, 12, '2017-06-05 19:44:56', '2017-06-05 23:59:59', 0, 25, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (316, 'QWC1504430674', 310, 35, '2017-06-05 19:46:55', '2017-06-05 23:59:59', 0, 25, 0, 35, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (317, 'QWC2117949398', 311, 20, '2017-06-05 19:50:26', '2017-06-05 23:59:59', 0, 5, 0, 20, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (318, 'QWC855121059', 312, 3, '2017-06-05 19:52:30', '2017-06-05 23:59:59', 0, 300, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (319, 'QWC1179691810', 313, 3, '2017-06-05 19:55:44', '2017-06-05 23:59:59', 0, 335, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (320, 'QWC1126257643', 315, 6, '2017-06-05 20:03:32', '2017-06-05 23:59:59', 0, 115, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (321, 'QWC730273223', 315, 1, '2017-06-05 20:04:02', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (322, 'QWC1213583883', 316, 6, '2017-06-05 20:14:41', '2017-06-05 23:59:59', 0, 100, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (323, 'QWC150646572', 317, 6, '2017-06-05 20:17:38', '2017-06-05 23:59:59', 0, 80, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (324, 'QWC1347421470', 318, 6, '2017-06-05 20:19:50', '2017-06-05 23:59:59', 0, 80, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (325, 'QWC1903876504', 319, 6, '2017-06-05 20:21:55', '2017-06-05 23:59:59', 0, 50, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (326, 'QWC462766162', 320, 6, '2017-06-05 20:23:51', '2017-06-05 23:59:59', 0, 90, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (327, 'QWC1618558054', 321, 6, '2017-06-05 20:27:08', '2017-06-05 23:59:59', 0, 225, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (328, 'QWC1156520193', 322, 12, '2017-06-05 20:30:42', '2017-06-05 23:59:59', 0, 25, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (329, 'QWC1668530811', 323, 3, '2017-06-05 20:37:00', '2017-06-05 23:59:59', 0, 120, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (330, 'QWC733902746', 324, 3, '2017-06-05 20:38:30', '2017-06-05 23:59:59', 0, 130, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (331, 'QWC505479873', 315, 1, '2017-06-05 20:39:17', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (332, 'QWC184538645', 325, 3, '2017-06-05 20:41:21', '2017-06-05 23:59:59', 0, 120, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (333, 'QWC1062103020', 326, 3, '2017-06-05 20:43:20', '2017-06-05 23:59:59', 0, 130, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (334, 'QWC1698793361', 327, 3, '2017-06-05 20:44:48', '2017-06-05 23:59:59', 0, 130, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (335, 'QWC1782658191', 328, 3, '2017-06-05 20:46:24', '2017-06-05 23:59:59', 0, 120, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (336, 'QWC1156520193', 329, 3, '2017-06-05 20:47:53', '2017-06-05 23:59:59', 0, 130, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (337, 'QWC1035301880', 330, 3, '2017-06-05 20:49:39', '2017-06-05 23:59:59', 0, 110, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (338, 'QWC1632739920', 331, 3, '2017-06-05 20:51:52', '2017-06-05 23:59:59', 0, 110, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (339, 'QWC1946758328', 332, 3, '2017-06-05 20:53:03', '2017-06-05 23:59:59', 0, 120, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (340, 'QWC1411576093', 333, 3, '2017-06-05 20:54:25', '2017-06-05 23:59:59', 0, 120, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (341, 'QWC1252836184', 38, 1, '2017-06-06 09:41:05', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (342, 'QWC1511521607', 60, 1, '2017-06-06 10:12:04', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (343, 'QWC1374222610', 19, 1, '2017-06-06 12:01:24', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (344, 'QWC1959209489', 60, 1, '2017-06-06 12:51:08', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (345, 'QWC2146481243', 38, 1, '2017-06-06 16:30:41', NULL, NULL, NULL, 0, 22, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (346, 'QWC837309670', 295, 2, '2017-06-06 20:45:50', NULL, NULL, NULL, 0, 142, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (347, 'QWC221892128', 252, 1, '2017-06-07 11:12:59', NULL, NULL, NULL, 0, 7, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (348, 'QWC246962563', 20, 1, '2017-06-08 09:34:13', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (349, 'QWC767794819', 19, 1, '2017-06-08 09:34:13', NULL, NULL, NULL, 0, 22, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (350, 'QWC735633451', 84, 1, '2017-06-08 09:40:36', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (351, 'QWC1691702428', 117, 1, '2017-06-08 11:09:41', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (352, 'QWC546630992', 60, 1, '2017-06-08 11:09:41', NULL, NULL, NULL, 0, 9, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (353, 'QWC282585341', 315, 1, '2017-06-08 19:06:38', NULL, NULL, NULL, 0, 3, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (354, 'QWC191629578', 60, 1, '2017-06-08 19:18:09', NULL, NULL, NULL, 0, 8, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (355, 'QWC1254735002', 332, 1, '2017-06-08 19:18:33', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (356, 'QWC683929989', 203, 1, '2017-06-08 19:19:14', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (357, 'QWC2034084568', 4, 1, '2017-06-09 09:44:20', NULL, NULL, NULL, 0, 35, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (358, 'QWC962157506', 60, 1, '2017-06-09 09:52:32', NULL, NULL, NULL, 0, 7, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (359, 'QWC1882435592', 160, 1, '2017-06-09 11:45:39', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (360, 'QWC394982016', 264, 2, '2017-06-09 12:47:26', NULL, NULL, NULL, 0, 8, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (361, 'QWC434234317', 4, 1, '2017-06-09 12:47:26', NULL, NULL, NULL, 0, 34, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (362, 'QWC1488349990', 60, 1, '2017-06-09 13:13:27', NULL, NULL, NULL, 0, 6, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (363, 'QWC514469624', 5, 1, '2017-06-09 17:44:22', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (364, 'QWC808777825', 333, 1, '2017-06-09 20:14:10', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (365, 'QWC582253770', 34, 1, '2017-06-10 09:58:43', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (366, 'QWC1936037872', 29, 1, '2017-06-10 09:58:43', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (367, 'QWC482308256', 309, 1, '2017-06-10 10:50:08', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (368, 'QWC1545413680', 136, 1, '2017-06-10 11:20:49', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (369, 'QWC1222573634', 59, 1, '2017-06-10 11:30:41', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (370, 'QWC1085274637', 238, 2, '2017-06-10 12:53:50', NULL, NULL, NULL, 0, 8, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 400, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (371, 'QWC1796840057', 252, 1, '2017-06-10 13:07:30', NULL, NULL, NULL, 0, 6, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (372, 'QWC1119166710', 327, 1, '2017-06-10 14:20:43', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (373, 'QWC1076284886', 59, 1, '2017-06-10 17:25:22', NULL, NULL, NULL, 0, 9, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (374, 'QWC728542518', 172, 1, '2017-06-10 17:28:25', NULL, NULL, NULL, 0, 3, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (375, 'QWC216531900', 31, 1, '2017-06-10 17:30:34', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (376, 'QWC707101606', 28, 1, '2017-06-10 18:09:50', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (377, 'QWC1800469580', 335, 12, '2017-06-10 18:27:54', '2017-06-10 23:59:59', 0, 15, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (378, 'QWC988958646', 336, 5, '2017-06-10 18:32:08', '2017-06-10 23:59:59', 0, 13, 0, 5, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (379, 'QWC1595386437', 302, 6, '2017-06-10 18:36:55', NULL, NULL, NULL, 0, 858, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (380, 'QWC2116218693', 336, 2, '2017-06-10 18:36:55', NULL, NULL, NULL, 0, 3, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 25, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (381, 'QWC1242115728', 335, 1, '2017-06-10 18:36:56', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (382, 'QWC4357824', 337, 10, '2017-06-10 18:44:44', '2017-06-10 23:59:59', 0, 45, 0, 10, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (383, 'QWC553721925', 146, 1, '2017-06-10 18:52:47', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (384, 'QWC2039444796', 73, 2, '2017-06-10 19:00:39', NULL, NULL, NULL, 0, 22, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (385, 'QWC1561494364', 71, 1, '2017-06-10 19:18:34', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (386, 'QWC810508530', 253, 1, '2017-06-10 19:45:09', NULL, NULL, NULL, 0, 83, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (387, 'QWC1675621744', 253, 1, '2017-06-10 19:49:46', NULL, NULL, NULL, 0, 82, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (388, 'QWC1149429260', 292, 1, '2017-06-10 19:52:36', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (389, 'QWC1049483746', 30, 1, '2017-06-11 15:37:08', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (390, 'QWC1147698555', 58, 1, '2017-06-11 15:37:39', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (391, 'QWC439594545', 71, 2, '2017-06-11 16:26:23', NULL, NULL, NULL, 0, 21, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (392, 'QWC1532962519', 196, 1, '2017-06-11 17:36:55', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (393, 'QWC1668530811', 68, 1, '2017-06-11 18:26:33', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (394, 'QWC1276007801', 69, 1, '2017-06-11 18:26:34', NULL, NULL, NULL, 0, 59, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (395, 'QWC1675621744', 333, 1, '2017-06-11 18:57:33', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (396, 'QWC1051382564', 295, 1, '2017-06-11 19:22:13', NULL, NULL, NULL, 0, 141, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (397, 'QWC1090634865', 52, 1, '2017-06-11 19:22:13', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (398, 'QWC650037916', 321, 1, '2017-06-12 15:54:57', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (399, 'QWC95313587', 302, 50, '2017-06-12 17:52:59', NULL, NULL, NULL, 0, 808, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (400, 'QWC2018003884', 305, 1, '2017-06-12 17:53:43', NULL, NULL, NULL, 0, 9, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (401, 'QWC555452630', 13, 1, '2017-06-12 19:22:54', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (402, 'QWC774885752', 67, 1, '2017-06-12 19:38:12', NULL, NULL, NULL, 0, 59, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (403, 'QWC814138053', 68, 1, '2017-06-12 19:38:12', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (404, 'QWC502018463', 302, 10, '2017-06-12 19:38:12', NULL, NULL, NULL, 0, 798, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (405, 'QWC1807560513', 172, 1, '2017-06-12 19:41:21', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (406, 'QWC25798736', 170, 1, '2017-06-13 11:23:08', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (407, 'QWC1124526938', 333, 1, '2017-06-13 11:23:08', NULL, NULL, NULL, 0, 0, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (408, 'QWC2078697097', 315, 1, '2017-06-13 13:12:45', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (409, 'QWC1436646528', 243, 1, '2017-06-13 14:04:41', NULL, NULL, NULL, 0, 15, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (410, 'QWC416422928', 182, 1, '2017-06-13 16:20:06', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (411, 'QWC1795109352', 338, 24, '2017-06-13 17:46:50', '2017-06-13 23:59:59', 0, 20, 0, 24, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (412, 'QWC2026993635', 339, 2, '2017-06-13 17:51:18', '2017-06-13 23:59:59', 0, 120, 0, 2, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (413, 'QWC1183321333', 315, 6, '2017-06-13 19:15:29', '2017-06-13 23:59:59', 0, 115, 0, 8, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (414, 'QWC2026993635', 172, 4, '2017-06-13 19:16:36', '2017-06-13 23:59:59', 0, 280, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (415, 'QWC1570316002', 123, 2, '2017-06-13 19:16:58', '2017-06-13 23:59:59', 0, 250, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (416, 'QWC1789749124', 60, 6, '2017-06-13 19:19:13', '2017-06-13 23:59:59', 0, 20, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (417, 'QWC1156520193', 340, 180, '2017-06-13 19:22:26', '2017-06-13 23:59:59', 0, 1, 0, 180, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (418, 'QWC1309899874', 341, 1, '2017-06-13 19:25:03', '2017-06-13 23:59:59', 0, 650, 0, 1, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (419, 'QWC154107982', 342, 1, '2017-06-13 19:26:29', '2017-06-13 23:59:59', 0, 700, 0, 1, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (420, 'QWC1402754455', 343, 1, '2017-06-13 19:28:05', '2017-06-13 23:59:59', 0, 700, 0, 1, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (421, 'QWC1812920741', 344, 1, '2017-06-13 19:29:24', '2017-06-13 23:59:59', 0, 700, 0, 1, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (422, 'QWC603694682', 345, 4, '2017-06-13 19:31:20', '2017-06-13 23:59:59', 0, 50, 0, 4, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (423, 'QWC726643700', 346, 2, '2017-06-13 19:33:27', '2017-06-13 23:59:59', 0, 150, 0, 2, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (424, 'QWC127474955', 347, 2, '2017-06-13 19:34:48', '2017-06-13 23:59:59', 0, 150, 0, 2, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (425, 'QWC1504430674', 172, 1, '2017-06-13 19:36:37', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (426, 'QWC630327709', 123, 1, '2017-06-13 19:36:38', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (427, 'QWC207710262', 348, 1, '2017-06-13 19:45:15', '2017-06-13 23:59:59', 0, 420, 0, 1, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (428, 'QWC1859263975', 349, 8, '2017-06-13 19:48:21', '2017-06-13 23:59:59', 0, 195, 0, 8, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (429, 'QWC1374222610', 350, 8, '2017-06-13 19:53:07', '2017-06-13 23:59:59', 0, 54, 0, 8, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (430, 'QWC1861162793', 351, 3, '2017-06-13 19:55:54', '2017-06-13 23:59:59', 0, 500, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (431, 'QWC2123309626', 311, 2, '2017-06-13 20:06:23', NULL, NULL, NULL, 0, 18, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (432, 'QWC603694682', 170, 1, '2017-06-13 20:11:40', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (433, 'QWC170188666', 302, 10, '2017-06-14 11:26:33', NULL, NULL, NULL, 0, 788, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (434, 'QWC1302808941', 49, 1, '2017-06-14 11:26:33', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (435, 'QWC1527602291', 204, 1, '2017-06-14 11:27:09', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (436, 'QWC1952118556', 302, 20, '2017-06-14 11:27:33', NULL, NULL, NULL, 0, 768, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (437, 'QWC1821910492', 253, 6, '2017-06-14 11:28:33', NULL, NULL, NULL, 0, 76, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (438, 'QWC61421514', 182, 1, '2017-06-14 11:30:01', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (439, 'QWC1409845388', 302, 50, '2017-06-14 11:35:42', NULL, NULL, NULL, 0, 718, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (440, 'QWC1222573634', 190, 1, '2017-06-14 12:00:13', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (441, 'QWC1301078236', 95, 1, '2017-06-14 12:00:13', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 35, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (442, 'QWC312847891', 254, 1, '2017-06-14 14:51:36', NULL, NULL, NULL, 0, 83, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (443, 'QWC532281013', 294, 2, '2017-06-14 14:53:22', NULL, NULL, NULL, 0, 48, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (444, 'QWC571533314', 311, 1, '2017-06-14 14:53:22', NULL, NULL, NULL, 0, 17, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (445, 'QWC469857095', 252, 2, '2017-06-14 16:56:41', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (446, 'QWC321837642', 336, 1, '2017-06-14 19:27:29', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 25, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (447, 'QWC443055955', 331, 1, '2017-06-14 19:33:25', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (448, 'QWC1796840057', 48, 1, '2017-06-14 19:33:25', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (449, 'QWC123845432', 258, 2, '2017-06-15 14:41:02', NULL, NULL, NULL, 0, 0, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (450, 'QWC65051037', 254, 5, '2017-06-15 16:44:08', NULL, NULL, NULL, 0, 78, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (451, 'QWC1941398100', 65, 2, '2017-06-15 17:16:27', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (452, 'QWC1721964978', 152, 1, '2017-06-15 18:44:06', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (453, 'QWC1224304339', 254, 1, '2017-06-15 19:06:43', NULL, NULL, NULL, 0, 77, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (454, 'QWC1606106893', 31, 1, '2017-06-15 19:09:17', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (455, 'QWC1295718008', 123, 1, '2017-06-15 19:17:16', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (456, 'QWC416422928', 12, 1, '2017-06-15 19:49:41', NULL, NULL, NULL, 0, 35, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (457, 'QWC23899918', 173, 1, '2017-06-15 19:49:42', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (458, 'QWC1859263975', 293, 1, '2017-06-15 19:49:42', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (459, 'QWC163097733', 36, 1, '2017-06-17 14:05:02', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (460, 'QWC1026312129', 36, 1, '2017-06-17 14:05:49', NULL, NULL, NULL, 0, 12, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (461, 'QWC264773952', 36, 1, '2017-06-17 14:06:23', NULL, NULL, NULL, 0, 13, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (462, 'QWC767794819', 138, 1, '2017-06-17 19:05:44', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (463, 'QWC765896001', 57, 1, '2017-06-17 19:09:27', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (464, 'QWC1354512403', 60, 1, '2017-06-17 19:11:05', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (465, 'QWC983598418', 35, 2, '2017-06-17 19:19:37', NULL, NULL, NULL, 0, 22, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (466, 'QWC1215482701', 148, 1, '2017-06-17 19:19:37', NULL, NULL, NULL, 0, 3, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (467, 'QWC182639827', 11, 1, '2017-06-17 19:19:38', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (468, 'QWC414524110', 81, 1, '2017-06-17 19:19:38', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (469, 'QWC714192539', 60, 1, '2017-06-17 19:19:38', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (470, 'QWC594704931', 4, 1, '2017-06-17 19:19:38', NULL, NULL, NULL, 0, 33, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (471, 'QWC1069193953', 306, 1, '2017-06-17 19:21:46', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (472, 'QWC544732174', 301, 100, '2017-06-17 19:26:57', NULL, NULL, 1, 0, 100, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 23, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (473, 'QWC218430718', 296, 1879, '2017-06-17 19:27:33', NULL, NULL, 0, 0, 1979, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (474, 'QWC1561494364', 296, 1879, '2017-06-17 19:27:46', NULL, NULL, 0, 0, 1979, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (475, 'QWC1869984431', 352, 10, '2017-06-17 19:33:14', '2017-06-17 23:59:59', 0, 30, 0, 10, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (476, 'QWC1190412266', 352, 5, '2017-06-17 19:33:57', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (477, 'QWC2016273179', 353, 10, '2017-06-17 19:37:13', '2017-06-17 23:59:59', 0, 70, 0, 10, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (478, 'QWC1811190036', 185, 1, '2017-06-17 19:47:25', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (479, 'QWC735633451', 270, 1, '2017-06-18 11:12:50', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (480, 'QWC696381150', 2, 1, '2017-06-18 12:30:41', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (481, 'QWC553721925', 5, 1, '2017-06-18 12:56:33', NULL, NULL, NULL, 0, 22, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (482, 'QWC808777825', 85, 1, '2017-06-18 13:20:06', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (483, 'QWC476948028', 254, 4, '2017-06-19 10:33:09', NULL, NULL, NULL, 0, 73, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (484, 'QWC2039444796', 59, 1, '2017-06-19 10:33:50', NULL, NULL, NULL, 0, 8, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (485, 'QWC1028210947', 41, 1, '2017-06-19 10:38:46', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (486, 'QWC1661271765', 5, 1, '2017-06-19 10:39:18', NULL, NULL, NULL, 0, 21, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (487, 'QWC1076284886', 67, 1, '2017-06-19 10:39:46', NULL, NULL, NULL, 0, 58, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (488, 'QWC1354512403', 325, 1, '2017-06-19 11:26:26', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (489, 'QWC578624247', 331, 1, '2017-06-19 12:28:40', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (490, 'QWC1618558054', 80, 1, '2017-06-19 12:31:21', NULL, NULL, NULL, 0, 23, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (491, 'QWC1534693224', 294, 1, '2017-06-19 13:06:38', NULL, NULL, NULL, 0, 47, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (492, 'QWC1789749124', 199, 1, '2017-06-19 15:05:56', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (493, 'QWC84593131', 87, 1, '2017-06-19 17:07:55', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (494, 'QWC960426801', 104, 1, '2017-06-20 11:56:23', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (495, 'QWC1627379692', 159, 1, '2017-06-20 11:56:24', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (496, 'QWC548361697', 159, 1, '2017-06-20 12:00:21', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (497, 'QWC1233294090', 4, 1, '2017-06-20 12:00:42', NULL, NULL, NULL, 0, 32, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (498, 'QWC248693268', 222, 1, '2017-06-20 18:00:45', NULL, NULL, NULL, 0, 77, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (499, 'QWC639317460', 5, 1, '2017-06-20 18:52:41', NULL, NULL, NULL, 0, 20, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (500, 'QWC583984475', 328, 1, '2017-06-20 18:59:15', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (501, 'QWC1552504613', 325, 1, '2017-06-20 19:24:04', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (502, 'QWC4357824', 57, 1, '2017-06-20 20:00:22', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (503, 'QWC1989472039', 353, 2, '2017-06-21 16:06:47', '2017-06-21 23:59:59', 0, 500, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 600, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (504, 'QWC254053496', 302, 5, '2017-06-21 16:11:22', NULL, NULL, NULL, 0, 713, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (505, 'QWC696381150', 352, 2, '2017-06-21 16:12:11', '2017-06-21 23:59:59', 0, 190, 0, 7, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 230, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (506, 'QWC1730954729', 258, 8, '2017-06-21 16:17:09', '2017-06-21 23:59:59', 0, 430, 0, 8, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (507, 'QWC773155047', 258, 1, '2017-06-21 16:18:04', NULL, NULL, NULL, 0, 7, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (508, 'QWC901464293', 123, 4, '2017-06-21 16:27:04', '2017-06-21 23:59:59', 0, 250, 0, 5, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (509, 'QWC1324249853', 136, 4, '2017-06-21 16:29:58', '2017-06-21 23:59:59', 0, 95, 0, 5, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (510, 'QWC803417597', 152, 3, '2017-06-21 16:31:15', '2017-06-21 23:59:59', 0, 230, 0, 4, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (511, 'QWC1035301888', 183, 4, '2017-06-21 16:32:45', '2017-06-21 23:59:59', 0, 110, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (512, 'QWC1313529397', 315, 4, '2017-06-21 16:33:43', '2017-06-21 23:59:59', 0, 115, 0, 12, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (513, 'QWC2144750538', 331, 4, '2017-06-21 16:36:04', '2017-06-21 23:59:59', 0, 110, 0, 5, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (514, 'QWC700010673', 325, 4, '2017-06-21 16:36:32', '2017-06-21 23:59:59', 0, 120, 0, 5, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (515, 'QWC660758372', 333, 6, '2017-06-21 16:36:59', '2017-06-21 23:59:59', 0, 120, 0, 6, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (516, 'QWC525190080', 124, 1, '2017-06-21 16:51:20', NULL, NULL, NULL, 0, 2, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (517, 'QWC84593131', 4, 1, '2017-06-21 16:54:26', NULL, NULL, NULL, 0, 33, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (518, 'QWC1115537187', 159, 1, '2017-06-21 16:55:17', NULL, NULL, NULL, 0, 5, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (519, 'QWC1133348576', 159, 1, '2017-06-21 16:59:06', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (520, 'QWC473486618', 322, 1, '2017-06-21 17:40:02', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (521, 'QWC1475898829', 331, 1, '2017-06-21 17:40:02', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (522, 'QWC1090634865', 317, 2, '2017-06-22 10:44:46', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 130, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (523, 'QWC1028210947', 327, 1, '2017-06-22 15:51:24', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (524, 'QWC2044805024', 163, 1, '2017-06-22 15:52:04', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (525, 'QWC66781742', 23, 1, '2017-06-22 15:52:26', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (526, 'QWC1700524066', 105, 1, '2017-06-22 15:53:01', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (527, 'QWC872932448', 50, 1, '2017-06-22 15:57:39', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (528, 'QWC485937779', 136, 1, '2017-06-22 17:25:43', NULL, NULL, NULL, 0, 4, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (529, 'QWC814138053', 18, 1, '2017-06-22 17:29:18', NULL, NULL, NULL, 0, 35, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (530, 'QWC125576137', 94, 2, '2017-06-22 18:01:00', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (531, 'QWC82862426', 315, 1, '2017-06-22 19:44:00', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (532, 'QWC1085274637', 340, 2, '2017-06-22 19:44:00', NULL, NULL, NULL, 0, 178, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (533, 'QWC362820648', 147, 1, '2017-06-23 14:40:11', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (534, 'QWC1340330537', 122, 1, '2017-06-23 17:07:20', NULL, NULL, NULL, 0, 11, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (535, 'QWC1927048121', 96, 1, '2017-06-23 17:33:22', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (536, 'QWC1320620330', 112, 1, '2017-06-23 19:41:38', NULL, NULL, NULL, 0, 2, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (537, 'QWC1730954729', 221, 4, '2017-06-24 11:59:44', NULL, NULL, NULL, 0, 68, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (538, 'QWC1648820604', 112, 1, '2017-06-24 13:13:09', NULL, NULL, NULL, 0, 1, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (539, 'QWC107764748', 12, 1, '2017-06-24 15:08:54', NULL, NULL, NULL, 0, 34, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (540, 'QWC544732174', 2, 1, '2017-06-24 15:12:31', NULL, NULL, NULL, 0, 10, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (541, 'QWC1598847847', 112, 1, '2017-06-24 15:26:03', NULL, NULL, NULL, 0, 0, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (542, 'QWC1823641197', 316, 1, '2017-06-24 16:44:18', NULL, NULL, NULL, 0, 5, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (543, 'QWC774885752', 337, 1, '2017-06-24 17:01:06', NULL, NULL, NULL, 0, 9, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 60, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (544, 'QWC683929989', 295, 4, '2017-06-24 18:30:49', NULL, NULL, NULL, 0, 137, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (545, 'QWC1372323792', 60, 1, '2017-06-24 18:41:31', NULL, NULL, NULL, 0, 9, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (546, 'QWC1365232859', 61, 36, '2017-06-24 18:50:32', NULL, NULL, 70, 0, 48, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (547, 'QWC1411576093', 273, -4, '2017-06-24 18:51:16', NULL, NULL, 0, 0, 0, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (548, 'QWC1379582838', 61, 36, '2017-06-24 18:51:22', NULL, NULL, 0, 0, 48, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 0, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (549, 'QWC1329610081', 266, 2, '2017-06-25 10:41:35', NULL, NULL, NULL, 0, 16, '1', '100', 'Out', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (550, 'QWC175548894328', 264, 1, '2017-06-26 12:38:26', NULL, NULL, NULL, 8, 7, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (551, 'QWC1739776367249', 252, 2, '2017-06-26 13:09:19', NULL, NULL, NULL, 4, 2, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (552, 'QWC1302808941396', 232, 1, '2017-06-26 13:45:13', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (553, 'QWC1286728257195', 273, 4, '2017-06-26 13:53:32', NULL, NULL, 50, 0, 4, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 70, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (554, 'QWC1620288759358', 222, 1, '2017-06-26 15:08:14', NULL, NULL, NULL, 77, 76, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (555, 'QWC787336913363', 165, 1, '2017-06-26 15:53:06', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (556, 'QWC1160149716616', 159, 1, '2017-06-27 09:46:44', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (557, 'QWC1113806482838', 117, 1, '2017-06-27 10:43:06', NULL, NULL, NULL, 1, 0, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (558, 'QWC1443737461555', 232, 2, '2017-06-27 11:55:17', NULL, NULL, NULL, 3, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (559, 'QWC282585341464', 66, 1, '2017-06-28 15:20:30', NULL, NULL, NULL, 12, 11, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 70, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (560, 'QWC1363502154754', 221, 1, '2017-06-28 16:06:56', NULL, NULL, NULL, 68, 67, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (561, 'QWC801686892943', 293, 1, '2017-06-28 19:00:53', NULL, NULL, NULL, 11, 10, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (562, 'QWC1816550264808', 345, 1, '2017-06-28 20:19:10', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (563, 'QWC1966300422276', 316, 1, '2017-06-29 16:33:27', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (564, 'QWC1591756914402', 315, 1, '2017-06-29 16:33:27', NULL, NULL, NULL, 11, 10, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (565, 'QWC767794819920', 266, 1, '2017-06-29 16:40:36', NULL, NULL, NULL, 16, 15, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (566, 'QWC59690809883', 124, 1, '2017-06-30 11:12:20', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 450, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (567, 'QWC1811190036741', 253, 3, '2017-06-30 15:29:12', NULL, NULL, NULL, 76, 73, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (568, 'QWC156006800885', 275, 1, '2017-06-30 17:39:57', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 600, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (569, 'QWC1509790902980', 337, 2, '2017-06-30 17:39:57', NULL, NULL, NULL, 9, 7, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 60, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (570, 'QWC146863978365', 79, 1, '2017-06-30 17:39:58', NULL, NULL, NULL, 24, 23, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (571, 'QWC1069193953681', 200, 1, '2017-06-30 17:45:54', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (572, 'QWC89953359460', 194, 1, '2017-06-30 18:10:25', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (573, 'QWC621506071694', 253, 2, '2017-06-30 18:53:45', NULL, NULL, NULL, 73, 71, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (574, 'QWC1181590628884', 94, 1, '2017-06-30 19:58:42', NULL, NULL, NULL, 1, 0, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (575, 'QWC484207074981', 63, 1, '2017-06-30 20:01:22', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (576, 'QWC796326664876', 182, 1, '2017-07-01 11:54:43', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (577, 'QWC1229664567283', 119, 1, '2017-07-01 13:27:43', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 180, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (578, 'QWC1124526938972', 284, 1, '2017-07-01 14:57:32', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (579, 'QWC1438377233488', 171, 1, '2017-07-01 16:13:18', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (580, 'QWC328928575242', 124, 1, '2017-07-01 17:50:12', NULL, NULL, NULL, 1, 0, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 450, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (581, 'QWC2066245936724', 325, 1, '2017-07-02 11:54:29', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (582, 'QWC44305595566', 315, 1, '2017-07-02 12:35:58', NULL, NULL, NULL, 10, 9, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (583, 'QWC1206492950394', 254, 3, '2017-07-02 14:09:05', NULL, NULL, NULL, 73, 70, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (584, 'QWC1875344659341', 302, 20, '2017-07-02 14:09:41', NULL, NULL, NULL, 713, 693, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (585, 'QWC1240385023417', 254, 2, '2017-07-02 16:27:22', NULL, NULL, NULL, 70, 68, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (586, 'QWC2037714091768', 292, 1, '2017-07-02 16:30:03', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (587, 'QWC564442381782', 231, 1, '2017-07-02 17:28:37', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (588, 'QWC2123309626636', 132, 1, '2017-07-02 17:29:08', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (589, 'QWC2067976641345', 325, 1, '2017-07-02 19:20:20', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (590, 'QWC1773668440272', 228, 1, '2017-07-02 19:21:06', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 700, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (591, 'QWC2134030082770', 175, 1, '2017-07-02 20:04:21', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 350, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (592, 'QWC1249374774930', 179, 1, '2017-07-03 11:52:38', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (593, 'QWC207506757433', 51, 1, '2017-07-03 11:52:39', NULL, NULL, NULL, 12, 11, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (594, 'QWC503749168424', 66, 1, '2017-07-03 13:10:35', NULL, NULL, NULL, 11, 10, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 70, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (595, 'QWC191629578529', 63, 1, '2017-07-03 13:10:35', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (596, 'QWC1490080695333', 254, 2, '2017-07-03 13:47:52', NULL, NULL, NULL, 68, 66, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (597, 'QWC876561971677', 321, 1, '2017-07-03 14:23:43', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (598, 'QWC189898873908', 323, 1, '2017-07-03 16:27:18', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (599, 'QWC963888211166', 170, 1, '2017-07-03 18:52:50', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (600, 'QWC714192539250', 194, 1, '2017-07-03 18:52:50', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (601, 'QWC983598418813', 93, 1, '2017-07-03 19:55:24', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (602, 'QWC1927048121186', 288, 1, '2017-07-05 10:08:06', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (603, 'QWC781976685296', 60, 1, '2017-07-05 10:08:06', NULL, NULL, NULL, 9, 8, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 40, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (604, 'QWC430604794311', 254, 3, '2017-07-05 11:39:00', NULL, NULL, NULL, 66, 63, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (605, 'QWC1240385023417', 199, 1, '2017-07-05 12:37:21', NULL, NULL, NULL, 11, 10, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 120, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (606, 'QWC819498281765', 321, 1, '2017-07-05 12:50:32', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (607, 'QWC1334970309798', 44, 1, '2017-07-05 13:27:18', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (608, 'QWC1138708804348', 222, 1, '2017-07-05 14:16:55', NULL, NULL, NULL, 76, 75, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (609, 'QWC20438508793', 40, 1, '2017-07-06 11:59:03', NULL, NULL, NULL, 12, 11, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 50, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (610, 'QWC394982016667', 123, 2, '2017-07-06 13:19:25', NULL, NULL, NULL, 5, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (611, 'QWC1909236732', 315, 12, '2017-07-06 14:11:06', '2017-07-06 23:59:59', 0, 115, 9, 21, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (612, 'QWC616145843', 328, 6, '2017-07-06 14:11:45', '2017-07-06 23:59:59', 0, 120, 2, 8, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (613, 'QWC1909236732', 325, 6, '2017-07-06 14:12:15', '2017-07-06 23:59:59', 0, 120, 3, 9, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (614, 'QWC180909122', 327, 6, '2017-07-06 14:12:45', '2017-07-06 23:59:59', 0, 130, 1, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (615, 'QWC1343791947', 190, 6, '2017-07-06 14:14:56', '2017-07-06 23:59:59', 0, 125, 1, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (616, 'QWC491298007', 94, 3, '2017-07-06 14:15:47', '2017-07-06 23:59:59', 0, 160, 0, 3, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 200, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (617, 'QWC1484720467', 124, 3, '2017-07-06 14:16:53', '2017-07-06 23:59:59', 0, 390, 0, 3, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 450, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (618, 'QWC230881879', 123, 6, '2017-07-06 14:17:17', '2017-07-06 23:59:59', 0, 250, 3, 9, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (619, 'QWC1998461790', 354, 3, '2017-07-06 14:20:05', '2017-07-06 23:59:59', 0, 130, 0, 3, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 180, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (620, 'QWC1869984431', 275, 8, '2017-07-06 14:24:21', '2017-07-06 23:59:59', 0, 550, 1, 9, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 600, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (621, 'QWC578624247', 228, 6, '2017-07-06 14:25:13', '2017-07-06 23:59:59', 0, 640, 1, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 700, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (622, 'QWC1379582838', 231, 6, '2017-07-06 14:27:29', '2017-07-06 23:59:59', 0, 425, 1, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (623, 'QWC1793378647', 232, 6, '2017-07-06 14:27:52', '2017-07-06 23:59:59', 0, 255, 1, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 300, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (624, 'QWC400342244', 355, 9, '2017-07-06 14:49:32', '2017-07-06 23:59:59', 0, 90, 0, 9, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (625, 'QWC519829852625', 315, 1, '2017-07-06 14:59:59', NULL, NULL, NULL, 21, 20, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (626, 'QWC1618558054737', 340, 2, '2017-07-06 14:59:59', NULL, NULL, NULL, 178, 176, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (627, 'QWC441325250445', 202, 1, '2017-07-06 17:24:41', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (628, 'QWC1440107938109', 333, 1, '2017-07-06 18:29:21', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (629, 'QWC617876548248', 45, 1, '2017-07-06 20:44:58', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (630, 'QWC707101606562', 89, 1, '2017-07-07 14:02:21', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 230, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (631, 'QWC125576137104', 91, 1, '2017-07-07 14:22:14', NULL, NULL, NULL, 4, 3, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 180, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (632, 'QWC899733588566', 123, 1, '2017-07-07 15:55:55', NULL, NULL, NULL, 9, 8, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (633, 'QWC1818280969429', 253, 2, '2017-07-07 15:57:23', NULL, NULL, NULL, 71, 69, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (634, 'QWC384261560533', 157, 1, '2017-07-07 17:19:06', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (635, 'QWC1317158920976', 324, 1, '2017-07-07 18:18:50', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (636, 'QWC1292088485262', 206, 1, '2017-07-07 18:22:46', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (637, 'QWC1641729671626', 45, 1, '2017-07-08 10:47:13', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 3, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (638, 'QWC1805829808674', 253, 1, '2017-07-08 14:15:06', NULL, NULL, NULL, 69, 68, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (639, 'QWC1416936321220', 254, 4, '2017-07-10 12:33:44', NULL, NULL, NULL, 63, 59, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (640, 'QWC1042392813346', 45, 1, '2017-07-10 12:33:44', NULL, NULL, NULL, 1, 0, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (641, 'QWC218430718864', 254, 4, '2017-07-10 13:16:53', NULL, NULL, NULL, 0, 63, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (642, 'QWC1668530811961', 45, 1, '2017-07-10 13:16:53', NULL, NULL, NULL, 0, 1, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (643, 'QWC2009182246812', 231, 1, '2017-07-10 15:45:04', NULL, NULL, NULL, 7, 6, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (644, 'QWC1878974182787', 45, 1, '2017-07-10 15:45:43', NULL, NULL, NULL, 1, 0, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (645, 'QWC1340330537865', 89, 1, '2017-07-10 16:00:47', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 230, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (646, 'QWC1930677644632', 340, 1, '2017-07-10 16:01:14', NULL, NULL, NULL, 176, 175, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (647, 'QWC737364156139', 182, 1, '2017-07-10 16:07:53', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (648, 'QWC150646572818', 350, 1, '2017-07-10 16:08:13', NULL, NULL, NULL, 8, 7, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (649, 'QWC1714874045739', 350, 2, '2017-07-10 16:08:58', NULL, NULL, NULL, 7, 5, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (650, 'QWC965787029991', 340, 1, '2017-07-10 16:11:01', NULL, NULL, NULL, 175, 174, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (651, 'QWC56061286437', 253, 1, '2017-07-10 16:16:11', NULL, NULL, NULL, 68, 67, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (652, 'QWC423513861623', 231, 1, '2017-07-10 16:18:52', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (653, 'QWC18485435196', 89, 1, '2017-07-10 16:20:10', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 230, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (654, 'QWC589344703292', 324, 1, '2017-07-10 16:21:48', NULL, NULL, NULL, 0, 3, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (655, 'QWC1042392813346', 324, 1, '2017-07-10 16:22:03', NULL, NULL, NULL, 3, 2, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (656, 'QWC1347421470553', 228, 1, '2017-07-10 16:32:57', NULL, NULL, NULL, 7, 6, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 700, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (657, 'QWC79442784651', 324, 2, '2017-07-10 16:45:15', NULL, NULL, NULL, 2, 0, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 170, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (658, 'QWC858750582855', 340, 1, '2017-07-10 16:58:50', NULL, NULL, NULL, 174, 173, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (659, 'QWC521560557246', 340, 1, '2017-07-10 17:00:10', NULL, NULL, NULL, 173, 172, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (660, 'QWC2067976641345', 340, 1, '2017-07-10 17:04:56', NULL, NULL, NULL, 172, 171, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (661, 'QWC6303277093', 115, 1, '2017-07-10 17:07:39', NULL, NULL, NULL, 2, 1, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (662, 'QWC1691702428850', 340, 1, '2017-07-10 17:13:59', NULL, NULL, NULL, 171, 170, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (663, 'QWC389621788600', 228, 2, '2017-07-10 17:16:06', NULL, NULL, NULL, 6, 4, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 700, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (664, 'QWC503749168424', 222, 1, '2017-07-10 17:21:22', NULL, NULL, NULL, 75, 74, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (671, 'QWC610785615', 319, -1, '2017-07-10 21:18:00', NULL, NULL, NULL, 0, 5, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (672, 'QWC949706345', 319, -1, '2017-07-10 21:18:06', NULL, NULL, NULL, 0, 4, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (673, 'QWC1475898829', 319, -1, '2017-07-10 21:18:12', NULL, NULL, NULL, 0, 3, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (674, 'QWC1392033999', 342, -1, '2017-07-11 08:58:55', NULL, NULL, NULL, 0, 0, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (675, 'QWC1914596960431', 0, 1, '2017-07-11 09:13:00', NULL, NULL, NULL, 0, 1, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (676, 'QWC1431286300800', 0, 1, '2017-07-11 09:30:35', NULL, NULL, NULL, 1, 2, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (677, 'QWC960426801924', 0, 4, '2017-07-11 09:30:36', NULL, NULL, NULL, 2, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (678, 'QWC2134030082770', 0, 0, '2017-07-11 09:30:37', NULL, NULL, NULL, 6, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (679, 'QWC2089417553', 319, -1, '2017-07-11 09:31:08', NULL, NULL, NULL, 0, 2, '1', '100', 'In', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (680, 'QWC232612584240', 0, 1, '2017-07-11 09:40:51', NULL, NULL, NULL, 6, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (681, 'QWC1734416139182', 0, 4, '2017-07-11 09:40:52', NULL, NULL, NULL, 7, 11, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (682, 'QWC988958646880', 0, 0, '2017-07-11 09:40:52', NULL, NULL, NULL, 11, 11, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (683, 'QWC121358388382', 124, 1, '2017-07-11 09:50:35', NULL, NULL, NULL, 3, 4, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (684, 'QWC753444840340', 319, 4, '2017-07-11 09:50:36', NULL, NULL, NULL, 2, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (685, 'QWC95852798399', 342, 0, '2017-07-11 09:50:37', NULL, NULL, NULL, 0, 0, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (686, 'QWC382530855912', 124, 1, '2017-07-11 09:59:15', NULL, NULL, NULL, 4, 5, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (687, 'QWC609054910939', 319, 4, '2017-07-11 09:59:16', NULL, NULL, NULL, 6, 10, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (688, 'QWC428874089690', 342, 0, '2017-07-11 09:59:17', NULL, NULL, NULL, 0, 0, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (689, 'QWC1160149716', 319, -4, '2017-07-11 10:00:53', NULL, NULL, NULL, 0, 14, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (690, 'QWC1268916868', 319, 2, '2017-07-11 10:01:08', NULL, NULL, NULL, 0, 16, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (691, 'QWC266504657', 319, -1, '2017-07-11 10:02:31', NULL, NULL, NULL, 0, 17, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (692, 'QWC38249897', 319, -2, '2017-07-11 10:05:42', NULL, NULL, NULL, 0, 19, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (693, 'QWC2073336869', 319, 5, '2017-07-11 10:05:57', NULL, NULL, NULL, 0, 24, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (694, 'QWC202350034', 124, -1, '2017-07-11 10:06:31', NULL, NULL, NULL, 0, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (695, 'QWC163097733', 319, -1, '2017-07-11 10:06:40', NULL, NULL, NULL, 0, 25, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (696, 'QWC1566854592892', 265, 1, '2017-07-11 10:19:46', NULL, NULL, NULL, 2, 3, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (697, 'QWC254053496508', 294, 1, '2017-07-11 10:19:50', NULL, NULL, NULL, 47, 48, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (698, 'QWC375271809', 294, -1, '2017-07-11 10:20:22', NULL, NULL, NULL, 0, 49, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (699, 'QWC1527602291', 294, 1, '2017-07-11 10:23:13', NULL, NULL, NULL, 0, 50, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (700, 'QWC1213583883', 294, -1, '2017-07-11 10:23:29', NULL, NULL, NULL, 0, 51, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (701, 'QWC255784201', 265, -1, '2017-07-11 10:24:55', NULL, NULL, NULL, 0, 4, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (702, 'QWC1475898829', 265, -1, '2017-07-11 10:25:03', NULL, NULL, NULL, 0, 5, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (703, 'QWC1882435592', 265, 1, '2017-07-11 10:39:56', NULL, NULL, NULL, 0, 4, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (704, 'QWC621506071', 294, 1, '2017-07-11 10:43:58', NULL, NULL, NULL, 0, 50, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (705, 'QWC1937768577', 265, 1, '2017-07-11 10:47:00', NULL, NULL, NULL, 0, 5, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (706, 'QWC1627379692', 294, 1, '2017-07-11 10:57:23', NULL, NULL, NULL, 0, 51, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (707, 'QWC2100138009', 265, 1, '2017-07-11 10:59:02', NULL, NULL, NULL, 0, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (708, 'QWC1397394227', 294, 1, '2017-07-11 11:02:06', NULL, NULL, NULL, 0, 52, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (709, 'QWC541270764', 294, 1, '2017-07-11 11:04:30', NULL, NULL, NULL, 0, 51, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (710, 'QWC38249897', 294, 1, '2017-07-11 11:07:34', NULL, NULL, NULL, 0, 50, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (711, 'QWC1511521607', 265, 1, '2017-07-11 11:07:44', NULL, NULL, NULL, 0, 5, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (712, 'QWC1821910492', 294, 1, '2017-07-11 11:08:21', NULL, NULL, NULL, 0, 51, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (713, 'QWC1122628120', 265, 1, '2017-07-11 11:11:49', NULL, NULL, NULL, 0, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (714, 'QWC1823641197', 294, 1, '2017-07-11 11:12:04', NULL, NULL, NULL, 0, 52, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (715, 'QWC1839721881', 294, 1, '2017-07-11 11:14:10', NULL, NULL, NULL, 0, 51, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (716, 'QWC997780284', 265, 1, '2017-07-11 11:14:20', NULL, NULL, NULL, 0, 5, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (717, 'QWC2060885708', 265, 1, '2017-07-11 11:14:32', NULL, NULL, NULL, 0, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (718, 'QWC580523065', 294, 1, '2017-07-11 11:14:39', NULL, NULL, NULL, 0, 52, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (719, 'QWC1431286300', 294, 1, '2017-07-11 11:16:54', NULL, NULL, NULL, 0, 51, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (720, 'QWC1331340786352', 265, 1, '2017-07-11 11:28:25', NULL, NULL, NULL, 6, 7, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (721, 'QWC469857095401', 294, 1, '2017-07-11 11:28:26', NULL, NULL, NULL, 51, 52, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (722, 'QWC22169213414', 228, 2, '2017-07-11 13:23:09', NULL, NULL, NULL, 0, 6, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (723, 'QWC213070490797', 222, 1, '2017-07-11 13:23:19', NULL, NULL, NULL, 0, 75, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (724, 'QWC2039444796389', 228, 1, '2017-07-11 13:45:48', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 700, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (725, 'QWC1359872631308', 124, 1, '2017-07-11 13:47:44', NULL, NULL, NULL, 6, 5, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 450, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (726, 'QWC1811190036', 222, 4, '2017-07-11 14:20:31', '2017-07-11 23:59:59', 0, 57, 75, 79, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (727, 'QWC881922199744', 124, 1, '2017-07-11 14:34:01', NULL, 1, NULL, 5, 6, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (728, 'QWC350369487510', 319, 4, '2017-07-11 14:34:03', NULL, 1, NULL, 25, 29, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (729, 'QWC300396730286', 342, 0, '2017-07-11 14:34:04', NULL, 1, NULL, 0, 0, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (730, 'QWC1986010629923', 331, 1, '2017-07-11 14:34:04', NULL, 1, NULL, 4, 5, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '3');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (731, 'QWC1702422884984', 38, 1, '2017-07-11 14:55:30', NULL, 1, NULL, 22, 23, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (732, 'QWC1177961105438', 294, 3, '2017-07-11 14:55:32', NULL, 1, NULL, 52, 55, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (733, 'QWC170188666261', 9, 1, '2017-07-11 14:55:33', NULL, 1, NULL, 12, 13, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, NULL, '4');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (734, 'QWC773155047987', 18, 1, '2017-07-11 15:08:15', NULL, 1, 20, 35, 36, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 20, '2');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (735, 'QWC833680147141', 28, 1, '2017-07-11 15:08:16', NULL, 1, 150, 11, 12, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 150, '2');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (736, 'QWC1056742792926', 18, 1, '2017-07-12 15:41:29', NULL, NULL, NULL, 36, 35, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (737, 'QWC270134180709', 331, 1, '2017-07-12 15:48:15', NULL, NULL, NULL, 5, 4, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (738, 'QWC2116218693948', 331, 1, '2017-07-12 15:49:33', NULL, NULL, NULL, 0, 5, '1', '100', 'Reversal', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (739, 'QWC95852798399', 18, 5, '2017-07-12 15:56:57', NULL, 1, 9, 35, 40, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 20, '5');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (740, 'QWC1003140512256', 347, 1, '2017-07-12 15:56:57', NULL, 1, 150, 2, 3, '1', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 250, '5');
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (741, 'QWC1290357780641', 340, 3, '2017-07-13 14:29:18', NULL, NULL, NULL, 170, 167, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 10, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (742, 'QWC1397394227777', 320, 5, '2017-07-13 14:29:18', NULL, NULL, NULL, 6, 1, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 140, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (743, 'QWC960426801924', 296, 1, '2017-07-15 11:54:16', NULL, NULL, 0, 1979, 1980, '1', '100', 'Correction', 1, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (746, 'QWC230881879619', 222, 1, '2017-07-15 13:08:27', NULL, NULL, NULL, 75, 74, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (747, 'QWC792697141430', 222, 1, '2017-07-15 13:09:40', NULL, NULL, NULL, 74, 73, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (748, 'QWC1811190036741', 18, 1, '2017-07-15 13:25:49', NULL, NULL, NULL, 40, 39, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (749, 'QWC411062700868', 222, 1, '2017-07-15 13:25:49', NULL, NULL, NULL, 73, 72, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (750, 'QWC291575092977', 18, 1, '2017-07-15 13:26:32', NULL, NULL, NULL, 39, 38, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (751, 'QWC1247475956105', 222, 1, '2017-07-15 13:26:33', NULL, NULL, NULL, 72, 71, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (752, 'QWC1812920741362', 222, 1, '2017-07-15 13:26:46', NULL, NULL, NULL, 71, 70, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (756, 'QWC1895054866988', 222, 1, '2017-07-15 13:31:53', NULL, NULL, NULL, 67, 66, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (757, 'QWC1012130263769', 28, 1, '2017-07-15 13:33:14', NULL, NULL, NULL, 12, 11, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (758, 'QWC1374222610888', 222, 1, '2017-07-15 13:33:14', NULL, NULL, NULL, 66, 65, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (760, 'QWC118485204416', 222, 1, '2017-07-15 13:34:39', NULL, NULL, NULL, 64, 63, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 500, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (762, 'QWC1088736047124', 222, 1, '2017-07-15 13:35:02', NULL, NULL, NULL, 62, 61, '1', '100', 'Sale', 1, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (763, '1001042392813346', 222, 1, '2017-07-17 11:42:39', NULL, NULL, NULL, 61, 60, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 505, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (764, '1001304539646', 222, 4, '2017-07-17 12:40:31', '2017-07-17 23:59:59', 0, 57, 60, 64, '1001304539646', '100', 'Purchase', NULL, NULL, NULL, NULL, NULL, 65, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (765, '1001006770035702', 347, 2, '2017-07-17 16:53:03', NULL, NULL, NULL, 3, 1, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 250, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (766, '1001359872631308', 108, 1, '2017-07-17 16:53:28', NULL, NULL, NULL, 6, 5, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 280, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (767, '1001040662108725', 265, 2, '2017-07-17 16:54:08', NULL, NULL, NULL, 7, 5, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 560, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (768, '10088222654839', 14, 1, '2017-07-17 16:54:55', NULL, NULL, NULL, 12, 11, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (769, '1002123309626636', 38, 1, '2017-07-17 16:55:17', NULL, NULL, NULL, 23, 22, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (770, '10036519192994', 222, 1, '2017-07-18 10:38:26', NULL, NULL, NULL, 64, 63, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 505, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (771, '1002014542474879', 28, 1, '2017-07-18 10:52:51', NULL, NULL, NULL, 11, 10, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (772, '100833680147141', 38, 1, '2017-07-18 11:38:29', NULL, NULL, NULL, 22, 21, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (773, '100990689351501', 222, 1, '2017-07-18 11:39:09', NULL, NULL, NULL, 63, 62, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 505, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (774, '1001079914409815', 28, 1, '2017-07-18 12:09:07', NULL, NULL, NULL, 10, 9, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (775, '100414524110110', 14, 1, '2017-07-18 12:26:24', NULL, NULL, NULL, 11, 10, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (776, '100819498281765', 38, 1, '2017-07-18 12:35:33', NULL, NULL, NULL, 21, 20, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 100, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (777, '1001538322747936', 265, 3, '2017-07-19 09:08:08', NULL, NULL, NULL, 5, 2, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 560, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (778, '100660758372784', 18, 7, '2017-07-19 09:25:08', NULL, NULL, NULL, 38, 31, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 20, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (779, '1006088529213', 14, 1, '2017-07-19 09:26:02', NULL, NULL, NULL, 10, 9, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 30, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (780, '100651768621271', 319, 1, '2017-07-19 09:26:02', NULL, NULL, NULL, 29, 28, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 80, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (781, '1001042392813346', 331, 1, '2017-07-19 09:26:02', NULL, NULL, NULL, 5, 4, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 150, NULL);
INSERT INTO inventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "Initial", "Balance", "BatchNo", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment", "ItemPrice", "PONo") VALUES (782, '1001825371902117', 18, 1, '2017-07-24 09:50:19', NULL, NULL, NULL, 31, 30, NULL, '100', 'Sale', 1, NULL, NULL, NULL, NULL, 20, NULL);


--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 205
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('inventory_id_seq', 1, false);


--
-- TOC entry 2444 (class 0 OID 19431)
-- Dependencies: 208
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO payment ("Id", "PaymentId", "InvoiceNo", "Amount", "Cash", "MobileAmount", "Phone", "TxCode", "CardAmount", "ChangeGiven", "CustId", "DateIn", "Overpayment", "StaffId", "PaymentType") VALUES (1, '1001-1019221196', '1001', 140, NULL, NULL, '', '', NULL, 0, 0, '2017-07-19 09:25:08', NULL, 1, 'Cash');
INSERT INTO payment ("Id", "PaymentId", "InvoiceNo", "Amount", "Cash", "MobileAmount", "Phone", "TxCode", "CardAmount", "ChangeGiven", "CustId", "DateIn", "Overpayment", "StaffId", "PaymentType") VALUES (2, '1002-434234317', '1002', 260, NULL, NULL, '', '', NULL, 0, 0, '2017-07-19 09:26:01', NULL, 1, 'Cash');
INSERT INTO payment ("Id", "PaymentId", "InvoiceNo", "Amount", "Cash", "MobileAmount", "Phone", "TxCode", "CardAmount", "ChangeGiven", "CustId", "DateIn", "Overpayment", "StaffId", "PaymentType") VALUES (3, '1003-1641729671', '1003', 20, NULL, NULL, '', '', NULL, 37, 0, '2017-07-24 09:50:18', NULL, 1, 'Cash');


--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 207
-- Name: payment_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"payment_Id_seq"', 1, false);


--
-- TOC entry 2446 (class 0 OID 19441)
-- Dependencies: 210
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (1, '5', 'returngoods');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (2, '5', 'correctinvoice');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (3, '5', 'pos');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (4, '5', 'reports');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (5, '5', 'expenses');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (6, '5', 'inventory');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (7, '5', 'invoices');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (8, '5', 'customers');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (9, '5', 'suppliers');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (10, '5', 'product');
INSERT INTO permissions ("Id", "StaffId", "Function") VALUES (11, '3', 'pos');


--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 209
-- Name: permissions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"permissions_Id_seq"', 1, false);


--
-- TOC entry 2447 (class 0 OID 19448)
-- Dependencies: 211
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (1, 'Big love bangles', 'Big love bangles', NULL, 100, 50, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (2, 'chained bracelets', 'chained bracelets', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (3, 'Dot mix small earing', 'Dot mix small earing', NULL, 50, 5, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (4, 'sponge B/S', 'sponge B/S', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (5, 'Sponge  S/S', 'Sponge  S/S', NULL, 30, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (6, 'Hooked earings', 'Hooked earings', NULL, 100, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (7, 'Coloured earings-Hooked', 'Coloured earings-Hooked', NULL, 100, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (8, 'coated chains', 'coated chains', NULL, 200, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (9, 'white bangles', 'white bangles', NULL, 100, 50, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (10, 'NECKLACE', 'Necklace', '', 50, 25, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (11, 'Round earings', 'Round earings', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (12, 'Long/ hanging earings', 'Long/ hanging earings', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (13, 'Bigsize hairband', 'Bigsize hairband', NULL, 50, 25, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (14, 'small size Hairband', 'small size Hairband', NULL, 30, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (15, 'Oval shiny hair clip', 'Oval shiny hair clip', NULL, 50, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (16, 'Arrow hair hairclip', 'Arrow hair hairclip', NULL, 50, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (17, 'Fish coloured hair clip', 'Fish coloured hair clip', NULL, 50, 13, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (18, 'Elastic Alice hairband', 'Elastic Alice hairband', NULL, 20, 9, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (19, 'Macho earings B/s (small)', 'Macho earings B/s (small)', NULL, 20, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (20, 'MACHO EARINGS S/S (SMALL)', 'Macho earings s/s (small)', '', 20, 10, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (21, 'silver chains (plain)', 'silver chains (plain)', NULL, 200, 50, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (22, 'Dotted silver chain', 'Dotted silver chain', NULL, 200, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (23, 'Absolute lipgloss', 'Absolute lipgloss', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (24, 'Squeeze & shine lipgloss', 'Squeeze & shine lipgloss', NULL, 50, 25, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (25, 'Glittered lipgloss', 'Glittered lipgloss', NULL, 30, 13, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (26, 'Clolourless tube lipgloss', 'Clolourless tube lipgloss', NULL, 50, 25, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (27, 'Nail art-nail polish', 'Nail art-nail polish', NULL, 100, 60, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (28, 'Eye shadow', 'Eye shadow', NULL, 150, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (29, 'BLACK OPAL LIPGLOSS', 'Black Opal lipgloss', '', 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (30, 'CHARMAX LIPSTIC 24 HRS', 'Charmax lipstick 24 hrs', '', 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (31, 'Signature lipstick', 'Signature lipstick', NULL, 50, 35, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (32, 'Fruit lipbalm B/S', 'Fruit lipbalm B/S', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (33, 'Fruit lipbalm S/S', 'Fruit lipbalm S/S', NULL, 30, 13, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (34, 'LIPSTICK', 'Black Opal Lipstick', '', 50, 13, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (36, 'Alex big comb', 'Alex big comb', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (37, 'Small jolly comb/Tail comb', 'Small jolly comb/Tail comb', NULL, 20, 9, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (38, 'SHOOTING EARINGS', 'Shooting earings', '', 100, 8, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (39, 'B/s rings', 'B/s rings', NULL, 100, 25, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (40, 'S/S Rings', 'S/S Rings', NULL, 50, 17, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (41, 'Black hair clip', 'Black hair clip', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (42, 'Subaru dye', 'Subaru dye', NULL, 50, 35, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (43, '3 IN 1 BLACK OPAL', '3 in 1 black opal - Pearl', '', 250, 180, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (44, '3 BLACK OPAL FOUNDATION-LIGHTFUL', '3 Black opal foundation-lightful', '', 200, 100, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (45, 'Black opal makeup', 'Black opal makeup', NULL, 250, 150, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (46, 'Black opal ponds-oval', 'Black opal ponds-oval', NULL, 200, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (47, 'Airwoman small eyepencil', 'Airwoman small eyepencil', NULL, 20, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (48, 'Davis eyepencil long', 'Davis eyepencil long', NULL, 30, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (49, 'Airwoman Eye pencil long', 'Airwoman Eye pencil long', NULL, 20, 11, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (50, 'Roseleaf ponds B/S', 'Roseleaf ponds B/S', NULL, 150, 75, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (51, 'Rose leaf ponds S/S', 'Rose leaf ponds S/S', NULL, 100, 60, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (52, 'Sleek ponds', 'Sleek ponds', NULL, 150, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (53, 'sleek foundation/powder plus', 'sleek foundation/powder plus', NULL, 250, 150, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (54, 'Nature escense ponds', 'Nature escense ponds', NULL, 100, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (55, 'Fair &lovely ponds', 'Fair &lovely ponds', NULL, 100, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (56, 'Iman ponds', 'Iman ponds', NULL, 100, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (57, 'A Face ponds', 'A Face ponds', NULL, 100, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (58, 'DAVIS EYE PENCIL SHORY', 'Davis eye pencil short', '', 50, 25, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (59, '2 in 1 Eyeliner', '3 in 1 Eyeliner', NULL, 30, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (60, 'Paradise remover', 'Paradise remover', NULL, 40, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (61, 'BEULA REMOVER', 'Beula remover 30ml', '', 70, 50, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (62, 'Pedicure set', 'Pedicure set', NULL, 100, 50, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (63, 'sleek foundation -stick', 'sleek foundation -stick', NULL, 150, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (64, 'Iman foundation- stick', 'Iman foundation- stick', NULL, 150, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (65, 'Miss Rose foundation', 'Miss Rose foundation', NULL, 100, 50, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (66, 'Apply make up brush', 'Apply make up brush', NULL, 70, 35, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (67, 'weaving cap', 'weaving cap', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (68, 'High class shower cap', 'High class shower cap', NULL, 50, 25, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (69, 'Rollers', 'Rollers', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (70, 'Push back hair clip', 'Push back hair clip', NULL, 20, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (71, 'Nails- hands', 'Nails- hands', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (72, 'Nails-toe', 'Nails-toe', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (73, 'Kids sweet  hair clip', 'Kids sweet  hair clip', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (74, 'Kids bands shinny s/s', 'Kids bands shinny s/s', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (75, 'Kids band plain s/s', 'Kids band plain s/s', NULL, 50, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (76, 'packed kids beads', 'packed kids beads', NULL, 30, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (77, 'Kids rasta pony', 'Kids rasta pony', NULL, 50, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (78, 'Kids band / sha', 'Kids band / sha', NULL, 30, 20, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (79, 'Kids rubber bands B/S', 'Kids rubber bands B/S', NULL, 30, 10, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (80, 'Kids rubber bands S/S', 'Kids rubber bands S/S', NULL, 20, 5, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (81, 'Nail polish -shc', 'Nail polish -shc', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (82, 'Nail polish- charmax B/S', 'Nail polish- charmax B/S', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (83, 'Nail polish S/S', 'Nail polish S/S', NULL, 30, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (84, 'Bafer nail file', 'Bafer nail file', NULL, 30, 15, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (85, 'Nail cutter', 'Nail cutter', NULL, 20, 13, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (86, 'Acetone ILTR', 'Acetone ILTR', NULL, 400, 350, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (87, 'Acetone 250ml', 'Acetone 250ml', NULL, 150, 120, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (88, 'Acetone 500ml', 'Acetone 500ml', NULL, 300, 200, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (89, 'Chelsman perfume', 'Chelsman perfume', NULL, 230, 160, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (90, 'Amara lotion 200ml', 'Amara lotion 200ml', NULL, 120, 85, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (91, 'Amara lotion  500ml', 'Amara lotion  500ml', NULL, 180, 130, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (92, 'Babycare 100g', 'Babycare 100g', NULL, 70, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (93, 'Baby care 200g', 'Baby care 200g', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (94, 'Baby care 500g', 'Baby care 500g', NULL, 200, 160, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (95, 'Baby care 55g', 'Baby care 55g', NULL, 35, 25, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (96, 'Beautiful begging', 'Beautiful begging', NULL, 500, 400, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (97, 'Beula braids & weave spray 440g', 'Beula braids & weave spray 440g', NULL, 230, 190, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (98, 'Beula conditioner  1 ltr', 'Beula conditioner  1 ltr', NULL, 180, 110, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (99, 'Beula conditioner 500ml', 'Beula conditioner 500ml', NULL, 120, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (100, 'Beula conditioner 5 ltr', 'Beula conditioner 5 ltr', NULL, 350, 310, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (101, 'Beula hair food 50g', 'Beula hair food 50g', NULL, 60, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (102, 'Beula hair food 100g', 'Beula hair food 100g', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (103, 'Beula shampoo apple 1Ltr', 'Beula shampoo apple 1Ltr', NULL, 150, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (104, 'Beula shampoo apple 500ml', 'Beula shampoo apple 500ml', NULL, 120, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (105, 'Beula shampoo apple 5 ltrs', 'Beula shampoo apple 5 ltrs', NULL, 350, 300, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (106, 'black silk leave in 16oz', 'black silk leave in 16oz', NULL, 480, 420, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (107, 'Black silk leave in 8OZ', 'Black silk leave in 8OZ', NULL, 300, 260, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (108, 'Blow out 500ml', 'Blow out 500ml', NULL, 280, 230, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (109, 'Blow out relaxer 125ml', 'Blow out relaxer 125ml', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (110, 'Blue magic castor 340g', 'Blue magic castor 340g', NULL, 300, 230, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (111, 'Blue magic Indian Hemp 340g', 'Blue magic Indian Hemp 340g', NULL, 300, 230, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (112, 'cistas highlight', 'cistas highlight', NULL, 120, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (113, 'clere lotion 400ml', 'clere lotion 400ml', NULL, 150, 120, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (114, 'clere lotion Lan 200ml', 'clere lotion Lan 200ml', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (115, 'cotton wool 100G', 'cotton wool 100G', NULL, 100, 75, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (116, 'Cotton wool 200g', 'Cotton wool 200g', NULL, 170, 120, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (117, 'cotton wool 500g', 'cotton wool 500g', NULL, 50, 35, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (118, 'Darling 4 in 1 120ml', 'Darling 4 in 1 120ml', NULL, 120, 95, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (119, 'Darling 4 in 1 250 ml', 'Darling 4 in 1 250 ml', NULL, 180, 150, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (120, 'Darling 4 in 1 65ml', 'Darling 4 in 1 65ml', NULL, 100, 65, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (121, 'Darling vibrant sheen 100g', 'Darling vibrant sheen 100g', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (122, 'DL kIT Supper', 'DL kIT Supper', NULL, 500, 400, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (123, 'Eden apricot scrub 227g', 'Eden apricot scrub 227g', NULL, 280, 250, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (124, 'Eden apricot scrub 454 g', 'Eden apricot scrub 454 g', NULL, 450, 390, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (125, 'Gatsby 70g', 'Gatsby 70g', NULL, 120, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (126, 'Heena powder', 'Heena powder', NULL, 60, 45, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (127, 'IC leave in 335 ml', 'IC leave in 335 ml', NULL, 400, 360, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (128, 'Infusium 1 tr', 'Infusium 1 tr', NULL, 950, 850, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (129, 'Ingram herbal 75 ml', 'Ingram herbal 75 ml', NULL, 150, 110, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (130, 'Ingram herbal 150 g', 'Ingram herbal 150 g', NULL, 250, 170, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (131, 'Legano scrub', 'Legano scrub', NULL, 300, 230, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (132, 'Lorys hair treatment 1000g', 'Lorys hair treatment 1000g', NULL, 300, 240, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (133, 'Lorrys hair treament 500g', 'Lorrys hair treament 500g', NULL, 200, 150, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (134, 'MIADI BEGAMOT 200G', 'Miadi begamot 200g-hairfood', '', 250, 190, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (135, 'MIADI BEGAMOT 400G', 'Miadi begamot 400g- hairfood', '', 380, 320, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (136, 'MIADI BEGAMOT 85G', 'Miadi begamot 85g-hairfood', '', 120, 95, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (137, 'Miadi cholestrol treatment 100g', 'Miadi cholestrol treatment 100g', NULL, 120, 95, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (138, 'Miadi choletrol treatment 200g', 'Miadi choletrol treatment 200g', NULL, 200, 180, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (139, 'Miadi cholestrol treantment 400g', 'Miadi cholestrol treantment 400g', NULL, 350, 280, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (140, 'Miadi Hairfood 100g', 'Miadi Hairfood 100g', NULL, 120, 85, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (141, 'Miadi Hairfood 200g', 'Miadi Hairfood 200g', NULL, 250, 180, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (142, 'Miadi hairfood 400g', 'Miadi hairfood 400g', NULL, 380, 320, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (143, 'Miadi leave in 237ml', 'Miadi leave in 237ml', NULL, 200, 170, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (144, 'Miadi leave in 475 ml', 'Miadi leave in 475 ml', NULL, 350, 280, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (145, 'Miadi protein treatment 100g', 'Miadi protein treatment 100g', NULL, 120, 95, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (146, 'Miadi relaxer 200g Regular', 'Miadi relaxer 200g Regular', NULL, 200, 145, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (147, 'Miadi relaxer 400g Regular', 'Miadi relaxer 400g Regular', NULL, 300, 260, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (148, 'Mikalla leave in treament 100ml', 'Mikalla leave in treament 100ml', NULL, 170, 153, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (149, 'Mikalla leave in treatmnet 250g', 'Mikalla leave in treatmnet 250g', NULL, 250, 210, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (150, 'Mikalla leavein treatment 500ml', 'Mikalla leavein treatment 500ml', NULL, 450, 380, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (151, 'Miss beauty scrubs', 'Miss beauty scrubs', NULL, 180, 140, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (152, 'Moulding gel 150g', 'Moulding gel 150g', NULL, 300, 230, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (153, 'Moulding wax 250ml', 'Moulding wax 250ml', NULL, 400, 330, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (154, 'Moulding wax 500ml', 'Moulding wax 500ml', NULL, 600, 530, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (155, 'Movit blow out 150g', 'Movit blow out 150g', NULL, 120, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (156, 'Movit blow out 500g', 'Movit blow out 500g', NULL, 350, 270, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (157, 'MOVIT CURL GEL 140G', 'MOVIT CURL GEL 140G', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (158, 'Movit curl gel 300g', 'Movit curl gel 300g', NULL, 150, 120, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (159, 'Movit gel 80g', 'Movit gel 80g', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (160, 'Movit leave in 100ml', 'Movit leave in 100ml', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (161, 'Movit leave in 400ml', 'Movit leave in 400ml', NULL, 350, 320, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (162, 'Movit leave in 50ml', 'Movit leave in 50ml', NULL, 70, 55, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (163, 'Movit relaxer 150g', 'Movit relaxer 150g', NULL, 120, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (164, 'Movit sheen spray 740ml', 'Movit sheen spray 740ml', NULL, 380, 330, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (165, 'Movit styling gel 150g', 'Movit styling gel 150g', NULL, 120, 80, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (166, 'Nail heena', 'Nail heena', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (167, 'Nice & lovely lotion 100ml', 'Nice & lovely lotion 100ml', NULL, 60, 50, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (168, 'Nice & lovely lotion  200ml', 'Nice & lovely lotion  200ml', NULL, 120, 85, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (169, 'Nice & lovely lotion  400ml', 'Nice & lovely lotion  400ml', NULL, 150, 125, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (170, 'Nivea roll on', 'Nivea roll on', NULL, 280, 220, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (171, 'Olive treatment 1kg', 'Olive treatment 1kg', NULL, 350, 260, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (172, 'Olive sheen B/S', 'Olive sheen B/S', NULL, 350, 280, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (173, 'Olive sheen spray 326g', 'Olive sheen spray 326g', NULL, 280, 220, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (174, 'ORS Mayonnase 226g', 'ORS Mayonnase 226g', NULL, 350, 290, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (175, 'perfect hair treament 1000g', 'perfect hair treament 1000g', NULL, 350, 240, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (176, 'perfect leave in 300g', 'perfect leave in 300g', NULL, 300, 250, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (177, 'peris cool stream 250g', 'peris cool stream 250g', NULL, 150, 110, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (178, 'peris cool stream 500g', 'peris cool stream 500g', NULL, 230, 180, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (179, 'peris cool stream 50g', 'peris cool stream 50g', NULL, 50, 35, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (180, 'peris hair food 100g', 'peris hair food 100g', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (181, 'Radiant anti-dandruff 170g', 'Radiant anti-dandruff 170g', NULL, 250, 180, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (182, 'Radiant anti-dandruff 60g', 'Radiant anti-dandruff 60g', NULL, 100, 60, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (183, 'Radiant braid spray 120ml', 'Radiant braid spray 120ml', NULL, 150, 110, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (184, 'Radiant braid spray 250ml', 'Radiant braid spray 250ml', NULL, 200, 170, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (185, 'Radiant braid spray 50ml', 'Radiant braid spray 50ml', NULL, 100, 60, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (186, 'Radiant hair dye 250ml', 'Radiant hair dye 250ml', NULL, 100, 65, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (187, 'Radiant hair vitalizer 170g', 'Radiant hair vitalizer 170g', NULL, 230, 175, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (188, 'RADIANT LEAVE IN 25OML', 'Radiant leave in 250ml', '', 180, 150, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (189, 'RADIANT LEAVE IN 480ML', 'Radiant leave in 450ml', '', 380, 320, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (190, 'Radiant sheen spray 120 ml', 'Radiant sheen spray 120 ml', NULL, 150, 125, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (191, 'RADIANT BRAID SPRAY 250ML', 'Radiant Sheen braid spray 250ml', '', 300, 220, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (192, 'RADIANT BRAID SPRAY 470ML', 'Radiant Sheen Braid spray 470ml', '', 400, 320, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (193, 'Radiant vitalizer 100g', 'Radiant vitalizer 100g', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (194, 'Rasasi spray royale black', 'Rasasi spray royale black', NULL, 300, 220, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (195, 'Revlon lotion 600ml', 'Revlon lotion 600ml', NULL, 380, 330, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (196, 'Rexona rollon 25ml', 'Rexona rollon 25ml', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (197, 'Soft & free styling gel 125 ml', 'Soft & free styling gel 125 ml', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (198, 'Soft & free styling gel 250 ml', 'Soft & free styling gel 250 ml', NULL, 200, 65, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (199, 'soft & free texturizer 125ml', 'soft & free texturizer 125ml', NULL, 120, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (200, 'soft & free texturizer 450 ml', 'soft & free texturizer 450 ml', NULL, 300, 260, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (201, 'Tea tree leave in', 'Tea tree leave in', NULL, 420, 370, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (202, 'Tancho', 'Tancho', NULL, 150, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (203, 'TCB Relaxer 220g regular', 'TCB Relaxer 220g regular', NULL, 250, 190, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (204, 'TCB relaxer 425g regular', 'TCB relaxer 425g regular', NULL, 350, 285, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (205, 'Temple defence', 'Temple defence', NULL, 800, 650, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (206, 'Tropical coconut oil 12oml', 'Tropical coconut oil 12oml', NULL, 100, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (207, 'Tropical coconut oil scent free 120ml', 'Tropical coconut oil scent free 120ml', NULL, 150, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (208, 'Valon jell 100g', 'Valon jell 100g', NULL, 100, 65, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (209, 'Valon Jell 50g', 'Valon Jell 50g', NULL, 50, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (210, 'Venus hair food 210 ml', 'Venus hair food 210 ml', NULL, 230, 190, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (211, 'Venus hairfood 420ml', 'Venus hairfood 420ml', NULL, 320, 290, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (212, 'Venus hairfood 95ml', 'Venus hairfood 95ml', NULL, 120, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (213, 'venus leave in 250ml', 'venus leave in 250ml', NULL, 250, 200, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (214, 'Venus soothing soul 100g', 'Venus soothing soul 100g', NULL, 120, 75, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (215, 'Venus soothing soul 450g', 'Venus soothing soul 450g', NULL, 350, 300, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (216, 'Vitale leave in', 'Vitale leave in', NULL, 480, 420, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (217, 'Vitale Mayonasse 8oz', 'Vitale Mayonasse 8oz', NULL, 350, 300, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (218, 'TCB Hairfood 85g', 'TCB Hairfood 85g', NULL, 150, 110, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (219, 'Classic Pantra', 'Classic Pantra', NULL, 600, 550, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (220, 'Darling Retro', 'Darling Retro', NULL, 500, 420, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (221, 'Darling Abuja Long', 'Darling Abuja Long', NULL, 65, 57, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (222, 'DARLING ABUJA SHORT', 'Darling Abuja Short', '', 65, 57, 5, 1, 'No', 0, 0, 0, 1, '1', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (223, 'Darling Ada', 'Darling Ada', NULL, 500, 420, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (224, 'Darling Afro D', 'Darling Afro D', NULL, 500, 410, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (225, 'Darling Atisto', 'Darling Atisto', NULL, 650, 615, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (226, 'Darling Blessing', 'Darling Blessing', NULL, 490, 450, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (227, 'Darling Boycut', 'Darling Boycut', NULL, 450, 405, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (228, 'Darling Brazilian Weave', 'Darling Brazilian Weave', NULL, 700, 640, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (229, 'Darling Cool LayerWeave', 'Darling Cool LayerWeave', NULL, 800, 710, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (230, 'Darling Diva W classic', 'Darling Diva W classic', NULL, 650, 570, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (231, 'Darling Flat Iron Short', 'Darling Flat Iron Short', NULL, 500, 425, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (232, 'Darling Fluffy Kinky', 'Darling Fluffy Kinky', NULL, 300, 255, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (233, 'Darling Ghanian', 'Darling Ghanian', NULL, 65, 52, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (234, 'Darling Glamor', 'Darling Glamor', NULL, 650, 570, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (235, 'Darling Hi Salsa', 'Darling Hi Salsa', NULL, 180, 145, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (236, 'Darling Hiyaki', 'Darling Hiyaki', NULL, 150, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (237, 'Darling Isabella', 'Darling Isabella', NULL, 500, 430, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (238, 'Darling Jumbo', 'Darling Jumbo', NULL, 400, 340, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (239, 'Darling Long Flat Iron', 'Darling Long Flat Iron', NULL, 500, 425, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (240, 'Darling Natural Yaki Plus', 'Darling Natural Yaki Plus', NULL, 500, 425, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (241, 'Darling New Viva', 'Darling New Viva', NULL, 530, 475, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (242, 'Darling Pencil Mambo', 'Darling Pencil Mambo', NULL, 350, 285, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (243, 'Darling Pony Tail Star', 'Darling Pony Tail Star', NULL, 200, 145, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (244, 'Darling Rio Weave', 'Darling Rio Weave', NULL, 500, 435, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (245, 'Darling Sunny Shade', 'Darling Sunny Shade', NULL, 500, 420, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (246, 'Darling Twinkle Braid', 'Darling Twinkle Braid', NULL, 60, 45, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (247, 'Darling Ultra Expression', 'Darling Ultra Expression', NULL, 300, 250, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (248, 'Fair & Lovely Multivitamin', 'Fair & Lovely Multivitamin', NULL, 90, 78, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (249, 'Lanolin Cream', 'Lanolin Cream', NULL, 90, 70, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (250, 'Nice and Lovely Hair Food 100g', 'Nice and Lovely Hair Food 100g', NULL, 100, 83, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (251, 'Nice and Lovely Hair Food 60g', 'Nice and Lovely Hair Food 60g', NULL, 70, 52, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (252, 'Angels Afro Kinky', 'Angels Afro Kinky', NULL, 300, 250, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (253, 'Angels Avis Long', 'Angels Avis Long', NULL, 65, 53, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (254, 'Angels Avis Short', 'Angels Avis Short', NULL, 65, 53, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (255, 'Daniela Weave', 'Daniela Weave', NULL, 500, 415, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (256, 'Faux Loss', 'Faux Loss', NULL, 500, 410, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (257, 'Angels Galaxy Weave', 'Angels Galaxy Weave', NULL, 550, 490, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (258, 'Angels Grace Weave', 'Angels Grace Weave', NULL, 500, 430, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (259, 'Angels Long Mambo', 'Angels Long Mambo', NULL, 400, 340, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (260, 'Angels mambo Twist Short', 'Angels mambo Twist Short', NULL, 400, 340, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (261, 'Angels Mayfair', 'Angels Mayfair', NULL, 650, 560, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (262, 'Angels Princess', 'Angels Princess', NULL, 500, 440, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (263, 'Angels Ripple Plus', 'Angels Ripple Plus', NULL, 500, 415, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (264, 'ANGELS SHORT RIO CARNIVAL', 'Angels Short Rio Carnival', '', 200, 135, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (265, 'Sista Tempest', 'Sista Tempest', NULL, 560, 510, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (266, 'Angels Soft Dreadlocks', 'Angels Soft Dreadlocks', NULL, 300, 250, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (267, 'Angels Serento', 'Angels Serento', NULL, 520, 430, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (268, 'Spanish Bulk', 'Spanish Bulk', NULL, 170, 155, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (269, 'Angels Super Maya', 'Angels Super Maya', NULL, 520, 450, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (270, 'Anglels Victoria', 'Anglels Victoria', NULL, 500, 415, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (271, 'Angels Zena', 'Angels Zena', NULL, 500, 430, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (272, 'Angels Zumba', 'Angels Zumba', NULL, 550, 490, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (273, 'BEULA REMOVER', 'Beula Remover 60ml', '', 70, 50, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (274, 'Celebrity Winnie', 'Celebrity Winnie', NULL, 500, 420, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (275, 'Classic Chilly', 'Classic Chilly', NULL, 600, 550, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (276, 'IC Leave in 59ml', 'IC Leave in 59ml', NULL, 150, 120, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (277, 'Fresh Maker Wipes s/s', 'Fresh Maker Wipes s/s', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (278, 'Dark and Lovely Relaxer 450ml', 'Dark and Lovely Relaxer 450ml', NULL, 360, 335, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (279, 'Handkerchief A', 'Handkerchief A', NULL, 50, 30, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (280, 'Handkerchief B', 'Handkerchief B', NULL, 20, 13, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (281, 'Mega growth relaxer', 'Mega growth relaxer', NULL, 700, 650, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (282, 'Venus lotion 100ml', 'Venus lotion 100ml', NULL, 60, 45, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (283, 'Venus lotion 200ml', 'Venus lotion 200ml', NULL, 120, 90, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (284, 'Nivea lotion 100ml', 'Nivea lotion 100ml', NULL, 170, 130, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (285, 'Nivea 200ml', 'Nivea 200ml', NULL, 250, 220, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (286, 'Nive & lovely pink lotion 120ml', 'Nive & lovely pink lotion 120ml', NULL, 130, 100, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (287, 'Nive & lovely pink lotion 250ml', 'Nive & lovely pink lotion 250ml', NULL, 220, 180, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (288, 'Nail brush', 'Nail brush', NULL, 50, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (289, 'Bone comb', 'Bone comb', NULL, 60, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (290, 'Luron nail polish', 'Luron nail polish', NULL, 100, 85, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (291, 'Nail art nail polish black', 'Nail art nail polish black', NULL, 50, 35, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (292, 'MAC lipstick', 'MAC lipstick', NULL, 100, 60, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (293, 'SLEEK LIPSTIC', 'Sleek lipstick/Lipgloss  matte', '', 200, 120, 5, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (294, '', 'Wire Bangle', '', 20, 6, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (295, '', 'Small Alice Hair Band', '', 10, 1, 5, 2, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (296, '', 'Kid Beads', '', 1, 0, 5, 2, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (298, '', 'Metal Beads', '', 5, 3, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (299, '', 'Kids Hairband Pony', '', 20, 5, 5, 2, 'No', 1, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (301, '', 'Kids Butterfly Clips', '', 23, 1, 0, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (302, '', 'Hair Pin', '', 1, 0, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (303, '', 'Beaded Hairband', '', 50, 10, 0, 2, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (304, 'IMAN LIPSTICK', 'Iman Lipstick', '', 50, 12, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (305, 'LADIES WATCH', 'Ladies Watch', '', 250, 140, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (306, 'BADANA', 'Badana', '', 50, 30, 5, 2, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (307, 'LADIES PURSE', 'Ladies Purse', '', 500, 300, 3, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (308, 'MIKI CREAM', 'Miki Skin Lightening Cream', '', 150, 100, 3, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (309, 'MAGNETIC EARRING', 'magnetic Earring', '', 50, 25, 0, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (310, 'NOSE STUD', 'Nose Steel Stud', '', 50, 25, 0, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (311, 'PLASTIC EARRINGS', 'Plastic Earrings ', '', 20, 5, 0, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (312, 'NECK PIECE', 'Neck Piece', '', 500, 300, 1, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (313, 'DARK AND LOVELY', 'Dark & Lovely  Precise Diamond', '', 400, 335, 0, 1, 'No', 1, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (314, 'DIPROSON CREAM', 'Diproson Cream', '', 80, 45, 3, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (315, 'CARO LIGHT', 'caro Light 120ml', '', 150, 115, 0, 3, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (316, 'LEMON PLUS CREAM', 'Lemon Plus Cream', '', 150, 100, 3, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (317, 'LEMONVATE CREAM', 'Lemonvate Cream', '', 130, 80, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (318, 'MOVATE CREAM', 'Movate Cream 30g', '', 130, 80, 3, 3, 'No', 1, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (319, 'EPIDERM CREME', 'Epiderm Cream 15g', '', 80, 50, 3, 3, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (320, 'EPIDERM CREAM', 'Epiderm Cream 30g', '', 140, 90, 3, 3, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (321, 'CARO LIGHT ', 'Caro Light 300ml', '', 280, 225, 0, 3, 'No', 1, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (322, 'CARO LIGHT OIL', 'Caro Light Glycerine Oil', '', 50, 25, 0, 4, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (323, 'COCODERM CREAM', 'Cocoderm Cream 150ml', '', 170, 120, 3, 3, 'No', 1, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (324, 'EXTRA CLAIR CREAM', 'Extra Clair Cream', '', 170, 130, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (325, 'SIVOCLAIR CREAM ', 'Sivoclair Lightening Cream 150ml', '', 150, 120, 1, 3, 'No', 1, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (326, 'MAXI CLAIRE', 'Maxi  Claire Cream 150ml', '', 170, 130, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (327, 'TEINT CLAIR', 'Teint Clair Cream 150ml', '', 170, 130, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (328, 'BIO CLAIRE', 'Bio Claire Cream 130ml ', '', 150, 120, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (329, 'CAROTONE CREAM', 'Carotone Cream 135ml', '', 170, 130, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (330, 'Unknown', 'Unknown', NULL, 0, 0, 0, 1, 'No1', 0, NULL, NULL, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (331, 'G&G CREAM', 'G&G Cream 115ml -teint uniforme', '', 150, 110, 1, 3, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (332, 'MISS CAROLINE', 'Miss Caroline 150ml', '', 150, 120, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (333, 'PEAU CLAIRE', 'Peau Claire Cream 150ml', '', 150, 120, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (334, 'ROMANTIC MAY LIPGLOSS', 'Romantic May Lipgloss', '', 100, 40, 5, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (335, 'CHARMAX NAIL POLISH SS', 'Charmax Nail Polish s/s', '', 30, 15, 0, 3, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (336, 'BLACK ROSE', 'Black Rose Hair Dye 10g', '', 25, 13, 2, 1, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (337, 'ROBIN THREAD', 'Robin Thread', '', 60, 45, 5, 2, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (338, 'G NAIL TIPS', 'G Nail Tips', '', 50, 20, 5, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (339, 'MANICURE SET 20PCS', 'Manicure Set 20 pcs', '', 200, 120, 1, 1, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (340, 'ALOE VERA & VITAMIN', 'Aloe vera & Vitamins capsules', '', 10, 1, 20, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (341, 'ROYALE BLUE PERFUME 50ML', 'Royale Blue Perfume 50ml', '', 800, 650, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (342, 'FEELINGS RASASI PERFUME ', 'Feelings Rasasi Perfume 60ml', '', 850, 700, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (343, 'CHASTITY PERFUME ', 'Chastity Perfume ', '', 850, 700, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (344, 'INNOCENCE PERFUME 65ML', 'Innocence Perfume 65ml', '', 850, 700, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (345, 'MASCARA PASSION ', 'Mascara Passion ', '', 100, 50, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (346, 'ST. IVES FACIAL CLEANSER 170G', 'St. Ives Cleanser 170g', '', 250, 150, 0, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (347, 'ESKINOL FACIAL CLEANSER', 'Eskinol Facial Cleanser', '', 250, 150, 1, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (348, 'DARLING MILLY WEAVE', 'Darling Milly Weave', '', 500, 420, 0, 5, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (349, 'DARLING ROMANCE BRAIDS', 'Darling Romance Braids', '', 240, 195, 0, 5, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (350, 'SISTAR BRAID SHIORT', 'Sistar Asante Braid Short', '', 65, 54, 0, 5, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (351, 'SISTAR KELLYWOOD WEAVE ', 'Sistar Kellywood Weave', '', 600, 500, 0, 5, 'No', 0, 0, 0, 0, '0', '');
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (352, 'BIGEN HAIR DYE', 'Bigen hair dye', '', 230, 190, 2, 4, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (353, 'BIO OIL', 'Bio oil', '', 600, 500, 2, 3, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (354, 'MASSAGE OIL', 'Angelique Massage Oil', '', 180, 130, 0, 4, 'No', 0, 0, 0, 0, '0', NULL);
INSERT INTO product ("ProductNo", "ProductCode", "Description", "Barcode", "ItemPrice", "BuyingPrice", "ReorderLevel", "CategoryNo", "Units", "Tax1", "Tax2", "Tax3", "Expires", "Batch", "prodImage") VALUES (355, 'SMART COLLECTION', 'Smart Collection Perfume', '', 150, 90, 3, 4, 'No', 0, 0, 0, 0, '0', NULL);


--
-- TOC entry 2449 (class 0 OID 19462)
-- Dependencies: 213
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO purchase_order ("PONo", supplierid, "DateIn", shippinginstructions, additionalinstructions, "DeclaredAs", "DeclaredValue", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "CreatedOn", "CreatedBy", "ModifiedOn", "ModifiedBy", salesman, committed) VALUES (2, 1, '2017-07-08 15:16:25', '', '', '', '', NULL, 170.00, '0.00', NULL, 0.00, 170.00, NULL, '1', NULL, NULL, NULL, 1);
INSERT INTO purchase_order ("PONo", supplierid, "DateIn", shippinginstructions, additionalinstructions, "DeclaredAs", "DeclaredValue", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "CreatedOn", "CreatedBy", "ModifiedOn", "ModifiedBy", salesman, committed) VALUES (3, 1, '2017-07-11 14:49:40', '', '', '', '', NULL, 880.00, '0.00', NULL, 0.00, 880.00, NULL, '1', NULL, NULL, NULL, 1);
INSERT INTO purchase_order ("PONo", supplierid, "DateIn", shippinginstructions, additionalinstructions, "DeclaredAs", "DeclaredValue", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "CreatedOn", "CreatedBy", "ModifiedOn", "ModifiedBy", salesman, committed) VALUES (4, 1, '2017-07-11 14:54:33', '', '', '', '', NULL, 76.00, '0.00', NULL, 0.00, 76.00, NULL, '1', NULL, NULL, NULL, 1);
INSERT INTO purchase_order ("PONo", supplierid, "DateIn", shippinginstructions, additionalinstructions, "DeclaredAs", "DeclaredValue", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "CreatedOn", "CreatedBy", "ModifiedOn", "ModifiedBy", salesman, committed) VALUES (5, 1, '2017-07-12 15:55:29', '', '', '', '', NULL, 195.00, '0.00', NULL, 0.00, 195.00, NULL, '1', NULL, NULL, NULL, 1);


--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 212
-- Name: purchase_order_PONo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"purchase_order_PONo_seq"', 1, false);


--
-- TOC entry 2450 (class 0 OID 19471)
-- Dependencies: 214
-- Data for Name: purchase_order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (1, 1, '31', 1, 50, 0, 1, '6/17/2017', NULL, NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (2, 2, '18', 1, 20, 20, 1, '08/07/2017', NULL, NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (3, 2, '28', 1, 150, 150, 1, '08/07/2017', NULL, NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (9, 3, '124', 1, 450, 450, 1, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (10, 3, '319', 4, 80, 80, 1, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (11, 3, '331', 1, 110, 150, 0, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (12, 3, '342', 0, 850, 850, 1, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (13, 4, '38', 1, 8, 100, 0, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (14, 4, '294', 3, 6, 20, 0, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (15, 4, '9', 1, 50, 100, 0, '11/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (16, 5, '18', 5, 9, 20, 0, '12/07/2017', '1', NULL);
INSERT INTO purchase_order_detail ("PurchaseOrderDetailID", "PONo", "ProductNo", "Qty", "BuyingPrice", "ItemPrice", "Discount", "CreatedOn", "CreatedBy", "ModifiedOn") VALUES (17, 5, '347', 1, 150, 250, 0, '12/07/2017', '1', NULL);


--
-- TOC entry 2452 (class 0 OID 19482)
-- Dependencies: 216
-- Data for Name: purchase_order_expense; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 215
-- Name: purchase_order_expense_ExpenseNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"purchase_order_expense_ExpenseNo_seq"', 1, false);


--
-- TOC entry 2454 (class 0 OID 19491)
-- Dependencies: 218
-- Data for Name: purchase_order_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 217
-- Name: purchase_order_payment_PaymentNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"purchase_order_payment_PaymentNo_seq"', 1, false);


--
-- TOC entry 2456 (class 0 OID 19502)
-- Dependencies: 220
-- Data for Name: purchase_order_receive; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO purchase_order_receive ("ReceiveId", "PONo", "Description", "Address", "DateIn", "InvoiceNo", "InvoiceDate", "DeliveryDate", "Agent", "Shipper", "WayBill", "Terms", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "QtyRcvd", "Returned", "CreatedOn", "CreatedBy", "DeliveryNo") VALUES (1, 4, NULL, NULL, NULL, '3233', '2017-07-11 14:55:20', '11/07/2017 14:55:20', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11/07/2017', '1', '333');
INSERT INTO purchase_order_receive ("ReceiveId", "PONo", "Description", "Address", "DateIn", "InvoiceNo", "InvoiceDate", "DeliveryDate", "Agent", "Shipper", "WayBill", "Terms", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "QtyRcvd", "Returned", "CreatedOn", "CreatedBy", "DeliveryNo") VALUES (2, 3, NULL, NULL, NULL, '1', '2017-07-11 14:33:22', '11/07/2017 14:33:22', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11/07/2017', '1', '1');
INSERT INTO purchase_order_receive ("ReceiveId", "PONo", "Description", "Address", "DateIn", "InvoiceNo", "InvoiceDate", "DeliveryDate", "Agent", "Shipper", "WayBill", "Terms", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "QtyRcvd", "Returned", "CreatedOn", "CreatedBy", "DeliveryNo") VALUES (3, 2, NULL, NULL, NULL, '1', '2017-07-11 15:08:13', '11/07/2017 15:08:13', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11/07/2017', '1', '1');
INSERT INTO purchase_order_receive ("ReceiveId", "PONo", "Description", "Address", "DateIn", "InvoiceNo", "InvoiceDate", "DeliveryDate", "Agent", "Shipper", "WayBill", "Terms", "Remarks", "Gross", "Discount", "TaxBase", "VAT", "NetAmount", "QtyRcvd", "Returned", "CreatedOn", "CreatedBy", "DeliveryNo") VALUES (4, 5, NULL, NULL, NULL, 'weee', '2017-07-12 15:56:21', '12/07/2017 15:56:21', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12/07/2017', '1', 'eee');


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 219
-- Name: purchase_order_receive_ReceiveId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"purchase_order_receive_ReceiveId_seq"', 1, false);


--
-- TOC entry 2458 (class 0 OID 19512)
-- Dependencies: 222
-- Data for Name: purchase_order_receiving_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 221
-- Name: purchase_order_receiving_detail_DeliveryId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"purchase_order_receiving_detail_DeliveryId_seq"', 1, false);


--
-- TOC entry 2460 (class 0 OID 19522)
-- Dependencies: 224
-- Data for Name: purchase_order_return; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2534 (class 0 OID 0)
-- Dependencies: 223
-- Name: purchase_order_return_PurchaseOrderReturnID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"purchase_order_return_PurchaseOrderReturnID_seq"', 1, false);


--
-- TOC entry 2461 (class 0 OID 19529)
-- Dependencies: 225
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO staff ("StaffID", "StaffName", "Street", "Email", "City", "State", "ContactNo", "Username", "Role", "UPassword", "ReceiveStock", "PreviewReceipt", "BranchCode") VALUES (1, 'Admin', 'Wallstreet', 'email@noreply.com', 'Gotham', 'North Nowhere', '09466903269', 'admin', 'Admin', 'YPPUDa+BIKwh15hGHckvwjwcE+w=', 0, 1, 100);
INSERT INTO staff ("StaffID", "StaffName", "Street", "Email", "City", "State", "ContactNo", "Username", "Role", "UPassword", "ReceiveStock", "PreviewReceipt", "BranchCode") VALUES (3, 'Staff', 'Fight Street', 'Lanao', 'Sinn City', 'East Somewhre', '918231293', 'staff', 'Cashier', 'YPPUDa+BIKwh15hGHckvwjwcE+w=', 1, 1, 100);


--
-- TOC entry 2463 (class 0 OID 19541)
-- Dependencies: 227
-- Data for Name: suppliercategory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2535 (class 0 OID 0)
-- Dependencies: 226
-- Name: suppliercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('suppliercategory_id_seq', 1, false);


--
-- TOC entry 2465 (class 0 OID 19547)
-- Dependencies: 229
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO suppliers (suppid, suppliername, address, phone, email) VALUES (1, 'test', 'rrrr', '', '');


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 228
-- Name: suppliers_suppid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('suppliers_suppid_seq', 1, false);


--
-- TOC entry 2467 (class 0 OID 19556)
-- Dependencies: 231
-- Data for Name: syncmarker; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 230
-- Name: syncmarker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('syncmarker_id_seq', 1, false);


--
-- TOC entry 2469 (class 0 OID 19565)
-- Dependencies: 233
-- Data for Name: taxsetting; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO taxsetting (taxid, taxname, taxrate) VALUES (1, 'VAT', 0);
INSERT INTO taxsetting (taxid, taxname, taxrate) VALUES (2, 'Levy', 0);
INSERT INTO taxsetting (taxid, taxname, taxrate) VALUES (3, 'Another1', 0);


--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 232
-- Name: taxsetting_taxid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('taxsetting_taxid_seq', 1, false);


--
-- TOC entry 2471 (class 0 OID 19574)
-- Dependencies: 235
-- Data for Name: transactiondetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3", "DateIn", "StaffId", "BuyingPrice") VALUES (313, '1001-1862893498', '1001', 18, '', 20, 7, 0, 0, 0, 0, '2017-07-19 09:25:08', 1, 9);
INSERT INTO transactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3", "DateIn", "StaffId", "BuyingPrice") VALUES (314, '1002-1725594501', '1002', 14, '', 30, 1, 0, 0, 0, 0, '2017-07-19 09:26:01', 1, 10);
INSERT INTO transactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3", "DateIn", "StaffId", "BuyingPrice") VALUES (315, '1002-2086878471', '1002', 319, '', 80, 1, 0, 0, 0, 0, '2017-07-19 09:26:02', 1, 50);
INSERT INTO transactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3", "DateIn", "StaffId", "BuyingPrice") VALUES (316, '1002-2114280063', '1002', 331, '', 150, 1, 0, 0, 0, 0, '2017-07-19 09:26:02', 1, 110);
INSERT INTO transactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3", "DateIn", "StaffId", "BuyingPrice") VALUES (317, '1003-377170627', '1003', 18, '', 20, 1, 0, 0, 0, 0, '2017-07-24 09:50:18', 1, 9);


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 234
-- Name: transactiondetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transactiondetails_id_seq', 1, false);


--
-- TOC entry 2472 (class 0 OID 19585)
-- Dependencies: 236
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transactions (id, "InvoiceNo", "DateIn", "NonVatTotal", "VatAmount", "TotalAmount", "Balance", "StaffID", "CustID", "BranchCode", "Discount") VALUES (1, '1001', '2017-07-19 09:25:08', 140, 0, 140, 0, 1, 0, '100', 0);
INSERT INTO transactions (id, "InvoiceNo", "DateIn", "NonVatTotal", "VatAmount", "TotalAmount", "Balance", "StaffID", "CustID", "BranchCode", "Discount") VALUES (2, '1002', '2017-07-19 09:26:01', 260, 0, 260, 0, 1, 0, '100', 0);
INSERT INTO transactions (id, "InvoiceNo", "DateIn", "NonVatTotal", "VatAmount", "TotalAmount", "Balance", "StaffID", "CustID", "BranchCode", "Discount") VALUES (3, '1003', '2017-07-24 09:50:18', 20, 0, 20, 0, 1, 0, '100', 0);


--
-- TOC entry 2474 (class 0 OID 19600)
-- Dependencies: 238
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO units (id, unit) VALUES (1, 'Bale');
INSERT INTO units (id, unit) VALUES (2, 'Box');
INSERT INTO units (id, unit) VALUES (3, 'Feet');
INSERT INTO units (id, unit) VALUES (4, 'Kilogram');
INSERT INTO units (id, unit) VALUES (5, 'Liter');
INSERT INTO units (id, unit) VALUES (6, 'Meter');
INSERT INTO units (id, unit) VALUES (7, 'No');
INSERT INTO units (id, unit) VALUES (8, 'Packet');
INSERT INTO units (id, unit) VALUES (9, 'Piece');
INSERT INTO units (id, unit) VALUES (10, 'Roll');
INSERT INTO units (id, unit) VALUES (11, 'Sheet');
INSERT INTO units (id, unit) VALUES (12, 'Ton');
INSERT INTO units (id, unit) VALUES (13, 'Pair');


--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 237
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('units_id_seq', 1, false);


--
-- TOC entry 2476 (class 0 OID 19611)
-- Dependencies: 240
-- Data for Name: zinventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO zinventory (id, "InventoryId", "ProductNo", "Quantity", "DateIn", "ExpiryDate", "SupplierID", "BuyingPrice", "BatchNo", "Balance", "BatchState", "BranchCode", "Mode", "StaffId", "CustId", "CustomerName", "StaffName", "Comment") VALUES (1, 'HQ580523065', 4, -1, '2017-03-17 10:30:02', NULL, NULL, NULL, NULL, -1, '1', 'HQ', 'Out', 1, NULL, NULL, NULL, NULL);


--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 239
-- Name: zinventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('zinventory_id_seq', 1, false);


--
-- TOC entry 2478 (class 0 OID 19623)
-- Dependencies: 242
-- Data for Name: zpayment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 241
-- Name: zpayment_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"zpayment_Id_seq"', 1, false);


--
-- TOC entry 2480 (class 0 OID 19633)
-- Dependencies: 244
-- Data for Name: ztransactiondetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ztransactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3") VALUES (2, '1HQ2-220161423', '1HQ2', 5, '444', 2320, 1, 0, 320, 0, 0);
INSERT INTO ztransactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3") VALUES (3, '1HQ2-1732685434', '1HQ2', 2, '222', 2000, 6, 0, 1655.17236, 0, 0);
INSERT INTO ztransactiondetails (id, transid, invoiceno, productno, barcode, itemprice, quantity, discount, "Tax1", "Tax2", "Tax3") VALUES (4, '1HQ3-1331340786', '1HQ3', 4, '112', 1000, 1, 0, 137.93103, 0, 0);


--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 243
-- Name: ztransactiondetails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ztransactiondetails_id_seq', 1, false);


--
-- TOC entry 2481 (class 0 OID 19643)
-- Dependencies: 245
-- Data for Name: ztransactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ztransactions (id, "InvoiceNo", "TDate", "NonVatTotal", "VatAmount", "TotalAmount", "Balance", "StaffID", "CustID") VALUES (1, '1HQ1', '2017-03-17 10:19:47', 1948.80005, 371.200012, 2320, 0, 1, 1);
INSERT INTO ztransactions (id, "InvoiceNo", "TDate", "NonVatTotal", "VatAmount", "TotalAmount", "Balance", "StaffID", "CustID") VALUES (2, '1HQ2', '2017-03-17 10:28:36', 12028.7998, 2291.19995, 14320, 0, 1, 1);
INSERT INTO ztransactions (id, "InvoiceNo", "TDate", "NonVatTotal", "VatAmount", "TotalAmount", "Balance", "StaffID", "CustID") VALUES (3, '1HQ3', '2017-03-17 10:30:01', 840, 160, 1000, 0, 1, 1);


--
-- TOC entry 2289 (class 2606 OID 19352)
-- Name: branches branches_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_id_key UNIQUE (id);


--
-- TOC entry 2291 (class 2606 OID 19388)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY ("CustId");


--
-- TOC entry 2293 (class 2606 OID 19459)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY ("ProductNo");


--
-- TOC entry 2295 (class 2606 OID 19479)
-- Name: purchase_order_detail purchase_order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY purchase_order_detail
    ADD CONSTRAINT purchase_order_detail_pkey PRIMARY KEY ("PurchaseOrderDetailID");


--
-- TOC entry 2297 (class 2606 OID 19538)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY ("StaffID");


--
-- TOC entry 2299 (class 2606 OID 19597)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 19608)
-- Name: units units_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY units
    ADD CONSTRAINT units_id_key UNIQUE (id);


--
-- TOC entry 2303 (class 2606 OID 19654)
-- Name: ztransactions ztransactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ztransactions
    ADD CONSTRAINT ztransactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-08-07 14:45:01

--
-- PostgreSQL database dump complete
--

