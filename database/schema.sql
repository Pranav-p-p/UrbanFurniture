--
-- PostgreSQL database dump
--

\restrict mRiU4kTq0wigEU3jbDPOAzAPKMqijhm6N0FiUb9gE4wKD5vNDc4hVZK8itfiWFO

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: analytic_account; Type: TABLE; Schema: public;   
--

CREATE TABLE public.analytic_account (
    account_id bigint NOT NULL,
    account_name character varying(100) NOT NULL,
    type character varying(10) NOT NULL,
    CONSTRAINT analytic_account_type_check CHECK (((type)::text = ANY ((ARRAY['income'::character varying, 'expense'::character varying])::text[])))
);


ALTER TABLE public.analytic_account ;

--
-- Name: analytic_account_account_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.analytic_account ALTER COLUMN account_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.analytic_account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: budget; Type: TABLE; Schema: public;   
--

CREATE TABLE public.budget (
    budget_id bigint NOT NULL,
    budget_name character varying(100) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    planned_amount numeric(12,2) NOT NULL,
    responsible_person character varying(100),
    fk_analytic_account_id bigint NOT NULL,
    CONSTRAINT budget_check CHECK ((end_date >= start_date))
);


ALTER TABLE public.budget  ;

--
-- Name: budget_budget_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.budget ALTER COLUMN budget_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.budget_budget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: coa; Type: TABLE; Schema: public;   
--

CREATE TABLE public.coa (
    coa_id bigint NOT NULL,
    account_name character varying(100) NOT NULL,
    type character varying(10) NOT NULL,
    CONSTRAINT coa_type_check CHECK (((type)::text = ANY ((ARRAY['asset'::character varying, 'liability'::character varying, 'expense'::character varying, 'income'::character varying, 'capital'::character varying])::text[])))
);


ALTER TABLE public.coa  ;

--
-- Name: coa_coa_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.coa ALTER COLUMN coa_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coa_coa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: contact; Type: TABLE; Schema: public;   
--

CREATE TABLE public.contact (
    contact_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    mobile character varying(10) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    pincode character varying(10) NOT NULL,
    profile_image character varying(500),
    CONSTRAINT contact_type_check CHECK (((type)::text = ANY ((ARRAY['customer'::character varying, 'vendor'::character varying, 'both'::character varying])::text[])))
);


ALTER TABLE public.contact  ;

--
-- Name: contact_contact_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.contact ALTER COLUMN contact_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contact_contact_id_seq
    START WITH 100000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_invoice; Type: TABLE; Schema: public;   
--

CREATE TABLE public.customer_invoice (
    customer_invoice_id bigint NOT NULL,
    fk_sales_order_id bigint NOT NULL,
    invoice_date date NOT NULL,
    due_date date NOT NULL
);


ALTER TABLE public.customer_invoice  ;

--
-- Name: customer_invoice_customer_invoice_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.customer_invoice ALTER COLUMN customer_invoice_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_invoice_customer_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customer_payment; Type: TABLE; Schema: public;   
--

CREATE TABLE public.customer_payment (
    customer_payment_id bigint NOT NULL,
    fk_customer_invoice_id bigint NOT NULL,
    fk_coa_id bigint NOT NULL
);


ALTER TABLE public.customer_payment  ;

--
-- Name: customer_payment_customer_payment_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.customer_payment ALTER COLUMN customer_payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customer_payment_customer_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: default_accounts; Type: TABLE; Schema: public;   
--

CREATE TABLE public.default_accounts (
    default_accounts_id bigint NOT NULL,
    fk_journal_id bigint NOT NULL,
    fk_coa_id bigint NOT NULL
);


ALTER TABLE public.default_accounts  ;

--
-- Name: default_accounts_default_accounts_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.default_accounts ALTER COLUMN default_accounts_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.default_accounts_default_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: journal; Type: TABLE; Schema: public;   
--

CREATE TABLE public.journal (
    journal_id bigint NOT NULL,
    journal_name character varying(100) NOT NULL,
    type character varying(100) NOT NULL
);


ALTER TABLE public.journal  ;

--
-- Name: journal_entry; Type: TABLE; Schema: public;   
--

CREATE TABLE public.journal_entry (
    journal_entry_id bigint NOT NULL,
    fk_journal_id bigint NOT NULL,
    entry_date date NOT NULL,
    reference character varying(100)
);


ALTER TABLE public.journal_entry  ;

--
-- Name: journal_entry_journal_entry_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.journal_entry ALTER COLUMN journal_entry_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.journal_entry_journal_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: journal_items; Type: TABLE; Schema: public;   
--

CREATE TABLE public.journal_items (
    journal_items_id bigint NOT NULL,
    fk_journal_entry_id bigint NOT NULL,
    fk_coa_id bigint NOT NULL,
    debit numeric(10,2),
    credit numeric(10,2)
);


ALTER TABLE public.journal_items  ;

--
-- Name: journal_items_journal_items_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.journal_items ALTER COLUMN journal_items_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.journal_items_journal_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: journal_journal_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.journal ALTER COLUMN journal_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.journal_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product; Type: TABLE; Schema: public;   
--

CREATE TABLE public.product (
    product_id bigint NOT NULL,
    product_name character varying(100) NOT NULL,
    type character varying(10) NOT NULL,
    sales_price numeric(10,2) NOT NULL,
    purchase_price numeric(10,2) NOT NULL,
    category character varying(100) NOT NULL,
    CONSTRAINT product_type_check CHECK (((type)::text = ANY ((ARRAY['goods'::character varying, 'service'::character varying, 'combo'::character varying])::text[])))
);


ALTER TABLE public.product  ;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.product ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_order; Type: TABLE; Schema: public;   
--

CREATE TABLE public.purchase_order (
    purchase_order_id bigint NOT NULL,
    vendor_id bigint
);


ALTER TABLE public.purchase_order  ;

--
-- Name: purchase_order_item; Type: TABLE; Schema: public;   
--

CREATE TABLE public.purchase_order_item (
    purchase_order_item_id bigint NOT NULL,
    fk_purchase_order_id bigint NOT NULL,
    fk_product_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL
);


ALTER TABLE public.purchase_order_item  ;

--
-- Name: purchase_order_item_purchase_order_item_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.purchase_order_item ALTER COLUMN purchase_order_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_order_item_purchase_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: purchase_order_purchase_order_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.purchase_order ALTER COLUMN purchase_order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.purchase_order_purchase_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sales_order; Type: TABLE; Schema: public;   
--

CREATE TABLE public.sales_order (
    sales_order_id bigint NOT NULL,
    customer_id bigint
);


ALTER TABLE public.sales_order  ;

--
-- Name: sales_order_item; Type: TABLE; Schema: public;   
--

CREATE TABLE public.sales_order_item (
    sales_order_item_id bigint NOT NULL,
    fk_sales_order_id bigint NOT NULL,
    fk_product_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    tax numeric(8,2) NOT NULL
);


ALTER TABLE public.sales_order_item  ;

--
-- Name: sales_order_item_sales_order_item_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.sales_order_item ALTER COLUMN sales_order_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sales_order_item_sales_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sales_order_sales_order_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.sales_order ALTER COLUMN sales_order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.sales_order_sales_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vendor_bill; Type: TABLE; Schema: public;   
--

CREATE TABLE public.vendor_bill (
    vendor_bill_id bigint NOT NULL,
    fk_purchase_order_id bigint NOT NULL,
    invoice_date date NOT NULL,
    due_date date NOT NULL
);


ALTER TABLE public.vendor_bill  ;

--
-- Name: vendor_bill_vendor_bill_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.vendor_bill ALTER COLUMN vendor_bill_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vendor_bill_vendor_bill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vendor_payment; Type: TABLE; Schema: public;   
--

CREATE TABLE public.vendor_payment (
    vendor_payment_id bigint NOT NULL,
    fk_vendor_bill_id bigint NOT NULL,
    fk_coa_id bigint NOT NULL
);


ALTER TABLE public.vendor_payment  ;

--
-- Name: vendor_payment_vendor_payment_id_seq; Type: SEQUENCE; Schema: public;   
--

ALTER TABLE public.vendor_payment ALTER COLUMN vendor_payment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vendor_payment_vendor_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: analytic_account analytic_account_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.analytic_account
    ADD CONSTRAINT analytic_account_pkey PRIMARY KEY (account_id);


--
-- Name: budget budget_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_pkey PRIMARY KEY (budget_id);


--
-- Name: coa coa_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.coa
    ADD CONSTRAINT coa_pkey PRIMARY KEY (coa_id);


--
-- Name: contact contact_email_key; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_email_key UNIQUE (email);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (contact_id);


--
-- Name: customer_invoice customer_invoice_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.customer_invoice
    ADD CONSTRAINT customer_invoice_pkey PRIMARY KEY (customer_invoice_id);


--
-- Name: customer_payment customer_payment_fk_customer_invoice_id_key; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.customer_payment
    ADD CONSTRAINT customer_payment_fk_customer_invoice_id_key UNIQUE (fk_customer_invoice_id);


--
-- Name: customer_payment customer_payment_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.customer_payment
    ADD CONSTRAINT customer_payment_pkey PRIMARY KEY (customer_payment_id);


--
-- Name: default_accounts default_accounts_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.default_accounts
    ADD CONSTRAINT default_accounts_pkey PRIMARY KEY (default_accounts_id);


--
-- Name: journal_entry journal_entry_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT journal_entry_pkey PRIMARY KEY (journal_entry_id);


--
-- Name: journal_items journal_items_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.journal_items
    ADD CONSTRAINT journal_items_pkey PRIMARY KEY (journal_items_id);


--
-- Name: journal journal_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.journal
    ADD CONSTRAINT journal_pkey PRIMARY KEY (journal_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: purchase_order_item purchase_order_item_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.purchase_order_item
    ADD CONSTRAINT purchase_order_item_pkey PRIMARY KEY (purchase_order_item_id);


--
-- Name: purchase_order purchase_order_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_pkey PRIMARY KEY (purchase_order_id);


--
-- Name: sales_order_item sales_order_item_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.sales_order_item
    ADD CONSTRAINT sales_order_item_pkey PRIMARY KEY (sales_order_item_id);


--
-- Name: sales_order sales_order_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_pkey PRIMARY KEY (sales_order_id);


--
-- Name: vendor_bill vendor_bill_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.vendor_bill
    ADD CONSTRAINT vendor_bill_pkey PRIMARY KEY (vendor_bill_id);


--
-- Name: vendor_payment vendor_payment_fk_vendor_bill_id_key; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.vendor_payment
    ADD CONSTRAINT vendor_payment_fk_vendor_bill_id_key UNIQUE (fk_vendor_bill_id);


--
-- Name: vendor_payment vendor_payment_pkey; Type: CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.vendor_payment
    ADD CONSTRAINT vendor_payment_pkey PRIMARY KEY (vendor_payment_id);


--
-- Name: budget budget_fk_analytic_account_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.budget
    ADD CONSTRAINT budget_fk_analytic_account_id_fkey FOREIGN KEY (fk_analytic_account_id) REFERENCES public.analytic_account(account_id);


--
-- Name: customer_invoice customer_invoice_fk_sales_order_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.customer_invoice
    ADD CONSTRAINT customer_invoice_fk_sales_order_id_fkey FOREIGN KEY (fk_sales_order_id) REFERENCES public.sales_order(sales_order_id);


--
-- Name: customer_payment customer_payment_fk_coa_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.customer_payment
    ADD CONSTRAINT customer_payment_fk_coa_id_fkey FOREIGN KEY (fk_coa_id) REFERENCES public.coa(coa_id);


--
-- Name: customer_payment customer_payment_fk_customer_invoice_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.customer_payment
    ADD CONSTRAINT customer_payment_fk_customer_invoice_id_fkey FOREIGN KEY (fk_customer_invoice_id) REFERENCES public.customer_invoice(customer_invoice_id);


--
-- Name: default_accounts default_accounts_fk_coa_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.default_accounts
    ADD CONSTRAINT default_accounts_fk_coa_id_fkey FOREIGN KEY (fk_coa_id) REFERENCES public.coa(coa_id);


--
-- Name: default_accounts default_accounts_fk_journal_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.default_accounts
    ADD CONSTRAINT default_accounts_fk_journal_id_fkey FOREIGN KEY (fk_journal_id) REFERENCES public.journal(journal_id);


--
-- Name: journal_entry journal_entry_fk_journal_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.journal_entry
    ADD CONSTRAINT journal_entry_fk_journal_id_fkey FOREIGN KEY (fk_journal_id) REFERENCES public.journal(journal_id);


--
-- Name: journal_items journal_items_fk_coa_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.journal_items
    ADD CONSTRAINT journal_items_fk_coa_id_fkey FOREIGN KEY (fk_coa_id) REFERENCES public.coa(coa_id);


--
-- Name: journal_items journal_items_fk_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.journal_items
    ADD CONSTRAINT journal_items_fk_journal_entry_id_fkey FOREIGN KEY (fk_journal_entry_id) REFERENCES public.journal_entry(journal_entry_id);


--
-- Name: purchase_order_item purchase_order_item_fk_product_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.purchase_order_item
    ADD CONSTRAINT purchase_order_item_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES public.product(product_id);


--
-- Name: purchase_order_item purchase_order_item_fk_purchase_order_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.purchase_order_item
    ADD CONSTRAINT purchase_order_item_fk_purchase_order_id_fkey FOREIGN KEY (fk_purchase_order_id) REFERENCES public.purchase_order(purchase_order_id);


--
-- Name: purchase_order purchase_order_vendor_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.purchase_order
    ADD CONSTRAINT purchase_order_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.contact(contact_id);


--
-- Name: sales_order sales_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.contact(contact_id);


--
-- Name: sales_order_item sales_order_item_fk_product_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.sales_order_item
    ADD CONSTRAINT sales_order_item_fk_product_id_fkey FOREIGN KEY (fk_product_id) REFERENCES public.product(product_id);


--
-- Name: sales_order_item sales_order_item_fk_sales_order_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.sales_order_item
    ADD CONSTRAINT sales_order_item_fk_sales_order_id_fkey FOREIGN KEY (fk_sales_order_id) REFERENCES public.sales_order(sales_order_id);


--
-- Name: vendor_bill vendor_bill_fk_purchase_order_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.vendor_bill
    ADD CONSTRAINT vendor_bill_fk_purchase_order_id_fkey FOREIGN KEY (fk_purchase_order_id) REFERENCES public.purchase_order(purchase_order_id);


--
-- Name: vendor_payment vendor_payment_fk_coa_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.vendor_payment
    ADD CONSTRAINT vendor_payment_fk_coa_id_fkey FOREIGN KEY (fk_coa_id) REFERENCES public.coa(coa_id);


--
-- Name: vendor_payment vendor_payment_fk_vendor_bill_id_fkey; Type: FK CONSTRAINT; Schema: public;   
--

ALTER TABLE ONLY public.vendor_payment
    ADD CONSTRAINT vendor_payment_fk_vendor_bill_id_fkey FOREIGN KEY (fk_vendor_bill_id) REFERENCES public.vendor_bill(vendor_bill_id);


--
-- PostgreSQL database dump complete
--

\unrestrict mRiU4kTq0wigEU3jbDPOAzAPKMqijhm6N0FiUb9gE4wKD5vNDc4hVZK8itfiWFO

