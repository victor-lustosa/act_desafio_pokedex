import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future get(String url);
}

class DioExternal implements IHttpClient {
  final Dio dio;

  DioExternal({required this.dio});

  @override
  Future get(String url) async {
    return await dio.get(url);
  }
}
