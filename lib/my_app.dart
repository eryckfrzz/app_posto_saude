import 'package:app_posto/shared/features/user/presentation/bloc/theme_cubit.dart';
import 'package:app_posto/shared/features/user/presentation/register_form.dart';
import 'package:app_posto/shared/widgets/acessibility_options.dart';
import 'package:app_posto/shared/widgets/agent_home.dart';
import 'package:app_posto/shared/widgets/agent_profile.dart';
import 'package:app_posto/shared/widgets/login.dart';
import 'package:app_posto/shared/widgets/login_agent.dart';
import 'package:app_posto/shared/widgets/register.dart';
import 'package:app_posto/shared/widgets/register_record.dart';
import 'package:app_posto/shared/widgets/user_home.dart';
import 'package:app_posto/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, state) => MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Register(),
            '/loginUser': (context) => Login(),
            '/loginAgent': (context) => LoginAgent(),
            '/form': (context) => RegisterForm(),
            '/acessibility': (context) => AcessibilityOptions(),
            '/userHome' : (context) => UserHome(),
            '/agentHome' : (context) => AgentHome(),
            '/registerRecord': (context) => RegisterRecord(), // não usar essa rota
            '/agentProfile': (context) => AgentProfile()
          },
          debugShowCheckedModeBanner: false,
          theme: state.generateThemeData(),

          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(state.fontScale)),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
