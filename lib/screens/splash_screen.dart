import 'package:advice_app_bloc_sample/screens/home_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(
        // ignore: use_build_context_synchronously
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 23, 23, 23),
              const Color.fromARGB(255, 70, 70, 70),
              const Color.fromARGB(255, 23, 23, 23),
            ],
            stops: [0.1,1,0.6],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.school,
                size: 100,
                color: const Color.fromARGB(255, 172, 172, 172),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
