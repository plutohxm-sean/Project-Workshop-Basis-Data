# Campus Canteen Database System

## Overview

Campus Canteen Database System merupakan proyek implementasi basis data relasional yang dirancang untuk mendukung digitalisasi operasional kantin kampus dengan banyak tenant. Sistem ini menangani pengelolaan data tenant, menu, pelanggan, transaksi, stok bahan, voucher promosi, serta sistem penilaian layanan melalui fitur rating menu.

Proyek ini dikembangkan sebagai implementasi konsep Basis Data Relasional menggunakan SQL dengan penerapan normalisasi, integritas data, otomasi menggunakan trigger, serta pengaturan hak akses pengguna.

---

## Objectives

Tujuan utama dari proyek ini adalah:

* Membangun sistem basis data terstruktur untuk operasional kantin kampus.
* Mengimplementasikan konsep relasional menggunakan Primary Key dan Foreign Key.
* Menjamin konsistensi data melalui constraint database.
* Mengotomatisasi proses bisnis menggunakan trigger.
* Menyediakan kebutuhan pelaporan dan analisis data menggunakan view dan query kompleks.
* Menerapkan kontrol akses pengguna menggunakan Data Control Language (DCL).

---

## Features

### Relational Database Design

Database dirancang menggunakan pendekatan relasional dengan normalisasi data dan penerapan:

* Primary Key
* Foreign Key
* Unique Constraint
* Check Constraint
* Default Value
* Not Null Constraint

### Transaction Management

Mendukung pencatatan transaksi kantin secara terstruktur, termasuk:

* Pencatatan transaksi pelanggan
* Detail item yang dibeli
* Perhitungan total transaksi
* Penggunaan voucher promosi

### Inventory Management

Sistem dapat mengelola stok bahan secara otomatis melalui trigger database sehingga stok selalu diperbarui setelah transaksi dilakukan.

### Promotion System

Menyediakan fitur voucher yang dapat digunakan pelanggan untuk memperoleh potongan harga atau promo tertentu.

### Customer Feedback

Pelanggan dapat memberikan rating terhadap menu yang telah dibeli sehingga tenant dapat mengevaluasi kualitas produk dan layanan.

### Reporting & Analytics

Menyediakan berbagai query analisis bisnis seperti:

* Menu terlaris
* Tenant dengan omzet tertinggi
* Statistik transaksi
* Analisis pelanggan aktif

### Database Security

Menggunakan mekanisme Role-Based Access Control (RBAC) melalui perintah GRANT dan REVOKE untuk membatasi akses pengguna sesuai kebutuhan operasional.

---

## Database Schema

Database terdiri dari beberapa kelompok tabel utama:

### Master Data

* kategori_menu
* tenant
* pelanggan
* kasir
* menu
* stok_bahan

### Transaction Data

* transaksi
* detail_transaksi

### Additional Features

* voucher
* rating_menu

### Archive Data

* menu_hapus

Total tabel yang digunakan:

* 9 tabel utama
* 2 tabel pendukung

---

## Database Components

### Data Definition Language (DDL)

Berisi definisi struktur database, meliputi:

* Table Creation
* Primary Key
* Foreign Key
* Constraints
* Relationships

### Data Manipulation Language (DML)

Berisi data dummy dan operasi manipulasi data seperti:

* INSERT
* UPDATE
* DELETE
* SELECT

### Advanced SQL Queries

Implementasi berbagai teknik query lanjutan:

* Single Row Function
* Aggregate Function
* Multi-table JOIN
* Nested Query
* Subquery

### Views

View digunakan untuk menyederhanakan proses reporting dan analisis data.

Contoh implementasi:

* Laporan Data Master
* Laporan Transaksi
* Tenant Terlaris
* Ringkasan Penjualan

### Triggers

Database menggunakan trigger untuk mendukung otomatisasi proses bisnis.

#### Automatic Stock Update

Mengurangi stok bahan secara otomatis ketika transaksi berhasil dilakukan.

#### Deleted Menu Archive

Menyimpan data menu yang dihapus ke tabel arsip untuk kebutuhan audit dan backup data.

### Data Control Language (DCL)

Mengatur hak akses pengguna database menggunakan:

* GRANT
* REVOKE

Pendekatan ini menerapkan prinsip Least Privilege untuk meningkatkan keamanan sistem.

---

## Project Structure

```text
.
├── project_basisdata_2425600004.sql
├── laporan_project_basisdata_2425600004_clean.pdf
└── README.md
```

### File Description

| File                                           | Description                                                                                   |
| ---------------------------------------------- | --------------------------------------------------------------------------------------------- |
| project_basisdata_2425600004.sql               | Script utama yang berisi DDL, DML, View, Trigger, Query Analisis, dan DCL                     |
| laporan_project_basisdata_2425600004_clean.pdf | Dokumentasi lengkap mengenai analisis kebutuhan, desain database, implementasi, dan pengujian |
| README.md                                      | Dokumentasi proyek                                                                            |

---

## Technologies Used

* SQL
* Relational Database Management System (RDBMS)
* Database Normalization
* Data Definition Language (DDL)
* Data Manipulation Language (DML)
* Data Control Language (DCL)
* Database Triggers
* Database Views

---

## Learning Outcomes

Melalui proyek ini, konsep-konsep berikut diimplementasikan secara langsung:

* Relational Database Design
* Database Normalization
* Entity Relationship Modeling
* SQL Query Optimization
* Data Integrity Enforcement
* Transaction Management
* Database Automation
* Access Control Management
* Business Data Analytics

---

## Author

Sean Antonio Tarigan

D4 Teknologi Rekayasa Internet

Politeknik Elektronika Negeri Surabaya (PENS)

Email: seannoname07@gmail.com

---

## License

This project was developed for academic and educational purposes.
