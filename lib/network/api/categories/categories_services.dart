
import 'package:test_app/model/categories/categories_model.dart';

import '../api_client.dart';
import '../api_constants.dart';

class CategoriesServices {
  final _apiClient = ApiClient();

  Future<CategoriesModel> fetchAllCategories() async {
    try {
      final response = await _apiClient.get(
        ApiConstants.CATEGORIES_URL,
        headers: {'lang': 'ar'},
      );
      final result = CategoriesModel.fromJson(response);
      return result;
    } catch (error) {
      return error;
    }
  }
}
