import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          SizedBox(height: 60),

          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            height: 180,
            width: 180,
            child: Image.asset('assets/images/logo.png'),
          ),

          SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo(a) ao Posto \n     de Saúde Digital',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selecione seu perfil para continuar',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),

          SizedBox(height: 40),
          SizedBox(
            height: 60,
            width: buttonWidth,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/loginUser');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.person, size: 30),
              label: const Text("Sou paciente", style: TextStyle(fontSize: 22)),
            ),
          ),

          SizedBox(height: 25),

          SizedBox(
            height: 60,
            width: buttonWidth,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/loginAgent');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              
              icon: Icon(Icons.medical_services_outlined, size: 30),
              label: const Text(
                'Sou agente de saúde',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),

          SizedBox(height: 25),

          SizedBox(
            height: 60,
            width: buttonWidth,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/acessibility');
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.accessibility_new_rounded, size: 30),
              label: const Text(
                'Opções de acessibilidade',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
