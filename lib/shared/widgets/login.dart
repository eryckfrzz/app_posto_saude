import 'package:app_posto/shared/features/user/data/models/user.dart';
import 'package:app_posto/shared/features/user/data/remote/user_service_impl.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _cpfController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();

    final String cpf = _cpfController.text;
    final String name = _nameController.text;
    final String phone = _phoneController.text;

    final _service = UserServiceImpl();

    void _verifyCpf() {
      // Remove caracteres não numéricos
      cpf.replaceAll(RegExp(r'\D'), '');

      // Verifica se o CPF tem 11 dígitos
      if (cpf.length != 11) {
        return null;
      }

      // Evita CPFs com todos os dígitos iguais (ex: 111.111.111-11)
      if (RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
        return null;
      }

      // Calcula o primeiro dígito verificador
      int sum = 0;
      for (int i = 0; i < 9; i++) {
        sum += int.parse(cpf[i]) * (10 - i);
      }
      int firstVerifierDigit = (sum * 10) % 11;
      if (firstVerifierDigit == 10) {
        firstVerifierDigit = 0;
      }

      // Compara o primeiro dígito calculado com o do CPF
      if (firstVerifierDigit != int.parse(cpf[9])) {
        return null;
      }

      // Calcula o segundo dígito verificador
      sum = 0;
      for (int i = 0; i < 10; i++) {
        sum += int.parse(cpf[i]) * (11 - i);
      }
      int secondVerifierDigit = (sum * 10) % 11;
      if (secondVerifierDigit == 10) {
        secondVerifierDigit = 0;
      }

      // Compara o segundo dígito calculado com o do CPF
      if (secondVerifierDigit != int.parse(cpf[10])) {
        return null;
      }

      // Se passou por todas as verificações, o CPF é válido
      print('CPF válido');
    }

    Future<void> _handleRegister() async {
      if (cpf.isEmpty || name.isEmpty || phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor, preencha todos os campos!')),
        );
      }

      final User? registerdUser = await _service.registerUser(
        cpf: cpf,
        name: name,
        phone: phone,
      );

      if (registerdUser == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Algum campo está inválido!')));
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.settings, color: Colors.white, size: 40),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  width: 90,
                  height: 90,
                  child: Icon(Icons.person, size: 80, color: Colors.black),
                ),
              ],
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Preencha suas informações abaixo:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 40),

            TextFormField(
              controller: _cpfController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Digite seu CPF',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
                fillColor: Colors.white,
                filled: true,
                floatingLabelStyle: TextStyle(color: Colors.transparent),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
              ),

              keyboardType: TextInputType.number,
              onChanged: (value) {
                _verifyCpf();
              },
            ),

            SizedBox(height: 40),

            TextFormField(
              controller: _nameController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),

                fillColor: Colors.white,
                filled: true,
                floatingLabelStyle: TextStyle(color: Colors.transparent),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
              ),
            ),

            SizedBox(height: 40),

            TextFormField(
              controller: _phoneController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Digite seu telefone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),

                fillColor: Colors.white,
                filled: true,
                floatingLabelStyle: TextStyle(color: Colors.transparent),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                ),
              ),
            ),

            SizedBox(height: 100),

            ElevatedButton(
              onPressed: () {
                _handleRegister();
              },
              child: Text(
                'Entrar',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
