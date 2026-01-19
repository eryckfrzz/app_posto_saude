import 'package:app_posto/shared/features/user/data/models/agent.dart';
import 'package:app_posto/shared/features/user/data/remote/agent_service_impl.dart';
import 'package:flutter/material.dart';

class LoginAgent extends StatelessWidget {
  const LoginAgent({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _cpfController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    final String cpf = _cpfController.text;
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String agentCode = "AGENT123"; // Código fixo para o agente

    final _service = AgentServiceImpl();

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
      if (cpf.isEmpty || name.isEmpty || email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Por favor, preencha todos os campos!')),
        );
      }

      final Agent? registerAgent = await _service.registerAgent(
        cpf: cpf,
        name: name,
        email: email,
        password: password,
        agentCode: agentCode,
      );

      if (registerAgent == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Algum campo está inválido!')));
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 90,
                    height: 90,
                    child: Image.asset('assets/images/logo2.png')
                  ),
                ],
              ),
          
              SizedBox(height: 40),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Acesse sua conta',
                    style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          
              SizedBox(height: 40),
          
              TextFormField(
                controller: _cpfController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.edit_document),
                  hintText: 'CPF',
                  helperText: '000.000.000-00',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  floatingLabelStyle: TextStyle(color: Colors.transparent),
          
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
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
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Nome completo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
          
                  fillColor: Colors.white,
                  filled: true,
                  floatingLabelStyle: TextStyle(color: Colors.transparent),
          
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                ),
              ),
          
              SizedBox(height: 40),
          
              TextFormField(
                controller: _emailController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  labelText: 'Digite seu código de agente',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
          
                  fillColor: Colors.white,
                  filled: true,
                  floatingLabelStyle: TextStyle(color: Colors.transparent),
          
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                ),
              ),
          
              SizedBox(height: 80),
          
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/userAgent');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(14),
                    ),
                  ),
                  label: const Text('Entrar', style: TextStyle(fontSize: 22)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
