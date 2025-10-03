import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(backgroundColor: Colors.green[200]),
      body: Column(
        children: [
          SizedBox(height: 60),

          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            height: 120,
            width: 120,
            child: Icon(Icons.app_registration, color: Colors.white, size: 60),
          ),

          SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Seja Bem-Vindo(a) Ao Agenda Fácil',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '            Faça de maneira rápida e segura\no registro da sua ficha para consulta médica!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 80),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/loginUser');
            },
            child: Text(
              'Sou paciente',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 104),
            ),
          ),

          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/loginAgent');
            },
            child: Text(
              'Sou agente de saúde',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 73),
            ),
          ),

          SizedBox(height: 40),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/acessibility');
            },
            child: Text(
              'Opções de acessibilidade',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50),
            ),
          ),
        ],
      ),
    );
  }
}
