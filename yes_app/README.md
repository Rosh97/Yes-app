
# 🚀 Yes App 

Welcome to the **Yes App**, a Flutter application designed to run seamlessly in **GitHub Codespaces** and locally on **Linux** and **Windows** environments.

---

## 📂 Project Structure
```
Yes-app/
├── yes_app/              # Flutter project root
│   ├── lib/              # Dart source files
│   ├── android/          # Android-specific files
│   ├── ios/              # iOS-specific files
│   ├── web/              # Web-specific files
│   ├── pubspec.yaml      # Flutter project configuration
│   └── test/             # Unit and widget tests
└── README.md             # Project setup and instructions
```

---

## 🛠️ Prerequisites

### ✅ **For GitHub Codespaces**
- GitHub Codespaces (setup automatically if you follow the Codespaces guide below)

### 💻 **For Local Development (Linux/Windows)**
- [Flutter SDK (3.16.0)](https://docs.flutter.dev/get-started/install)
- [Android Studio (optional, for emulator)](https://developer.android.com/studio/index.html)
- Java Development Kit (**OpenJDK 11**)
- Google Chrome (for web development)
- Required Linux packages (Linux only)

---

## 🌐 Setup on GitHub Codespaces

### 🚀 **Step 1: Fork and Open in Codespaces**
1. Click the **Fork** button on the top-right of this repository page.
2. After forking, click the **Code** button → **Codespaces** tab → **Create codespace on main**.

### ⚡ **Step 2: Environment Configuration**
Once the Codespace launches, run the following commands **inside the terminal**:

```bash
# Install essential dependencies
sudo apt update && \
sudo apt install -y openjdk-11-jdk wget unzip curl ninja-build cmake pkg-config libgtk-3-dev

# Install Android SDK (if required for mobile dev)
mkdir -p $HOME/Android/Sdk/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip -d $HOME/Android/Sdk/cmdline-tools
mv $HOME/Android/Sdk/cmdline-tools/cmdline-tools $HOME/Android/Sdk/cmdline-tools/latest
rm cmdline-tools.zip

echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH' >> ~/.bashrc
source ~/.bashrc

sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-34" "build-tools;34.0.0"
yes | sdkmanager --licenses
flutter config --android-sdk $ANDROID_HOME
```

### 🌐 **Step 3: Running the App**
Run the Flutter web server:

```bash
flutter pub get
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=5000
```

### 🌍 **Step 4: Open App in Browser**
1. In GitHub Codespaces, click the **"Ports"** tab.
2. Forward port `5000` and click the 🌐 **"Open in Browser"** icon.

Your Flutter app should now be visible! 🎉

---

## 💻 Setup for Local Development

### 🛠 **Step 1: Install Dependencies**
#### ⚡ **Linux:**
```bash
sudo apt update && sudo apt install -y openjdk-11-jdk wget unzip curl ninja-build cmake pkg-config libgtk-3-dev
```

#### ⚡ **Windows:**
1. Install [Git Bash](https://git-scm.com/) for terminal commands.
2. Download [Flutter SDK](https://docs.flutter.dev/get-started/install/windows).
3. Download [Android Studio](https://developer.android.com/studio).

### 📂 **Step 2: Clone Repository**
```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/Yes-app.git
cd Yes-app/yes_app
flutter pub get
```

### 🚀 **Step 3: Run App Locally**
```bash
flutter run -d chrome
```

For mobile development:
```bash
flutter run -d android
```

---

## ⚡ Common Issues & Fixes

### ❓ **Issue:** Android SDK not found
**💡 Fix:**
```bash
flutter config --android-sdk $ANDROID_HOME
flutter doctor --android-licenses
```

### ❓ **Issue:** WebSocket connection errors on Codespaces
**💡 Fix:**
```bash
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=5000
```
Ensure port `5000` is forwarded correctly.
