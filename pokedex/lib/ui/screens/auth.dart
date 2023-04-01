import 'package:flutter/material.dart';

//Mettre const partout pour enlever les lignes bleus warning

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                  text: 'Bienvenue sur l\'application\n'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                        text: 'Pokedex\n'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                )),
                Text('Votre pokedex portatif',
                    style: TextStyle(fontStyle: FontStyle.italic)),
                SizedBox(
                  height: 100.0,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Enter your pseudo'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Ex: Gotaga',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(color: Colors.grey),
                            )),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/Home'),
                        child: Text(
                          'continue'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
