import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  const ApiServices({required this.dio});

  Future<Response> post({
    required String url,
    required Map body,
    required String token,
    String? contentType,
  }) async {
    Response response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {'Authorization': "Bearer $token"},
      ),
    );
    return response.data;
  }
}
