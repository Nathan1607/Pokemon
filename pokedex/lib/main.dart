import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/repositories/account_repository.dart';

import 'package:pokedex/ui/screens/auth.dart';
import 'package:pokedex/ui/screens/home.dart';
import 'package:pokedex/ui/screens/add_profil.dart';

import 'blocs/account_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AccountRepository accountRepository = AccountRepository();
  final AccountCubit accountCubit = AccountCubit(accountRepository);
  accountCubit.loadAccounts();
  runApp(BlocProvider(
      create: (BuildContext context) => accountCubit, child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/Auth': (context) => const AuthScreen(),
        '/Home': (context) => const Home(),
        '/Add_Profil': (context) => AddProfil(),
      },
      initialRoute: '/Auth',
    );
  }
}
