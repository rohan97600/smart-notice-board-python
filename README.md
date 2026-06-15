# smart-notice-board-python
A Python-based Online Notice Board Management System that enables administrators to create, manage, and distribute notices digitally with attachment support, search functionality, and user-friendly interface.
# Online Notice Board Management System

## 📌 Project Overview

The Online Notice Board Management System is a desktop-based application developed using Python and MySQL that provides a digital platform for creating, managing, and viewing notices.

The system replaces traditional paper-based notice boards by allowing administrators to publish notices electronically. Users can easily browse, search, and view notices along with their attachments through a simple and user-friendly interface.

---

## 🎯 Problem Statement

Traditional notice boards require manual updates and physical access, making communication slow and inefficient. Important notices can be missed, damaged, or removed. This project provides a centralized digital solution for managing and distributing notices effectively.

---

## 🎯 Objectives

- Digitize the notice management process.
- Reduce dependency on paper-based notices.
- Provide quick and easy access to announcements.
- Enable notice searching and filtering.
- Store notices securely in a database.
- Improve communication efficiency.

---

## ✨ Features

- Add New Notices
- View All Notices
- Search Notices by Title
- Upload Attachments
- View Attachments
- Edit Existing Notices
- Delete Notices
- MySQL Database Integration
- User-Friendly Interface
- Real-Time Notice Management

---

## 🛠️ Technology Stack

### Frontend
- Python Tkinter

### Backend
- Python

### Database
- MySQL

### Libraries Used
- mysql-connector-python
- Pillow

### Version Control
- Git & GitHub
## 🗄️ Database Structure

### Notice Table

| Field Name | Data Type |
|------------|-----------|
| id | INT (Primary Key) |
| title | VARCHAR |
| content | TEXT |
| attachment | VARCHAR |
| created_at | DATETIME |

---

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/online-notice-board-management-system.git
```
### 2. Navigate to Project Folder

```bash
cd online-notice-board-management-system
```
### 3. Install Required Libraries

```bash
pip install mysql-connector-python pillow
```
### 4. Create Database

```sql
CREATE DATABASE notice_board;
```
### 5. Import Database Schema

Import the provided SQL file into MySQL Workbench.

### 6. Run the Application

```bash
python main.py
```
## 💡 Future Enhancements

- User Authentication System
- Role-Based Access Control
- Email Notifications
- Mobile Application Support
- Cloud Storage Integration
- Notice Categories and Tags
- Notice Expiry Management

## 🎓 Academic Project Information

**Project Title:** Online Notice Board Management System

**Course:** Master of Computer Applications (MCA)

**Institution:** Vishwakarma University

This project was developed as part of the MCA curriculum to demonstrate the implementation of database-driven desktop applications using Python and MySQL.

## 👨‍💻 Authors

### Rohan Jagtap
MCA Student | UI/UX Designer | Python Developer

## 📄 License

This project is developed for educational and academic purposes.

## ⭐ Acknowledgements

Special thanks to our faculty members and institution for their guidance and support throughout the development of this project.

If you found this project helpful, consider giving it a ⭐ on GitHub.
