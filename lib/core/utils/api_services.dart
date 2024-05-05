import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;

  const ApiServices({required Dio dio}) : _dio = dio;

  Future<Response> post({
    required String url,
    required body,
    required String token,
    String? contentType,
  }) async {
    Response response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
