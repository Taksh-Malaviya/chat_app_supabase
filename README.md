# 💬 Flutter Chat App with Supabase

A real-time **chat application** built using **Flutter**, **GetX**, and **Supabase**. This app allows users to register, login, view all users (excluding themselves), and chat in real time using Supabase's `realtime` and `auth` features.

---

## 🚀 Features

- 🔐 User Authentication (Register & Login)
- 👥 View all registered users
- 💬 One-on-one chat functionality
- 🔄 Real-time messaging with auto-scroll
- 📡 Supabase Realtime integration
- 👁 Password visibility toggle
- ✅ Reactive UI with GetX
- ✨ Clean  UI

---

## 📦 Tech Stack

| Layer        | Tool / Library                     |
|--------------|-------------------------------------|
| Frontend     | Flutter                            |
| State Mgmt   | GetX                               |
| Backend      | Supabase (Auth, Database, Realtime)|
| UI Toolkit   | Material Design                    |

---

## 🛠️ Setup Instructions

### 1. 📥 Clone the Repository
```bash
git clone https://github.com/your-username/flutter-supabase-chat.git
cd flutter-supabase-chat

lib/
├── controllers/         # All GetX controllers
├── view/
│   ├── screen/
│   │   ├── login/
│   │   ├── register/
│   │   ├── home/
│   │   └── chat/
├── routes/              # App route definitions
├── main.dart            # Entry point

