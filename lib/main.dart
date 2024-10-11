import 'package:chatapp/controller/auth_service.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/views/chat_page.dart';
import 'package:chatapp/views/home.dart';
import 'package:chatapp/views/phone_login.dart';
import 'package:chatapp/views/profile.dart';
import 'package:chatapp/views/search_users.dart';
import 'package:chatapp/views/signup.dart';
import 'package:chatapp/views/update_profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routes: {
        '/':(context) => CheckUser(),
        '/login': (context) => const PhoneLogin(),
        '/home': (context) => const HomePage(),
        '/chat': (context) => const ChatPage(),
        '/profile': (context) => const ProfilePage(),
        '/update': (context) => const UpdateProfile(),
        '/search': (context) => const SearchUsers(),
        '/signup': (context) => const SignUpPage(),
      },
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}