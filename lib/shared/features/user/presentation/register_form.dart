import 'package:app_posto/shared/features/user/data/models/user.dart';
import 'package:app_posto/shared/features/user/data/remote/user_service_impl.dart';
import 'package:flutter/material.dart';

enum Genders { masculine, feminine }

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _moreInfoController =
      TextEditingController(); //pressão alta ou diabetes
  TextEditingController _cpfController = TextEditingController();

  UserServiceImpl service = UserServiceImpl();

  Genders? _selectedGender;

  bool temDiabetes = false;
  bool temPressaoAlta = false;

  void dispose() {
    _nameController.dispose();
    _birthdayController.dispose();
    _genderController.dispose();
    _moreInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String name = _nameController.text;
    final String birthday = _birthdayController.text;
    final String gender = _genderController.text;
    final String moreInfo = _moreInfoController.text;
    final String cpf = _cpfController.text;

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

    Future<void> handleRegisterForm() async {
      final User? controller = await service.registerRecord(
        name: name,
        birthday: birthday,
        gender: gender,
        moreInfo: moreInfo,
      );

      if (controller != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ficha registrada com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao registrar ficha!')));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Dados Pessoais e Saúde',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal[700],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nome Completo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
          
                  fillColor: Colors.grey[90],
                  filled: true,
          
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
          
              SizedBox(height: 40),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Data de Nascimento',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextFormField(
                controller: _birthdayController,
                decoration: InputDecoration(
                  hintText: 'DD/MM/AAAA',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
          
                  fillColor: Colors.grey[90],
                  filled: true,
          
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
          
              SizedBox(height: 40),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'CPF',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  hintText: '000.000.000-00', //preencher automaticamente com o cpf já digitado na tela de login
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
          
                  fillColor: Colors.grey[90],
                  filled: true,
          
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
          
              SizedBox(height: 40,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Gênero',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('Masculino'),
                      value: Genders.masculine,
                      groupValue: _selectedGender,
                      onChanged: (Genders? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      activeColor: Colors.teal[700],
                    ),
                  ),
          
                  Expanded(
                    child: RadioListTile(
                      title: Text('Feminino'),
                      value: Genders.feminine,
                      groupValue: _selectedGender,
                      onChanged: (Genders? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      activeColor: Colors.teal[700],
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 40),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Condições de Saúde',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Selecione se possui alguma das condições abaixo:'),
                ],
              ),
          
              SizedBox(height: 10),
          
              CheckboxListTile(
                title: Text('Diabetes'),
                activeColor: Colors.teal[700],
                value: temDiabetes,
                onChanged: (bool? value) {
                  setState(() {
                    temDiabetes = value ?? false;
                  });
                },
              ),
          
              CheckboxListTile(
                title: Text('Pressão Alta (Hipertensão)'),
                value: temPressaoAlta,
                activeColor: Colors.teal[700],
                onChanged: (bool? value) {
                  setState(() {
                    temPressaoAlta = value ?? false;
                  });
                },
              ),
          
              SizedBox(height: 40),
          
              Center(
                child: GestureDetector(
                  onTap: () {
                    handleRegisterForm();
                    _verifyCpf();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF67CFA1), Color(0xFF429890)],
                      ),
                    ),
                    width: 250,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Registrar Ficha',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
