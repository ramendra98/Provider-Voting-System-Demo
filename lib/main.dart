import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'package:provider/provider.dart';
import 'VotinProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(
        value: VotingProvider(),
        child: HomePage(),
      ),
    );
  }
}
