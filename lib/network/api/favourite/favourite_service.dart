
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/model/favourite/favourite_model.dart';
import '../api_client.dart';
import '../api_constants.dart';

class FavouriteService {
  final _apiClient = ApiClient();

  // ignore: missing_return
  Future<FavouriteModel> fetchFavourite() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await _apiClient.get(
        ApiConstants.FAVOURITE_URL,
        headers: {
          'lang': 'ar',
          'Content-Type' : 'application/json',
          'Authorization':'$token',
        },
      );
      final result = FavouriteModel.fromJson(response);
      return result;
    } catch (error) {
      print(error);
    }
  }


  // ignore: missing_return
  Future<FavouriteModel> addAndDeleteFavourite(int productId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    try {
      final response = await _apiClient.post(
        ApiConstants.FAVOURITE_URL,
        headers: {
          'lang': 'ar',
          'Content-Type' : 'application/json',
          'Authorization':'$token',
        },
        body: {
          'product_id' : '$productId',
        }
      );
      final result = FavouriteModel.fromJson(response);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
