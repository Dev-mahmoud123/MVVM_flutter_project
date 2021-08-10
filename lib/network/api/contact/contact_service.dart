
import 'package:test_app/model/contact/contact_model.dart';

import '../api_client.dart';
import '../api_constants.dart';

class ContactService {
  final _apiClient = ApiClient();

  // ignore: missing_return
  Future<ContactModel> fetchContact() async {
    try {
      final response = await _apiClient.get(
        ApiConstants.CONTACT_URL,
        headers: {
          'lang': 'ar',
          'Content-Type' : 'application/json',
        },
      );
      final result = ContactModel.fromJson(response);
      return result;
    } catch (error) {
      print(error);
    }
  }
}
