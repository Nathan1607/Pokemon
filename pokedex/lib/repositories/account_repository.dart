import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/profil_model.dart';

class AccountRepository {
  Future<void> saveAccount(List<Account> accounts) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];

    for (final Account account in accounts) {
      listJson.add(jsonEncode(account.toJson()));
    }
    prefs.setStringList('accounts', listJson);
  }

  Future<List<Account>> loadAccounts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('accounts') ?? [];
    final List<Account> accounts = [];

    for (String json in listJson) {
      final Map<String, dynamic> map = jsonDecode(json);
      final Account account = Account.fromJson(map);
      accounts.add(account);
    }
    return accounts;
  }
}
