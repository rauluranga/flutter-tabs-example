import 'package:flutter/material.dart';
import 'package:flutter_tabs_example/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login Screen'),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MainScreen()),
                (route) =>
                    false, // Remove all the previous routes from the stack
              );
            },
          ),
        ],
      ),
    ));
  }
}
