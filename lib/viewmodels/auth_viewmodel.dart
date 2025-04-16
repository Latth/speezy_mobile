import 'package:flutter/material.dart';
import 'package:speezy_mobile/models/user.dart';

import '../services/auth_service.dart';
import '../services/storage_service.dart';

class AuthViewModel extends ChangeNotifier {
  final StorageService _storageService;
  final AuthService _authService;
  late User user;

  AuthViewModel(this._storageService, this._authService);

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    user = User();
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
