import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';

part 'request_builder.g.dart';

@riverpod
class RequestBuilder extends _$RequestBuilder {
  @override
  void build() {}

  String getMobileApiBaseUrl() => dotenv.env['API_URL']!;

  Map<String, String> buildHeaders({String? token}) {
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    if (token != null && token.isNotEmpty) {
      headers["Authorization"] = "Bearer $token";
    }
    return headers;
  }

  Future<ResultModel<T>> post<T>({
    required String endpoint,
    required T Function(dynamic json) parser,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    final String baseUrl = getMobileApiBaseUrl();
    final String finalUrl = '$baseUrl$endpoint';
    final Uri uri = Uri.parse(finalUrl);
    final Map<String, String> headers = buildHeaders(token: token);

    debugPrint("RequestBuilder POST: $finalUrl");

    if (body != null) {
      debugPrint("RequestBuilder POST Body: ${jsonEncode(body)}");
    }

    if (token != null) {
      debugPrint("RequestBuilder POST: Using token.");
    }

    try {
      final http.Response response = await http.post(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );

      debugPrint("RequestBuilder POST Response Status: ${response.statusCode}");
      debugPrint("RequestBuilder POST Response Body: ${response.body}");

      return _handleResponse<T>(response, parser);
    } catch (e) {
      debugPrint("RequestBuilder POST Network Error: $e");
      return ResultModel<T>(
          error: "Network error. Please check connection: ${e.toString()}");
    }
  }

  Future<ResultModel<T>> get<T>({
    required String endpoint,
    required T Function(dynamic json) parser,
    String? token,
    Map<String, String>? queryParams,
  }) async {
    final String baseUrl = getMobileApiBaseUrl();
    Uri uri = Uri.parse('$baseUrl$endpoint');

    if (queryParams != null && queryParams.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParams);
    }

    final Map<String, String> headers = buildHeaders(token: token);

    debugPrint("RequestBuilder GET: $uri");

    if (token != null) {
      debugPrint("RequestBuilder GET: Using token.");
    }

    try {
      final http.Response response = await http.get(
        uri,
        headers: headers,
      );

      debugPrint("RequestBuilder GET Response Status: ${response.statusCode}");
      debugPrint("RequestBuilder GET Response Body: ${response.body}");

      return _handleResponse<T>(response, parser);
    } catch (e) {
      debugPrint("RequestBuilder GET Network Error: $e");
      return ResultModel<T>(
          error: "Network error. Please check connection: ${e.toString()}");
    }
  }

  ResultModel<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic json) parser,
  ) {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (T == Null && response.body.isEmpty) {
          return ResultModel<T>(
            data: null as T,
            statusCode: response.statusCode,
          );
        }

        // RESPONSE IS A SUCCESS BUT THE BODY IS EMPTY
        if (response.body.isEmpty) {
          debugPrint(
            "RequestBuilder: Empty response body for successful status ${response.statusCode} where content was expected.",
          );
          return ResultModel<T>(
            error: "Empty response from server when data was expected.",
            statusCode: response.statusCode,
          );
        }

        final dynamic decodedJson = jsonDecode(response.body);

        // RESPONSE IS A SUCCESS, WE'RE TRYING TO PARSE THE BODY
        try {
          return ResultModel<T>(
            data: parser(decodedJson),
            statusCode: response.statusCode,
          );
        } catch (e) {
          debugPrint(
            "RequestBuilder: Parser error for successful response: $e. Decoded JSON: $decodedJson",
          );
          return ResultModel<T>(
            error: "Failed to parse successful response data: ${e.toString()}",
            statusCode: response.statusCode,
          );
        }
      }

      if (response.statusCode == 401) {
        debugPrint("RequestBuilder: Unauthorized (401) response received.");
        ref.read(goRouterProvider).go('/login');
      }

      // RESPONSE IS AN ERROR
      String errorMessage = "An error occurred.";
      if (response.body.isNotEmpty) {
        try {
          final dynamic decodedJson = jsonDecode(response.body);
          if (decodedJson is Map<String, dynamic>) {
            if (decodedJson.containsKey('message')) {
              errorMessage = decodedJson['message'] as String;
            } else if (decodedJson.containsKey('error')) {
              errorMessage = decodedJson['error'] as String;
            } else {
              errorMessage = "Server error (Status: ${response.statusCode})";
            }
          } else {
            errorMessage = response.body;
          }
        } catch (e) {
          errorMessage = response.body.isNotEmpty
              ? response.body
              : "Server error (Status: ${response.statusCode}). No details.";
        }
      } else {
        errorMessage =
            "Server error (Status: ${response.statusCode}). Empty error response.";
      }
      debugPrint(
        "RequestBuilder Error (${response.statusCode}): $errorMessage",
      );
      return ResultModel<T>(
        error: errorMessage,
        statusCode: response.statusCode,
      );
    } catch (e) {
      debugPrint(
        "RequestBuilder General Error in _handleResponse: $e. Body: ${response.body}",
      );
      return ResultModel<T>(
        error: "Failed to process server response: ${e.toString()}",
        statusCode: response.statusCode,
      );
    }
  }
}
