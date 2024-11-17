# How to run Run Locally

## Prerequisites
- Flutter SDK installed
- Firebase project setup
- FlutterFire CLI installed
- Code editor (e.g., VSCode)

## Steps to Run the Flutter Application Locally

### 1. Clone the Repository
```bash
git clone <repository_url>
cd <repository_name>
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Firebase
- Run the FlutterFire CLI to configure Firebase:
```bash
flutterfire configure
```
- Follow the prompts to select your Firebase project and platforms.

### 4. Run the Application
```bash
flutter run
```

## Using Provider for State Management

### 1. Add Dependencies
Add the following dependencies to your `pubspec.yaml` file:
```yaml
dependencies:
    flutter:
        sdk: flutter
    provider: ^5.0.0
    firebase_core: latest_version
    firebase_auth: latest_version
    cloud_firestore: latest_version
```

### 2. Initialize Firebase
In your `main.dart` file, initialize Firebase:
```dart
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}
```

### 3. Create a Provider
Create a provider for managing state, e.g., `auth_provider.dart`:
```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? _user;

    User? get user => _user;

    Future<void> signIn(String email, String password) async {
        try {
            UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
            _user = userCredential.user;
            notifyListeners();
        } catch (e) {
            print(e);
        }
    }

    Future<void> signOut() async {
        await _auth.signOut();
        _user = null;
        notifyListeners();
    }
}
```

### 4. Provide the Provider
Wrap your app with the `ChangeNotifierProvider` in `main.dart`:
```dart
import 'package:provider/provider.dart';
import 'auth_provider.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(
        ChangeNotifierProvider(
            create: (_) => AuthProvider(),
            child: MyApp(),
        ),
    );
}
```

### 5. Consume the Provider
Use the provider in your widgets to manage state:
```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class LoginPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final authProvider = Provider.of<AuthProvider>(context);

        return Scaffold(
            appBar: AppBar(title: Text('Login')),
            body: Center(
                child: Column(
                    children: [
                        TextField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onChanged: (value) {
                                // Handle email input
                            },
                        ),
                        TextField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            onChanged: (value) {
                                // Handle password input
                            },
                        ),
                        ElevatedButton(
                            onPressed: () {
                                authProvider.signIn('email', 'password');
                            },
                            child: Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

This setup will allow you to run your Flutter application locally with Provider state management and Firebase integration.