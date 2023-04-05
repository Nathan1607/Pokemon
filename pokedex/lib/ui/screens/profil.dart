import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/account_cubit.dart';
import '../../models/profil_model.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AccountCubit, List<Account>>(
        builder: ((BuildContext context, List<Account> accounts) {
          return ListView.separated(
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int index) {
              final Account account = accounts[index];
              return ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: Text(account.name),
                subtitle: Text('Région de  ${account.region}'),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/Add_Profil'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
