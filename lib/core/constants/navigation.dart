import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

  class Navigation {
    static Future push(BuildContext context, String screenPage, [dynamic extra]) {
      return context.push(screenPage, extra: extra);
    }

    static pushReplacement(
      BuildContext context,
      String screenPage, [
      dynamic extra,
    ]) {
      context.pushReplacement(screenPage, extra: extra);
    }

    static go(BuildContext context, String screenPage, [dynamic extra]) {
      context.go(screenPage, extra: extra);
    }

    static pop<T>(BuildContext context, [T? result]) {
      if (context.canPop()) {
        context.pop(result);
      }
    }
  }
