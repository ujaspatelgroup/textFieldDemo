import 'package:flutter/material.dart';
import 'package:textFieldDemo/screens/main_UserInfo.dart';

void main() => runApp(MyApp());

String counter;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    counter = 'Flutter demo';
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: counter,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserInfoPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
