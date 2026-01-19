import 'package:flutter/material.dart';

enum Gender { Masculino, Feminino, Outro }

class RegisterRecord extends StatefulWidget {
  const RegisterRecord({super.key});

  @override
  State<RegisterRecord> createState() => _RegisterRecordState();
}

class _RegisterRecordState extends State<RegisterRecord> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _moreInfoController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();

  String? _validateCpf(String? value) {
    if (value == null) return null;

    String cpf = value.replaceAll(RegExp(r'\D'), '');

    if (cpf.length != 11) {
      return 'O CPF deve conter 11 dígitos.';
    }

    // Evita CPFs com todos os dígitos iguais
    if (RegExp(r'(\d)\1{10}').hasMatch(cpf)) {
      return 'CPF inválido.';
    }

    // Lógica de cálculo dos dígitos verificadores
    int calculateDigit(int limit) {
      int sum = 0;
      for (int i = 0; i < limit; i++) {
        sum += int.parse(cpf[i]) * ((limit + 1) - i);
      }
      int digit = (sum * 10) % 11;
      return digit == 10 ? 0 : digit;
    }

    if (int.parse(cpf[9]) != calculateDigit(9)) {
      return 'CPF inválido.';
    }
    if (int.parse(cpf[10]) != calculateDigit(10)) {
      return 'CPF inválido.';
    }

    return null; // CPF é válido
  }

  Set<Gender> _selectedGender = {Gender.Masculino};

  String _getGenderText(Gender gender) {
    switch (gender) {
      case Gender.Masculino:
        return 'Masculino';
      case Gender.Feminino:
        return 'Feminino';
      case Gender.Outro:
        return 'Outro';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color highlightColor = Colors.green;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            'Registro de ficha médica',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.green[200]),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/userHome');
            },
          ),
        ],
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            TextFormField(
              cursorColor: Colors.black,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),

                fillColor: Colors.white,
                filled: true,
                floatingLabelStyle: TextStyle(color: Colors.transparent),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),

            SizedBox(height: 55),
            TextFormField(
              cursorColor: Colors.black,
              controller: _birthDateController,
              decoration: InputDecoration(
                labelText: 'Digite sua data de nascimento',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                fillColor: Colors.white,
                filled: true,

                floatingLabelStyle: TextStyle(color: Colors.transparent),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),

              keyboardType: TextInputType.datetime,
            ),

            SizedBox(height: 55),

            Text('Selecione seu gênero:', style: TextStyle(fontSize: 20)),

            Center(
              child: SegmentedButton<Gender>(
                // Os valores que podem ser selecionados
                segments: <ButtonSegment<Gender>>[
                  ButtonSegment<Gender>(
                    value: Gender.Masculino,
                    label: Text(_getGenderText(Gender.Masculino)),
                    icon: const Icon(Icons.male),
                  ),
                  ButtonSegment<Gender>(
                    value: Gender.Feminino,
                    label: Text(_getGenderText(Gender.Feminino)),
                    icon: const Icon(Icons.female),
                  ),
                  ButtonSegment<Gender>(
                    value: Gender.Outro,
                    label: Text(_getGenderText(Gender.Outro)),
                    icon: const Icon(Icons.transgender),
                  ),
                ],
                // O conjunto de valores atualmente selecionados
                selected: _selectedGender,
                // Lógica de seleção
                onSelectionChanged: (Set<Gender> newSelection) {
                  // O SegmentedButton retorna um Set, mesmo em modo single-select
                  setState(() {
                    _selectedGender = newSelection.isNotEmpty
                        ? newSelection
                        : {};
                  });
                },
                // Configuração para permitir apenas uma seleção
                multiSelectionEnabled: false,
                emptySelectionAllowed: false, // Não permite deixar vazio
                // Estilo para o botão selecionado (opcional, mas melhora o contraste)
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>((
                    Set<MaterialState> states,
                  ) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.black; // Texto preto no selecionado
                    }
                    return Colors.white70; // Texto branco no não selecionado
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>((
                    Set<MaterialState> states,
                  ) {
                    if (states.contains(MaterialState.selected)) {
                      // Usa a cor de destaque (yellow) quando selecionado
                      return highlightColor;
                    }
                    return Colors.grey.withOpacity(0.2);
                  }),
                ),
              ),
            ),

            SizedBox(height: 55),

            TextFormField(
              cursorColor: Colors.black,
              controller: _moreInfoController,
              decoration: InputDecoration(
                labelText: 'Mais informações (opcional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),

                fillColor: Colors.white,
                filled: true,
                floatingLabelStyle: TextStyle(color: Colors.transparent),
              ),
            ),

            SizedBox(height: 50),

            TextFormField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: 'Digite seu CPF',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                ),

                fillColor: Colors.white,
                filled: true,
                floatingLabelStyle: TextStyle(color: Colors.transparent),
              ),

              keyboardType: TextInputType.number,

              onChanged: (value) {
                _validateCpf(value);
              },
            ),

            SizedBox(height: 65),

            ElevatedButton(
              onPressed: () {
                // Ação ao pressionar o botão de registrar
              },
              child: Text(
                'Registrar',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
