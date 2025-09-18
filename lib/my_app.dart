import 'package:app_posto/shared/features/user/presentation/register_form.dart';
import 'package:app_posto/shared/widgets/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/form',
      routes: {'/': (context) => Login(), '/form': (context) => RegisterForm()},
      debugShowCheckedModeBanner: false,
    );
  }
}
