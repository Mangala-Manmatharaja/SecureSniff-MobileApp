## 📱 SecureSniff

A Flutter-based Android app to simulate WiFi password auditing, highlighting security vulnerabilities as part of WiFi security research.

## 🔒 Concept

  SecureSniff is an educational tool designed to demonstrate the risks of weak WiFi passwords in campus networks. It simulates auditing a WiFi network by checking the entered 
  SSID against a list of common passwords (e.g., “admin123”, “password123”). This project is part of my “SecureLink” research at SEUSL, which focuses on improving WiFi security 
  using blockchain-based logging solutions (e.g., Hyperledger Fabric).
  
  
## 🌐 Why This Matters

  Weak passwords are a major security gap in campus WiFi networks, making them vulnerable to unauthorized access. SecureSniff shows how easily such passwords can be “cracked” 
  (simulated), emphasizing the need for stronger passwords and secure logging mechanisms.
  


## 📝 Input SSID:
   
   Enter a WiFi SSID (e.g., “admin123”, “SEUSL_Guest”) in the app’s input field.
   The SSID is the name of the WiFi network you’d like to “audit” (simulated).


## 🔧 Simulated Auditing:

 The app checks the SSID against a hardcoded wordlist: ["admin123", "password123", "testwifi", "12345678"].
 A 2-second delay with a loading spinner mimics real auditing time.
 If the SSID matches a wordlist entry (e.g., “admin123”), it shows “Success! Password: admin123 (Simulated)”.
 If there’s no match (e.g., “SEUSL_Guest”), it shows “No passwords matched. (Simulated)”.



## ✨ Features:

   Professional UI: Dark theme with neon green accents, Roboto font, and smooth animations.
   Ethical Disclaimer: A popup on launch ensures the app is used responsibly.
   Research Branding: Displays “WiFi Security Research @ SEUSL” centered on the screen.
   Input Validation: Prevents empty SSID inputs with an error message.


## 🚀 Future Scope:

  Add a Flask backend with pywifi for real WiFi auditing (requires a server setup).
  Integrate Hyperledger Fabric for blockchain-based logging of audit attempts.


## 📋 Requirements

  -Flutter 3.x
  -Android device/emulator
  -FlutLab.io (online IDE for Flutter)


▶️ How to Run

Clone this repo:git clone (https://github.com/Mangala-Manmatharaja/SecureSniff-MobileApp/)


Open in FlutLab.io:
Create a new project in FlutLab.io (“Empty Project”, Flutter 3.x).
Replace pubspec.yaml and lib/main.dart with the files from this repo.
Run flutter pub get to fetch dependencies.


Test in Emulator:
Set Run Configuration to “Android”.
Click “Run” to test in the Android emulator.


Build APK:
Click “Build” > “Android APK” in FlutLab.io.
Download and install on your Android phone.


Input Data:
  Enter any SSID (e.g., “admin123” for a match, “SEUSL_Guest” for no match).
  Click “Start Audit” to see the simulated result.


## ⚠️ Note
  -This app is for educational use only. It simulates WiFi auditing without real network access. Use responsibly and only on networks you own or have permission to test.


## 👨‍💻 Author
Mangala Manmatharaja
