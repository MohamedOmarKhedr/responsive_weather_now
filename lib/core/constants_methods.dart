import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void printResponse(String text) {
  if (kDebugMode) {
    print("\x1B[33m$text\x1B[0m");
  }
}

void printError(String text) {
  if (kDebugMode) {
    print("\x1B[31m$text\x1B[0m");
  }
}

void printTest(String text) {
  if (kDebugMode) {
    print("\x1B[32m$text\x1B[0m");
  }
}

