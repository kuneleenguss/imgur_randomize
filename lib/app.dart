import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/net_model.dart';
import 'package:flutter_application_1/net_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/widgets.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NetModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: const Text(
              'Ultra Mega Imgur Image Randomizer',
              style: TextStyle(
                fontSize: 14
                ),
              )),
          ),
          body: MainWidget(),
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1000,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            NetImageWidget(),
            InputTextWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GenerateButtonWidget(),
                PreviousButtonWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
