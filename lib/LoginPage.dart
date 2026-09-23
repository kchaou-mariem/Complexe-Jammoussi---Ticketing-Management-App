import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
        backgroundColor: Color.fromARGB(255, 58, 56, 49),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            // width: double.infinity,
            //fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // champs de saisie pour le nom d'utilisateur et le mot de passe
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nom d\'utilisateur'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Mot de passe'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Connecté');

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 58, 56, 49),
                  ),
                  child: Text('Se connecter'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
