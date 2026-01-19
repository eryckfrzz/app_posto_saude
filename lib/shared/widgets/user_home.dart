import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _HomeScreenUserState();
}

class _HomeScreenUserState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset('assets/images/logo3.png'),
            ),

            Text(
              'Área do Paciente',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 80),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/form');
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
                  width: 380,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                        child: Icon(
                          Icons.paste_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Text(
                        'Cadastrar Ficha\nde Atendimento',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF5DAAEF), Color(0xFF3D8DCE)],
                  ),
                ),
                width: 380,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400],
                      ),
                      child: Icon(
                        Icons.medical_services_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Text(
                      'Ver Seu Agente\nde Saúde',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 25),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFA86AD6), Color(0xFF8A4FBF)],
                  ),
                ),
                width: 380,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400],
                      ),
                      child: Icon(
                        Icons.medical_services_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Text(
                      'Ver Seus Dados',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //   drawer: Drawer(
            //   child: ListView(
            //     children: [
            //       UserAccountsDrawerHeader(
            //         accountName: Text('user'),
            //         accountEmail: Text('user@gmail.com'),
            //         currentAccountPicture: CircleAvatar(
            //           backgroundImage: AssetImage('assets/images/user_5860327.png'),
            //         ),
            //         decoration: BoxDecoration(color: Colors.black),
            //       ),
            //       Row(
            //         children: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.pushReplacementNamed(context, 'login');
            //             },
            //             child: Text(
            //               'Sair da Conta',
            //               style: TextStyle(color: Colors.red),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
