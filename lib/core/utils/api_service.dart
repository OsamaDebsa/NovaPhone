/*
 * This file includes code that uses components licensed under the MIT License:
 * 
 * The MIT License (MIT)
 * 
 * Copyright (c) nordmarin
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;
  final baseUrl =
      'https://script.google.com/macros/s/AKfycbxNu27V2Y2LuKUIQMK8lX1y0joB6YmG6hUwB1fNeVbgzEh22TcDGrOak03Fk3uBHmz-/exec';

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get(
      '$baseUrl$endpoint',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> data,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await _dio.post(
      baseUrl,
      data: json.encode(data),
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500; // Accepts all status codes below 500
        },
        method: 'POST',
        headers: headers,
      ),
    );

    if (response.statusCode == 302) {
      // Follow the redirect manually
      var newUrl = response.headers.value('location');
      var newResponse = await _dio.get(newUrl!);

      if (newResponse.statusCode == 200) {
        return newResponse.data;
      } else {
        throw Exception('Failed to post data: ${newResponse.statusMessage}');
      }
    } else if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('Failed to post data: ${response.statusMessage}');
    }
  }
}
