import 'package:app_posto/shared/features/user/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcessibilityOptions extends StatefulWidget {
  const AcessibilityOptions({super.key});

  @override
  State<AcessibilityOptions> createState() => _AcessibilityOptionsState();
}

class _AcessibilityOptionsState extends State<AcessibilityOptions> {
  double _fontSize = 20;
  bool _isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              width: 90,
              height: 90,
              child: Icon(Icons.accessibility, color: Colors.white, size: 80),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Opções de acessibilidade',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 70),
            Row(
              children: [
                Text('    Tamanho da fonte', style: TextStyle(fontSize: 20)),
              ],
            ),

            SizedBox(height: 10),
            Row(
              children: [
                Slider(
                  value: _fontSize,
                  min: 16,
                  max: 30,
                  label: _fontSize.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _fontSize = value;
                      themeCubit.changeFontSize(value / 20);
                    });
                  },
                ),
                Text(
                  _fontSize.round().toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 70),
            Row(
              children: [
                Text('   Tema da aplicação', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 10),

            SwitchListTile(
              title: Text('Modo Escuro', style: TextStyle(fontSize: 18)),
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                  themeCubit.changeTheme(isDark: value);
                });
              },
              secondary: Icon(
                _isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              ),
              activeThumbColor: Colors.blue,
            ),

            SizedBox(height: 70),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Salvar configurações',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 73),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
