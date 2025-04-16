import 'package:dio/dio.dart';
import 'package:speezy_mobile/services/storage_service.dart';

class AuthService {
  final StorageService _storageService;
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.speezy.com';

  AuthService(this._storageService);

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<String?> login({required String username, required String password}) async {
    try {
      final response = await _dio.post('/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        final token = response.data['token'];
        if(token == null) {
          throw Exception('Token not found');
        }
        _storageService.saveToken(token);
        return token;
      } else {
        throw Exception('Login failed');
      }
    }catch(e) {
      // Handle error
    }
    _isLoggedIn = true;
  }

  void logout() {
    _isLoggedIn = false;
  }
}