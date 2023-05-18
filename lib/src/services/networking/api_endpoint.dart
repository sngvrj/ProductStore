// ignore_for_file: constant_identifier_names
// DO NOT USE 'dartfmt' on this file for formatting

import 'package:flutter/material.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const String baseUrl = stagingUrl;
  static const String stagingUrl = 'https://fakestoreapi.com';
  static const String prodUrl = "https:";
  static const String productionUrl = '';

  static String auth(AuthEndpoint endpoint) {
    var path = '$baseUrl/auth';
    switch (endpoint) {
      case AuthEndpoint.LOGIN:
        return '$path/login';
      case AuthEndpoint.FORGOT_PASSWORD:
        return '$path/otp';
      case AuthEndpoint.RESET_PASSWORD:
        return '$path/reset-password';
      case AuthEndpoint.CHANGE_PASSWORD:
        return '$path/change-password';
      case AuthEndpoint.VERIFY_OTP:
        return '$path/otp-verify';
      case AuthEndpoint.RESEND_OTP:
        return '$path/otp-resend';
    }
  }

  static String allProducts(ProductEndPoint endpoint) {
    // var path = baseUrl';
    switch (endpoint) {
      case ProductEndPoint.ALL_Products:
        return '$baseUrl/products';
    }
  }
}

enum AuthEndpoint {
  LOGIN,

  FORGOT_PASSWORD,

  RESET_PASSWORD,

  CHANGE_PASSWORD,

  VERIFY_OTP,

  RESEND_OTP
}

enum ProductEndPoint { ALL_Products }

// https://fakestoreapi.com/products