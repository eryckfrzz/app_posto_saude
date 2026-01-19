import 'package:flutter/material.dart';

class AgentProfile extends StatelessWidget {
  const AgentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Perfil do agente',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.teal[700],
      ),
      backgroundColor: Colors.teal[700],
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 35),

              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      width: 130,
                      height: 130,
                      child: Icon(Icons.person, size: 80, color: Colors.black),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '           Nome:',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '           Agente 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                        height: 1,
                        width: 335,
                        decoration: BoxDecoration(color: Colors.black),
                      ),

                      SizedBox(height: 60),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '          CPF:',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '          000.000.000-00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                        height: 1,
                        width: 335,
                        decoration: BoxDecoration(color: Colors.black),
                      ),

                      SizedBox(height: 60),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '          Telefone:',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '          (00) 00000-0000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                        height: 1,
                        width: 335,
                        decoration: BoxDecoration(color: Colors.black),
                      ),

                      SizedBox(height: 60),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '          E-mail:',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '          email@example.com',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      Container(
                        height: 1,
                        width: 335,
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
