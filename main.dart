import 'package:flutter/material.dart';
import 'store.dart';
import 'ui_auth.dart';
import 'ui_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FamilyApp());
  store.init();
}

class FamilyApp extends StatefulWidget {
  const FamilyApp({super.key});
  @override
  State<FamilyApp> createState() => _FamilyAppState();
}

class _FamilyAppState extends State<FamilyApp> {
  @override
  void initState() {
    super.initState();
    store.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Group',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: store.isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}
