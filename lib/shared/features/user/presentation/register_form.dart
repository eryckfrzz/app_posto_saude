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
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _birthdayController = TextEditingController();
    TextEditingController _genderController = TextEditingController();
    TextEditingController _moreInfoController =
        TextEditingController(); //pressão alta ou diabetes

    final String name = _nameController.text;
    final String birthday = _birthdayController.text;
    final String gender = _genderController.text;
    final String moreInfo = _moreInfoController.text;

    UserServiceImpl service = UserServiceImpl();

    Genders? _selectedGender;

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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
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
            TextFormField(
              controller: _birthdayController,
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
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

            Row(children: [Text('Selecione seu gênero abaixo:')]),

            RadioListTile(
              title: Text('Masculino'),
              value: Genders.masculine,
              groupValue: _selectedGender,
              onChanged: (Genders? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              activeColor: Colors.green,
            ),

            RadioListTile(
              title: Text('Feminino'),
              value: Genders.feminine,
              groupValue: _selectedGender,
              onChanged: (Genders? value) {
                _selectedGender = value;
              },
              activeColor: Colors.green,
            ),
            SizedBox(height: 40),

            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text('Possui diabetes ou pressão alta?'),
                  TextField(
                    controller: _moreInfoController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
            ),

            SizedBox(height: 60),

            ElevatedButton(
              onPressed: () {
                handleRegisterForm();
              },
              child: Text(
                'Registrar ficha',
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
