import 'package:dio/dio.dart';

import '../domain/repositories/repository.dart';

abstract class IHttpClient {
  Future<ResponseDTO> get(String url);
}

class DioExternal implements IHttpClient {
  final Dio dio;

  DioExternal({required this.dio});

  @override
  Future<ResponseDTO> get(String url) async {
    try{
      final response = await dio.get(url);
      if(response.statusCode != 200){
        return ResponseDTO(statusCode: response.statusCode ?? 0, data: null);
      } else{
        return ResponseDTO(statusCode: response.statusCode ?? 0, data: response.data);
      }

    }catch(_){
      return ResponseDTO(statusCode: 0, data: null);
    }
  }
}
