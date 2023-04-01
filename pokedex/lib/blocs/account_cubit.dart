import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/account_repository.dart';

import '../models/profil_model.dart';

class AccountCubit extends Cubit<List<Account>> {
  final AccountRepository accountRepository;

  AccountCubit(this.accountRepository) : super([]);

  Future<void> loadAccounts() async {
    emit(await accountRepository.loadAccounts());
  }

  void addAccount(Account account) {
    emit([...state, account]);
    accountRepository.saveAccount(state);
  }
}
