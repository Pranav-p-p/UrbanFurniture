--
-- PostgreSQL database dump
--

\restrict O3ZDPzBDYQNDuCoxywoq4kdBNoj9RXlevHIOYNOzQKQIgex15aUixSMfbQNehsB

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

--
-- Data for Name: analytic_account; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.analytic_account OVERRIDING SYSTEM VALUE VALUES (4, 'Office Furniture Project', 'expense');
INSERT INTO public.analytic_account OVERRIDING SYSTEM VALUE VALUES (5, 'Sales Department', 'income');
INSERT INTO public.analytic_account OVERRIDING SYSTEM VALUE VALUES (6, 'Administration', 'expense');
INSERT INTO public.analytic_account OVERRIDING SYSTEM VALUE VALUES (7, 'Furniture Expansion', 'expense');


--
-- Data for Name: budget; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.budget OVERRIDING SYSTEM VALUE VALUES (1, 'Office Furniture Project Budget', '2026-09-01', '2026-12-31', 500000.00, 'Rahul', 4);
INSERT INTO public.budget OVERRIDING SYSTEM VALUE VALUES (2, 'Sales Department Budget', '2026-09-01', '2026-12-31', 300000.00, 'Anil', 5);
INSERT INTO public.budget OVERRIDING SYSTEM VALUE VALUES (3, 'Administration Budget', '2026-09-01', '2026-12-31', 150000.00, 'Meera', 6);
INSERT INTO public.budget OVERRIDING SYSTEM VALUE VALUES (4, 'Furniture Expansion Budget', '2026-10-01', '2027-03-31', 800000.00, 'Arun', 7);


--
-- Data for Name: coa; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (1, 'cash', 'asset');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (2, 'bank', 'asset');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (3, 'debtors', 'asset');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (4, 'creditors', 'liability');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (5, 'sales income', 'income');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (6, 'purchase expense', 'expense');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (7, 'owner capital', 'capital');
INSERT INTO public.coa OVERRIDING SYSTEM VALUE VALUES (8, 'furniture expense', 'expense');


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.contact OVERRIDING SYSTEM VALUE VALUES (100000, 'abc furniture', 'vendor', 'abc@gmail.com', '1111111111', 'ernakulam', 'kerala', '666666', NULL);
INSERT INTO public.contact OVERRIDING SYSTEM VALUE VALUES (100001, 'def furniture', 'vendor', 'def@gmail.com', '2222222222', 'ernakulam', 'kerala', '666666', NULL);
INSERT INTO public.contact OVERRIDING SYSTEM VALUE VALUES (100002, 'customer1', 'customer', 'customer1@gmail.com', '3333333333', 'ahemedabad', 'gujarat', '787878', NULL);
INSERT INTO public.contact OVERRIDING SYSTEM VALUE VALUES (100003, 'customer2', 'customer', 'customer2@gmail.com', '4444444444', 'ahemedabad', 'gujarat', '787878', NULL);
INSERT INTO public.contact OVERRIDING SYSTEM VALUE VALUES (100004, 'vendor and customer', 'both', 'both1@gmail.com', '5555555555', 'ahemedabad', 'gujarat', '787878', NULL);
INSERT INTO public.contact OVERRIDING SYSTEM VALUE VALUES (100005, 'vendor and customer2', 'both', 'both2@gmail.com', '6666666666', 'ahemedabad', 'gujarat', '787878', NULL);


--
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.sales_order OVERRIDING SYSTEM VALUE VALUES (1, 100002);
INSERT INTO public.sales_order OVERRIDING SYSTEM VALUE VALUES (2, 100003);
INSERT INTO public.sales_order OVERRIDING SYSTEM VALUE VALUES (3, 100004);
INSERT INTO public.sales_order OVERRIDING SYSTEM VALUE VALUES (4, 100005);


--
-- Data for Name: customer_invoice; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.customer_invoice OVERRIDING SYSTEM VALUE VALUES (1, 1, '2026-09-25', '2026-10-25');
INSERT INTO public.customer_invoice OVERRIDING SYSTEM VALUE VALUES (2, 2, '2026-09-10', '2026-10-10');
INSERT INTO public.customer_invoice OVERRIDING SYSTEM VALUE VALUES (3, 3, '2026-09-19', '2026-10-19');
INSERT INTO public.customer_invoice OVERRIDING SYSTEM VALUE VALUES (4, 4, '2026-09-08', '2026-10-08');


--
-- Data for Name: customer_payment; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.customer_payment OVERRIDING SYSTEM VALUE VALUES (1, 1, 1);
INSERT INTO public.customer_payment OVERRIDING SYSTEM VALUE VALUES (2, 2, 2);


--
-- Data for Name: journal; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.journal OVERRIDING SYSTEM VALUE VALUES (1, 'sales journal', 'sales');
INSERT INTO public.journal OVERRIDING SYSTEM VALUE VALUES (2, 'purchase journal', 'purchase');
INSERT INTO public.journal OVERRIDING SYSTEM VALUE VALUES (3, 'bank journal', 'bank');
INSERT INTO public.journal OVERRIDING SYSTEM VALUE VALUES (4, 'cash journal', 'cash');


--
-- Data for Name: default_accounts; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.default_accounts OVERRIDING SYSTEM VALUE VALUES (1, 1, 3);
INSERT INTO public.default_accounts OVERRIDING SYSTEM VALUE VALUES (2, 1, 5);
INSERT INTO public.default_accounts OVERRIDING SYSTEM VALUE VALUES (3, 2, 4);
INSERT INTO public.default_accounts OVERRIDING SYSTEM VALUE VALUES (4, 2, 6);
INSERT INTO public.default_accounts OVERRIDING SYSTEM VALUE VALUES (5, 3, 2);
INSERT INTO public.default_accounts OVERRIDING SYSTEM VALUE VALUES (6, 4, 1);


--
-- Data for Name: journal_entry; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (1, 1, '2026-09-25', 'customer invoice #1');
INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (2, 1, '2026-09-10', 'customer invoice #2');
INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (3, 1, '2026-09-19', 'customer invoice #3');
INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (4, 1, '2026-09-08', 'customer invoice #4');
INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (5, 2, '2026-01-09', 'vendor bill #1');
INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (6, 2, '2026-08-09', 'vendor bill #2');
INSERT INTO public.journal_entry OVERRIDING SYSTEM VALUE VALUES (7, 2, '2026-10-09', 'vendor bill #3');


--
-- Data for Name: journal_items; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (1, 1, 3, 115000.00, NULL);
INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (2, 2, 3, 45000.00, NULL);
INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (3, 3, 3, 80000.00, NULL);
INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (4, 4, 3, 105000.00, NULL);
INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (5, 5, 4, NULL, 28000.00);
INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (6, 6, 4, NULL, 17500.00);
INSERT INTO public.journal_items OVERRIDING SYSTEM VALUE VALUES (7, 7, 4, NULL, 50400.00);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.product OVERRIDING SYSTEM VALUE VALUES (1, 'office chair', 'goods', 4500.00, 3000.00, 'chairs');
INSERT INTO public.product OVERRIDING SYSTEM VALUE VALUES (2, 'executive chair', 'goods', 7500.00, 5200.00, 'chairs');
INSERT INTO public.product OVERRIDING SYSTEM VALUE VALUES (3, 'office desk', 'goods', 8500.00, 6000.00, 'desks');
INSERT INTO public.product OVERRIDING SYSTEM VALUE VALUES (4, 'conference table', 'goods', 25000.00, 18000.00, 'table');
INSERT INTO public.product OVERRIDING SYSTEM VALUE VALUES (5, 'filing cabinet', 'goods', 6500.00, 4200.00, 'storage');
INSERT INTO public.product OVERRIDING SYSTEM VALUE VALUES (6, 'office furniture assembly', 'service', 1500.00, 800.00, 'services');


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.purchase_order OVERRIDING SYSTEM VALUE VALUES (2, 100000);
INSERT INTO public.purchase_order OVERRIDING SYSTEM VALUE VALUES (3, 100001);
INSERT INTO public.purchase_order OVERRIDING SYSTEM VALUE VALUES (4, 100004);
INSERT INTO public.purchase_order OVERRIDING SYSTEM VALUE VALUES (5, 100005);


--
-- Data for Name: purchase_order_item; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.purchase_order_item OVERRIDING SYSTEM VALUE VALUES (1, 2, 1, 10, 2800.00);
INSERT INTO public.purchase_order_item OVERRIDING SYSTEM VALUE VALUES (2, 3, 3, 5, 3500.00);
INSERT INTO public.purchase_order_item OVERRIDING SYSTEM VALUE VALUES (3, 4, 5, 8, 6300.00);
INSERT INTO public.purchase_order_item OVERRIDING SYSTEM VALUE VALUES (4, 2, 1, 15, 3000.00);


--
-- Data for Name: sales_order_item; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.sales_order_item OVERRIDING SYSTEM VALUE VALUES (1, 1, 4, 5, 23000.00, 2500.00);
INSERT INTO public.sales_order_item OVERRIDING SYSTEM VALUE VALUES (2, 4, 1, 10, 4500.00, 1150.00);
INSERT INTO public.sales_order_item OVERRIDING SYSTEM VALUE VALUES (3, 4, 3, 10, 8000.00, 2000.00);
INSERT INTO public.sales_order_item OVERRIDING SYSTEM VALUE VALUES (4, 2, 2, 15, 7000.00, 1000.00);


--
-- Data for Name: vendor_bill; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.vendor_bill OVERRIDING SYSTEM VALUE VALUES (1, 2, '2026-01-09', '2026-01-10');
INSERT INTO public.vendor_bill OVERRIDING SYSTEM VALUE VALUES (2, 3, '2026-08-09', '2026-08-10');
INSERT INTO public.vendor_bill OVERRIDING SYSTEM VALUE VALUES (3, 4, '2026-10-09', '2026-10-10');


--
-- Data for Name: vendor_payment; Type: TABLE DATA; Schema: public;  
--

INSERT INTO public.vendor_payment OVERRIDING SYSTEM VALUE VALUES (3, 1, 1);
INSERT INTO public.vendor_payment OVERRIDING SYSTEM VALUE VALUES (4, 2, 2);


--
-- Name: analytic_account_account_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.analytic_account_account_id_seq', 7, true);


--
-- Name: budget_budget_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.budget_budget_id_seq', 4, true);


--
-- Name: coa_coa_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.coa_coa_id_seq', 8, true);


--
-- Name: contact_contact_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.contact_contact_id_seq', 100005, true);


--
-- Name: customer_invoice_customer_invoice_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.customer_invoice_customer_invoice_id_seq', 4, true);


--
-- Name: customer_payment_customer_payment_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.customer_payment_customer_payment_id_seq', 2, true);


--
-- Name: default_accounts_default_accounts_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.default_accounts_default_accounts_id_seq', 6, true);


--
-- Name: journal_entry_journal_entry_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.journal_entry_journal_entry_id_seq', 7, true);


--
-- Name: journal_items_journal_items_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.journal_items_journal_items_id_seq', 7, true);


--
-- Name: journal_journal_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.journal_journal_id_seq', 4, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.product_product_id_seq', 6, true);


--
-- Name: purchase_order_item_purchase_order_item_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.purchase_order_item_purchase_order_item_id_seq', 4, true);


--
-- Name: purchase_order_purchase_order_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.purchase_order_purchase_order_id_seq', 5, true);


--
-- Name: sales_order_item_sales_order_item_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.sales_order_item_sales_order_item_id_seq', 4, true);


--
-- Name: sales_order_sales_order_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.sales_order_sales_order_id_seq', 4, true);


--
-- Name: vendor_bill_vendor_bill_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.vendor_bill_vendor_bill_id_seq', 3, true);


--
-- Name: vendor_payment_vendor_payment_id_seq; Type: SEQUENCE SET; Schema: public;  
--

SELECT pg_catalog.setval('public.vendor_payment_vendor_payment_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

\unrestrict O3ZDPzBDYQNDuCoxywoq4kdBNoj9RXlevHIOYNOzQKQIgex15aUixSMfbQNehsB

