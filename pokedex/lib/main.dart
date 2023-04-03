import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pokedex/models/profil_model.dart';
import 'package:pokedex/repositories/account_repository.dart';

import 'package:pokedex/ui/screens/auth.dart';
import 'package:pokedex/ui/screens/home.dart';
// import 'package:pokedex/ui/screens/profil.dart';
import 'package:pokedex/ui/screens/add_profil.dart';

import 'blocs/account_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Instanciation du Cubit
  final AccountRepository accountRepository = AccountRepository();
  final AccountCubit accountCubit = AccountCubit(accountRepository);
  accountCubit.loadAccounts();
  runApp(BlocProvider(
    create: (BuildContext context) => accountCubit, 
    child: App()
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/Auth': (context) => AuthScreen(),
        '/Home': (context) => Home(),
        '/Add_Profil': (context) => AddProfil(),
      },
      initialRoute: '/Auth',
    );
  }
}
