import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService{

  final Dio _dio = Dio();

  ApiService(){
    _dio.options.baseUrl = "http://127.0.0.1:8000";
    //_dio.options.baseUrl = dotenv.env['BASE_API_URL_LOCAL']!;
    _dio.interceptors.add(PrettyDioLogger());

    print("its called ${_dio.hashCode}");
  }
  Dio get dio => _dio;

  ApiError handleException(dynamic e, StackTrace t) {
    log(t.toString());
    log(e.toString());
    if (e is DioException) {
      if (e.response?.statusCode == 400) {
        return ApiError(
            errorCode: 'Bad Request',
            message: e.response?.data['message'] ?? 'Something went wrong');
      }
      return ApiError(
          errorCode: 'API ERROR',
          message: e.message ??
              "Something "
                  "went wrong");
    } else {
      return ApiError(
        errorCode: 'Generic ERROR',
        message: "Something went "
            "wrong",
      );
    }
  }
}

class ApiError{
  final String errorCode;
  final String message;

  ApiError({required this.errorCode, required this.message});

}