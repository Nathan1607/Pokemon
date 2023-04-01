import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/account_cubit.dart';
import '../../models/profil_model.dart';

class AddProfil extends StatelessWidget {
  AddProfil({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nouveau Profil'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le champ ne doit pas  être vide';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  prefixIcon: Icon(Icons.apartment),
                  labelText: "Pseudo du joueur",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _teamController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le champ ne doit pas être vide';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  prefixIcon: Icon(Icons.apartment),
                  labelText: "Team du joueur",
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final String name = _nameController.text;
                      final String team = _teamController.text;

                      final Account account = Account(0, name, team);

                      context.read<AccountCubit>().addAccount(account);

                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Valider'))
            ],
          ),
        ),
      ),
    );
  }
}
