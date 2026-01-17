# CURE 🩺

CURE is a medical mobile application that allows users to book doctors, chat with them in real time, and discover nearby clinics using an interactive map. The application is fully integrated with backend APIs and built using Clean Architecture principles to ensure scalability, testability, and maintainability.

---

## 🚀 Features
- Doctor booking system
- Real-time chat with doctors
- Interactive map for clinic discovery
- Location detection and geocoding
- Image picking for user profiles or chat
- Secure local data storage
- Network connectivity handling
- Clean and responsive UI
- State management with Bloc/Cubit

---

## 🧠 Architecture & Patterns
- **Clean Architecture**
  - Data Layer (Remote / Local Data Sources)
  - Domain Layer (Entities, Use Cases)
  - Presentation Layer (UI, Cubit/Bloc)
- **Repository Pattern**
- **Dependency Injection** using GetIt
- **Functional Error Handling** using Either (dartz)

---

## 🛠 Tech Stack & Packages

### Core
- **Flutter**
- **Dart**

### State Management
- **flutter_bloc** – Cubit & Bloc for state management
- **equatable** – Value equality for states and entities

### Networking & Data
- **dio** – REST API handling
- **dartz** – Functional programming & error handling
- **connectivity_plus** – Network status checking

### Navigation & Dependency Injection
- **go_router** – Declarative navigation
- **get_it** – Dependency injection

### Maps & Location
- **flutter_map** – Map integration
- **geolocator** – Device location
- **geocoding** – Address conversion
- **latlong2** – Map coordinates handling

### UI & UX
- **flutter_svg** – SVG support
- **flutter_spinkit** – Loading indicators
- **modal_progress_hud_nsn** – Loading overlays
- **dotted_border** – Custom UI borders
- **gap** – Consistent spacing
- **pinput** – OTP / PIN input UI
- **cupertino_icons** – iOS-style icons
