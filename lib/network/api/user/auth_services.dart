
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/model/auth_model/user_model.dart';

import '../api_client.dart';
import '../api_constants.dart';

class AuthService {
  final _apiClient = ApiClient();

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.LOGIN_URL,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
        },
        body: {
          'email': email,
          'password': password,
        },
      );
      final result = UserModel.fromJson(response);
      return result;
    } catch (error) {
      return error;
    }
  }

  Future<UserModel> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await _apiClient.post(
        ApiConstants.LOGOUT_URL,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
          'Authorization': '$token',
        },
        body: {
          'fcm_token': 'SomeFcmToken',
        },
      );
      final result = UserModel.fromJson(response);
      return result;
    } catch (error) {
      return error;
    }
  }

  Future<UserModel> register(String name, String phone, String email, String password, String image) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.REGISTER_URL,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'ar',
        },
        body: {
          'name' : name,
          'phone' : phone,
          'email': email,
          'password': password,
          'image' : image
        },
      );
      final result = UserModel.fromJson(response);
      return result;
    } catch (error) {
      return error;
    }
  }

}
