
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/model/home/home_data_model.dart';
import '../api_client.dart';
import '../api_constants.dart';

class HomeDataServices {
  final _apiClient = ApiClient();

  // ignore: missing_return
  Future<HomeDataModel> fetchHomeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await _apiClient.get(
        ApiConstants.HOME_DATA_URL,
        headers: {
          'lang': 'ar',
          'Content-Type' : 'application/json',
          'Authorization':'$token',
        },
      );
      final result = HomeDataModel.fromJson(response);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
