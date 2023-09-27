import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
        Directionality(
          textDirection: TextDirection.rtl,
          child: MyApp(),
          )
        );
}
