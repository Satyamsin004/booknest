<div align="center">
  <h1>📚 BookNest</h1>
  <p><b>A beautiful, full-stack Book Shopping App built with Flutter.</b></p>
  
  [![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Provider](https://img.shields.io/badge/Provider-State%20Management-blueviolet?style=for-the-badge)]()
  
  <br/>
</div>

## ✨ Overview

**BookNest** is a premium, modern book shopping mobile application. Designed with a deep focus on stunning UI/UX, smooth micro-animations, and a robust architecture. From browsing curated book lists to real-time order tracking, BookNest delivers a highly polished user experience.

<br/>

## 🚀 Key Features

*   🌗 **Global Dark Mode:** Seamless light/dark theme switching powered by `Provider`. Every color, shadow, and surface adapts instantly.
*   🛍️ **Smart Cart & Checkout:** Add books to your cart, view dynamic price summaries including taxes & delivery, and simulate a smooth checkout flow.
*   🚚 **Live Order Tracking:** Beautiful UI simulating real-time order tracking with animated progress bars, delivery steps, and tipping integration.
*   👤 **Complete Profile Ecosystem:** Includes customizable profile details, payment methods management, delivery addresses, and a notification center.
*   💬 **Customer Support Chat:** A sleek, fully interactive chat interface for customer service.
*   ✨ **Premium UI/UX:** Built with modern design principles—glassmorphism, soft shadows, shimmer loading effects, and smooth page transitions.

<br/>

## 🛠️ Tech Stack

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **State Management:** `provider`
*   **Typography:** `google_fonts` (Poppins & Pacifico)
*   **Image Caching:** `cached_network_image`
*   **Loading Effects:** `shimmer`

<br/>

## 📱 Screenshots

> *Add your screenshots here by dragging and dropping them into the GitHub editor.*

| Home Screen | Dark Mode | Order Tracking |
| :---: | :---: | :---: |
| <img src="https://via.placeholder.com/250x500.png?text=Home" width="250"> | <img src="https://via.placeholder.com/250x500.png?text=Dark+Mode" width="250"> | <img src="https://via.placeholder.com/250x500.png?text=Tracking" width="250"> |

<br/>

## 💻 Getting Started

Follow these steps to run the app locally on your machine.

### Prerequisites
*   Install [Flutter SDK](https://docs.flutter.dev/get-started/install)
*   Install an IDE (VS Code or Android Studio)
*   Enable **Developer Mode** (Windows only) for symlinks if deploying to web.

### 1. Clone the repository
```bash
git clone https://github.com/Satyamsin004/booknest.git
cd booknest
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the App
```bash
# Run on Chrome/Web
flutter run -d chrome

# Run on Android/iOS
flutter run
```

<br/>

## 📁 Project Structure

```text
lib/
├── models/         # Data models (Book, etc.)
├── providers/      # State management (ThemeProvider)
├── screens/        # UI Screens (Home, Profile, Tracking, etc.)
├── theme/          # Global styles, Colors, AppRadius, AppShadows
├── widgets/        # Reusable custom widgets (BookCard, CategoryChip)
└── main.dart       # App entry point & Theme setup
```

<br/>

## 👨‍💻 Author

Built with ❤️ by **Satyam**
*   **GitHub:** [@Satyamsin004](https://github.com/Satyamsin004)
