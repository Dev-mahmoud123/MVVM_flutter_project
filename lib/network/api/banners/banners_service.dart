
import 'package:test_app/model/banners/banners_model.dart';
import '../api_client.dart';
import '../api_constants.dart';

class BannersServices {
  final _apiClient = ApiClient();

  // ignore: missing_return
  Future<BannersModel> fetchAllBanners() async {
    try {
      final response = await _apiClient.get(
        ApiConstants.BANNERS_URL,
      );
      final result = BannersModel.fromJson(response);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
