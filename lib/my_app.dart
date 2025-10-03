import 'package:app_posto/shared/features/user/presentation/bloc/theme_cubit.dart';
import 'package:app_posto/shared/features/user/presentation/register_form.dart';
import 'package:app_posto/shared/widgets/acessibility_options.dart';
import 'package:app_posto/shared/widgets/login.dart';
import 'package:app_posto/shared/widgets/login_agent.dart';
import 'package:app_posto/shared/widgets/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) => MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Register(),
            '/loginUser': (context) => Login(),
            '/loginAgent': (context) => LoginAgent(),
            '/form': (context) => RegisterForm(),
            '/acessibility': (context) => AcessibilityOptions(),
          },
          debugShowCheckedModeBanner: false,
          theme: state,
        ),
      ),
    );
  }
}
