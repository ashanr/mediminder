import 'package:flutter/material.dart';
import 'package:mediminder/screens/welcome/components/body.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: WelcomeBody()),
    );
  }
}
