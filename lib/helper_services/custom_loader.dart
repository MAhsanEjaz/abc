import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader {
  static void showLoader(
      {required BuildContext context, String message = 'Please wait'}) {
    AlertDialog androidDialog = AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        content: LoaderContentWidget(
          message: message,
        ));
    print('loader started ..');

    showDialog(
        barrierColor: Colors.transparent,
        useSafeArea: true,
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return androidDialog;
        });
  }

  static void hideLoader(BuildContext context) {
    print('hiding loader..');
    // Navigator.pop(context);
    Navigator.of(context, rootNavigator: true).pop();
    // Navigator.of(context).pop();
  }

  static void hideeLoader(BuildContext context) {
    print('hiding loader..');
    // Navigator.pop(context);
    Navigator.pop(context);
    // Navigator.of(context).pop();
  }
}

class LoaderContentWidget extends StatelessWidget {
  final String message;

  LoaderContentWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('will pop executed -->');
        return true;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitCubeGrid(color: Colors.pink)
          // CupertinoActivityIndicator(
          //   radius: 16.0,
          // ),
          // SizedBox(height: 10.0),
          // Text(
          //   message,
          //   style: TextStyle(color: Colors.black, fontSize: 16.0),
          // )
        ],
      ),
    );
  }
}
