# ⚙️ OEE SYSTEM – GENERAL MANUAL INPUT (UNIVERSAL VERSION FOR NODE-RED 2.0)

![Project Status](https://img.shields.io/badge/status-completed-brightgreen)
[![License](https://img.shields.io/badge/license-MIT-blue)](./LICENSE)

A comprehensive **Overall Equipment Effectiveness (OEE)** monitoring system built using **Node-RED 2.0**, integrating **manual input forms**, **automatic OEE calculation**, and **real-time visualization dashboards**.
This project provides a **universal Node-RED flow** adaptable for any **production line**, **machine type**, or **manufacturing environment**.

---

## **Project Overview**

This project simulates a **Manufacturing Data Collection System** that allows operators and engineers to input key production data, track losses, and automatically calculate **OEE (Availability, Performance, Quality)** in real-time.

It supports:

* Manual data entry via **Node-RED Dashboard 2.0**
* **Automatic OEE computation**
* **Integrated MySQL database storage**
* **Maintenance & downtime tracking**
* **Loss breakdown visualization**

Designed for flexible deployment across **any production process** — from **assembly lines** to **CNC operations**.

---

## **System Architecture**

### 🧬 **Technologies Used**

* **Node-RED 2.0+**
* **MySQL Database**
* **Node-RED Dashboard 2.0**
* **Function Nodes (OEE Calculation)**
* **Inject / Change Nodes (Auto Save)**
* **Timestamp & Template Nodes**
* **Web UI – Form, Table, Chart, Gauge**

---

## **System Workflow**

### 🟢 1️⃣ INPUT SECTION – MAIN PRODUCTION DATA

#### **A. MACHINE INFORMATION**

| Input Utama       | Sub-Input                                        | Keterangan            | Node Dashboard |
| ----------------- | ------------------------------------------------ | --------------------- | -------------- |
| Machine Group     | Production / Assembly / Packaging / CNC / Line A | Area atau grup mesin  | Dropdown       |
| Machine No        | MC-01 / MC-02                                    | ID unik mesin         | Dropdown       |
| Machine Name      | Machine Line 1                                   | Nama mesin / line     | Text input     |
| Department / Area | Production Area / Finishing                      | Lokasi mesin          | Dropdown       |
| Shift             | 1 / 2 / 3                                        | Shift kerja           | Dropdown       |
| Operator Name     | Nama operator                                    | Nama pencatat data    | Text input     |
| Operator ID       | NIP / ID                                         | Identifikasi operator | Text input     |
| Status            | Running / Idle / Breakdown / Setup / Off         | Kondisi mesin terkini | Dropdown       |
| Loading Time      | hh:mm:ss                                         | Waktu setup awal      | Time input     |
| Stop Time         | hh:mm:ss                                         | Total waktu berhenti  | Time input     |

---

#### **B. WORK ORDER / PRODUCTION INFORMATION**

| Input Utama         | Sub-Input             | Keterangan              | Node Dashboard |
| ------------------- | --------------------- | ----------------------- | -------------- |
| Work Order No       | WO20251005A           | Nomor order kerja       | Text input     |
| Product Code        | PRD123456             | Kode produk             | Text input     |
| Product Description | Product Name / Item   | Nama / deskripsi produk | Text input     |
| Order Quantity      | 1000 unit             | Jumlah pesanan          | Number input   |
| Actual Quantity     | 950 unit              | Jumlah aktual selesai   | Number input   |
| Cycle Time (Ideal)  | 45 detik/unit         | Waktu ideal per produk  | Number input   |
| Due Date            | 2025-10-10            | Target selesai          | Date picker    |
| Start Date          | 2025-10-05            | Mulai produksi          | Date picker    |
| End Date            | 2025-10-05            | Selesai produksi        | Date picker    |
| Order Status        | Running / Completed   | Status kerja            | Dropdown       |
| Department / Area   | Production / Assembly | Area kerja              | Dropdown       |

---

#### **C. PRODUCTION RESULT**

| Input Utama      | Sub-Input                     | Keterangan              | Node Dashboard |
| ---------------- | ----------------------------- | ----------------------- | -------------- |
| Total Output     | Total produk dihasilkan       | Auto / Manual input     | Number input   |
| Good Units       | Produk lolos QC               | OK product              | Number input   |
| Defective Units  | Produk cacat total            | NG product              | Number input   |
| Defect Type      | Scratch / Crack / Short / etc | Jenis cacat             | Dropdown       |
| Startup Rejects  | Produk cacat awal proses      | Reject awal mesin jalan | Number input   |
| Output per Shift | Produksi tiap shift           | Shift 1/2/3             | Table input    |

---

#### **D. TIME DATA**

| Input Utama             | Sub-Input                          | Keterangan               | Node Dashboard |
| ----------------------- | ---------------------------------- | ------------------------ | -------------- |
| Shift Start Time        | Jam mulai                          | Waktu awal shift         | Time input     |
| Shift End Time          | Jam selesai                        | Waktu akhir shift        | Time input     |
| Break Time              | menit                              | Waktu istirahat          | Number input   |
| Planned Stop Time       | menit                              | Waktu berhenti terjadwal | Number input   |
| Planned Production Time | Total Shift - Break - Planned Stop | Waktu efektif            | Auto computed  |
| Operation Time          | Planned - Downtime                 | Waktu berjalan aktual    | Auto computed  |

---

### 🟣 2️⃣ LOSS SECTION – SIX BIG LOSSES (GENERAL)

| Kategori          | Jenis Loss          | Contoh                        | Dampak     | Node Dashboard          |
| ----------------- | ------------------- | ----------------------------- | ---------- | ----------------------- |
| Availability Loss | Equipment Failure   | Mesin rusak / error           | Downtime   | Dropdown + Number input |
| Availability Loss | Setup & Adjustment  | Ganti produk / tooling        | Downtime   | Dropdown + Number input |
| Performance Loss  | Idling / Minor Stop | Sensor error / empty material | Speed loss | Dropdown + Number input |
| Performance Loss  | Reduced Speed       | Mesin lambat dari ideal       | Speed loss | Dropdown + Number input |
| Quality Loss      | Process Defect      | Produk gagal QC               | Reject     | Dropdown + Number input |
| Quality Loss      | Startup Loss        | Reject awal mesin start       | Yield loss | Dropdown + Number input |

📊 **Dashboard View:**

* Loss Log Table
* Pie Chart “Six Big Losses Breakdown”

---

### 🟡 3️⃣ SUPPORTING DATA (MAINTENANCE & NOTES)

| Input Utama        | Sub-Input                        | Keterangan                      | Node Dashboard |
| ------------------ | -------------------------------- | ------------------------------- | -------------- |
| Maintenance Record | Start / End Time                 | Waktu mulai & selesai perbaikan | Time input     |
| Technician Name    | -                                | Nama teknisi                    | Text input     |
| Failure Type       | Mechanical / Electrical / Others | Jenis gangguan                  | Dropdown       |
| Production Notes   | Issue Description                | Catatan masalah produksi        | Text area      |
| Action Taken       | Solusi                           | Tindakan perbaikan              | Text area      |
| Remark             | -                                | Catatan tambahan                | Text area      |
| Environment Data   | Temperature / Humidity           | Opsional                        | Number input   |

---

### 🔵 4️⃣ DOWNTIME & LOSS DETAIL

| Downtime Category  | Contoh                | Dampak     | Node Dashboard          |
| ------------------ | --------------------- | ---------- | ----------------------- |
| Breakdown          | Mesin rusak           | Downtime   | Dropdown + Number input |
| Setup / Changeover | Ganti tooling / bahan | Downtime   | Dropdown + Number input |
| Material Shortage  | Bahan habis / telat   | Stop       | Dropdown + Number input |
| Power Failure      | Listrik padam         | Stop total | Dropdown + Number input |
| Operator Delay     | Absen / meeting       | Delay      | Dropdown + Number input |
| Unplanned Stop     | Sensor error / macet  | Minor stop | Dropdown + Number input |

---

### 🧢 5️⃣ OEE CALCULATION

| Komponen             | Rumus                                                   | Node Dashboard |
| -------------------- | ------------------------------------------------------- | -------------- |
| **Availability (%)** | (Operation Time ÷ Planned Production Time) × 100        | Gauge / Label  |
| **Performance (%)**  | (Ideal Cycle Time × Total Units) ÷ Operation Time × 100 | Gauge / Label  |
| **Quality (%)**      | (Good Units ÷ Total Units) × 100                        | Gauge / Label  |
| **OEE (%)**          | Availability × Performance × Quality                    | Gauge utama    |

📊 **Additional Outputs:**

* Pie Chart: Six Big Losses Breakdown
* Line Chart: OEE per Hari / Shift
* Bar Chart: Downtime per Kategori

---

### 🖥️ 6️⃣ DASHBOARD STRUCTURE (GENERAL LAYOUT)

| Dashboard                            | Isi / Komponen                        | Jenis Node         |
| ------------------------------------ | ------------------------------------- | ------------------ |
| Dashboard 1 – Input Produksi         | Machine Info + WO + Operator + Output | Form + Button      |
| Dashboard 2 – Loss Monitoring        | Loss Input + Chart Breakdown          | Table + Pie Chart  |
| Dashboard 3 – OEE Monitoring         | Gauge A, P, Q, OEE                    | Gauge + Label      |
| Dashboard 4 – Production Summary     | Tabel hasil & grafik tren             | Table + Line Chart |
| Dashboard 5 – Maintenance & Tracking | Maintenance Log + Status Mesin        | Table + Indicator  |

---

### ⚙️ 7️⃣ BACKEND SYSTEM (NODE-RED + MYSQL)

| Komponen      | Node               | Fungsi                                             |
| ------------- | ------------------ | -------------------------------------------------- |
| Database      | MySQL Node         | Simpan semua data (machine, WO, result, loss, OEE) |
| Kalkulasi OEE | Function Node      | Hitung A, P, Q, OEE otomatis                       |
| Time Handling | Timestamp Node     | Simpan waktu input                                 |
| Visualisasi   | Dashboard 2.0 Node | Gauge, Chart, Table                                |
| Auto Save     | Inject + Change    | Simpan otomatis tiap shift                         |

---

## **Setup Guide**

1. **Clone the Repository**

   ```sh
   git clone https://github.com/username/oee-node-red.git
   cd oee-node-red
   ```

2. **Install Node-RED**

   ```sh
   npm install -g node-red
   ```

3. **Import Node-RED Flow**

   * Open [http://localhost:1880](http://localhost:1880)
   * Import `oee-flow.json`
   * Deploy the flow

4. **Configure Database**

   * Setup MySQL Database
   * Update credentials in Node-RED MySQL Node

5. **Start the System**

   ```sh
   node-red
   ```

---

## **Usage**

1. Access the **Node-RED Dashboard** via [http://localhost:1880/ui](http://localhost:1880/ui)
2. Input production, machine, and work order data.
3. Observe **OEE calculations** update automatically.
4. View **Loss Breakdown** and **OEE trends**.
5. Record maintenance logs and downtime events in real time.

---

## **Project Status**

This project is **completed** and ready for deployment as a **universal OEE data collection system** in any manufacturing environment.

---

## **License**

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

<img height="50px" alt="MES UTS" src="https://github.com/user-attachments/assets/7cdedccd-27a3-475a-92e6-57314e390310" />
