import 'package:flutter/cupertino.dart';

class PageRouteService {
  static void pageRoute(
      {required BuildContext context, required Widget child}) {
    Route route = PageRouteBuilder(
      opaque: false,
      pageBuilder: (_, __, ___) {
        return child;
      },
    );

    Navigator.push(context, route);
  }
}
