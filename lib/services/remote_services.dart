import 'dart:async';
import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:suvastufood/utils/constants_key.dart';

class RemoteServices {
  final http.Client client;
  RemoteServices(this.client);
  // GetStorage instance for storing user data
  // Create an HTTP client instance.
  // static var client = http.Client();

  // Fetch service data from a given URL.
  Future<ApiResponse> fetchService(
      {required String url, required bool auth}) async {
    try {
      // Build the complete URL using the base URL and the provided URL.
      var completeUrl = Uri.parse(Constants.baseURL + url);

      final appData = GetStorage();

      Map<String, String> header = auth
          ? {
              'Access-Control-Allow-Origin': '*',
              'Authorization': appData.read('token')
            }
          : {
              'Access-Control-Allow-Origin': '*',
            };

      // Send an HTTP GET request to the complete URL.
      var response = await client.get(
        completeUrl,
        headers: header,
      );

      // Decode the JSON response body into a Map.
      Map responseBody = json.decode(response.body);

      // Return the decoded response.
      return ApiResponse(response.statusCode, responseBody);
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        // Send the error and stack trace to Firebase Crashlytics
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      // In case of an error, return an ApiResponse object with an error message and a status code of 500 (Internal Server Error).
      return ApiResponse(500, {"message": e.toString()});
    }
  }

  // Fetch service data from a given URL.
  Future<ApiResponseGetList> fetchServiceList(
      {required String url, required bool auth}) async {
    try {
      // Build the complete URL using the base URL and the provided URL.
      var completeUrl = Uri.parse(Constants.baseURL + url);
      final appData = GetStorage();
      Map<String, String> header = auth
          ? {
              'Access-Control-Allow-Origin': '*',
              'Authorization': appData.read('token')
            }
          : {
              'Access-Control-Allow-Origin': '*',
            };

      // Send an HTTP GET request to the complete URL.
      var response = await client.get(
        completeUrl,
        headers: header,
      );

      // Decode the JSON response body into a Map.
      var responseBody = json.decode(response.body);

      // Return the decoded response.
      return ApiResponseGetList(response.statusCode, responseBody);
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        // Send the error and stack trace to Firebase Crashlytics
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      // In case of an error, return an ApiResponse object with an error message and a status code of 500 (Internal Server Error).
      return ApiResponseGetList(500, {"message": e.toString()});
    }
  }

  // Fetch service data from a given URL.
  Future<ApiResponseGetList> postServiceList({
    required String url,
    required final body,
  }) async {
    try {
      // Build the complete URL using the base URL and the provided URL.
      var completeUrl = Uri.parse(Constants.baseURL + url);
      Map<String, String> headers = {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      };

      // Send an HTTP POST request to the complete URL with the provided request body.
      var response =
          await client.post(completeUrl, body: body, headers: headers);

      // Decode the JSON response body into a Map.
      var responseBody = json.decode(response.body);

      // Return the decoded response.
      return ApiResponseGetList(response.statusCode, responseBody);
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        // Send the error and stack trace to Firebase Crashlytics
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      // In case of an error, return an ApiResponse object with an error message and a status code of 500 (Internal Server Error).
      return ApiResponseGetList(500, {"message": e.toString()});
    }
  }

  // Send a POST request to a given URL with optional authentication and request body.
  Future<ApiResponse> postService({
    required String url,
    required final body,
  }) async {
    final appData = GetStorage();

    // Build the complete URL using the base URL and the provided URL.
    var completeUrl = Uri.parse(Constants.baseURL + url);

    Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json'
    };

    // Send an HTTP POST request to the complete URL with the provided request body.
    var response = await client.post(completeUrl, body: body, headers: headers);

    // Decode the JSON response body into a Map.
    Map responseBody = json.decode(response.body);
    print(completeUrl);

    print(responseBody);
    // Return the decoded response.
    return ApiResponse(response.statusCode, responseBody);
  }

  //delete Service
  Future<ApiResponseListDynamic> postDeleteService(
      {required String url, required final body, required bool auth}) async {
    try {
      final appData = GetStorage();

      // Build the complete URL using the base URL and the provided URL.
      var completeUrl = Uri.parse(Constants.baseURL + url);

      Map<String, String> header = {
        'Access-Control-Allow-Origin': '*',
      };

      // Send an HTTP POST request to the complete URL with the provided request body.
      var response =
          await client.delete(completeUrl, body: body, headers: header);

      // Return the decoded response.
      return ApiResponseListDynamic(response.statusCode, response.body);
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        // Send the error and stack trace to Firebase Crashlytics
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      // In case of an error, return an ApiResponse object with an error message and a status code of 500 (Internal Server Error).
      return ApiResponseListDynamic(500, e.toString());
    }
  }

  // Send a POST request to a given URL with optional authentication and request body.
  Future<ApiResponse> updateService(
      {required String url, required final body, required bool auth}) async {
    try {
      final appData = GetStorage();

      // Build the complete URL using the base URL and the provided URL.
      var completeUrl = Uri.parse(Constants.baseURL + url);

      Map<String, String> header = {
        'Access-Control-Allow-Origin': '*',
      };

      // Send an HTTP POST request to the complete URL with the provided request body.
      var response = await client.put(completeUrl, body: body, headers: header);

      // Decode the JSON response body into a Map.
      Map responseBody = json.decode(response.body);

      // Return the decoded response.
      return ApiResponse(response.statusCode, responseBody);
    } catch (e, stackTrace) {
      if (!kIsWeb) {
        // Send the error and stack trace to Firebase Crashlytics
        FirebaseCrashlytics.instance.recordError(e, stackTrace);
      }
      // In case of an error, return an ApiResponse object with an error message and a status code of 500 (Internal Server Error).
      return ApiResponse(500, {"message": e.toString()});
    }
  }
}

class ApiResponse {
  final int statusCode;
  final Map<dynamic, dynamic> responseBody;

  ApiResponse(this.statusCode, this.responseBody);
}

class ApiResponseGetList {
  final int statusCode;
  final dynamic responseBody;

  ApiResponseGetList(this.statusCode, this.responseBody);
}

class ApiResponseListDynamic {
  final int statusCode;
  final String responseBody;

  ApiResponseListDynamic(this.statusCode, this.responseBody);
}
