import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediminder/constants.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // _WelcomePageState createState() => _WelcomePageState();
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Set the background color to pink
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Animated text "Welcome to Mediminder"
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Welcome to Mediminder',
                  textStyle: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: kButtonPrimaryColor,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1, // Play the animation once
            ),
            const SizedBox(height: 20.0),
            SvgPicture.asset('assets/images/12810348_5063407.svg'),
            // Animated "Get Started" button
            ElevatedButton(
              onPressed: () {
                // Navigate to your main app screen or another page
                Navigator.pushNamed(context, '/dashbordpage'

                    /// Corrected line
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonPrimaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('Get Start'),
            ),
          ],
        ),
      ),
    );
  }
}
