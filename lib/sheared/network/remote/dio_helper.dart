import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio_helper {
  static Dio? dio;
  static init() {
    dio?.options.headers['Authorization'] = 'f96edd43fbc848b69a17ab04fec81381';
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org',////newsapi.org/
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response?> getData({ //
    @required String? url,
    @required  Map<String, dynamic>? query,
  }) async{
    return await dio?.get(url!, queryParameters: query);
  }
}
