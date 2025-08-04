import 'package:advice_app_bloc_sample/controllers/bloc/advice_bloc.dart';
import 'package:advice_app_bloc_sample/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(AdviceBlocApp());
}

class AdviceBlocApp extends StatelessWidget {
  const AdviceBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AdviceBloc(),
    child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
    ),);
  }
}
