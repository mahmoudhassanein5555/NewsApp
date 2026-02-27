 News App

A modern Flutter application for browsing news, built with a focus on **Clean Architecture** principles and dynamic **Theming**.

Key Features
- Multi-Category News:** Specialized modules for Business, Technology, and General news.
- Dynamic Theming:** Seamless switching between **Light** and **Dark** modes using `Cubit`.
- State Management:** Powered by `Bloc/Cubit` for predictable and efficient UI updates.
- Modular Structure:** Organized code for better scalability and maintenance.
  
<p align="center">
  <video src="https://github.com/user-attachments/assets/1c10aeb3-2871-4320-b19f-78ee624011b8" width="300" autoplay loop muted></video>
</p>

Project Structure
The project follows a feature-first modular approach:

-  `lib/features/`: Contains the core business logic and UI for news categories.
-  `lib/core/utils/`: 
-  `theme_cubit.dart`: Logic for theme switching.
-  `app_theme.dart`: Centralized theme definitions (Colors, Fonts, Card Styles).
-  `main.dart`: App entry point and Bloc provider setup.

Getting Started

Prerequisites
- Flutter SDK (Stable)
- Dart SDK

 Installation
1.  Clone the repository:
   git clone https://github.com/your-username/news_app_new_version.git
    
2.  Install dependencies:
    flutter pub get
    
3.  Run the application:
    flutter run

Theming Implementation
The app utilizes a `ThemeCubit` to broadcast `ThemeMode` changes across the `MaterialApp`, ensuring a consistent look and feel whether in Light or Dark mode.

Pro-Tip
If you encounter any `import` errors, ensure the file paths in `lib/core/utils/` match the case-sensitive naming conventions of your OS.

License
This project is for educational purposes. Feel free to use and modify it.



