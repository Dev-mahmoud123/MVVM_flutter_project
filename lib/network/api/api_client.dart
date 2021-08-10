import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class ApiClient {

  dynamic get(
    String path, {
    Map<String, String> headers,
    Map<String, dynamic> parameters,
  }) async {
    final url = Uri.https(ApiConstants.BASE_URL, path, parameters ?? {});
    final response = await http.get(
      url,
      headers: headers ?? {},
    );
    return _checkResponse(response);
  }

  dynamic post(
    String path, {
    Map<String, dynamic> body,
    Map<String, String> headers,
    Map<String, dynamic> parameters,
  }) async {
    final url = Uri.https(ApiConstants.BASE_URL, path, parameters ?? {});
    final response = await http.post(
      url,
      body: body == null ? {} : jsonEncode(body),
      headers: headers ?? {},
    );
    return _checkResponse(response);
  }

  dynamic update(
    String path, {
    Map<String, dynamic> body,
    Map<String, String> headers,
  }) async {
    final url = Uri.https(ApiConstants.BASE_URL, path);
    final response = await http.put(
      url,
      body: body,
      headers: headers ?? {},
    );
    return _checkResponse(response);
  }

  dynamic postFile(
    String path, {
    Map<String, String> body,
    Map<String, String> headers,
    String image,
    bool changeImage = false,
  }) async {
    try {
      final url = Uri.https(ApiConstants.BASE_URL, path);
      if (changeImage) {
        final request = http.MultipartRequest('POST', url);
        request.fields.addAll(body);
        request.headers.addAll(headers);
        request.files.add(await http.MultipartFile.fromPath('image', image));
        final response = await request.send();
        final extractedData = await http.Response.fromStream(response);
        return json.decode(extractedData.body);
      } else {
        body['image'] = image;
        return await post(path, headers: headers, body: body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  dynamic _checkResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}
