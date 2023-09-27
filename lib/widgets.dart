import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/net_model.dart';
import 'package:flutter_application_1/net_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/app.dart';
import 'package:provider/provider.dart';

class NetImageWidget extends StatelessWidget {
  const NetImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var net = context.watch<NetModel>();

    final bool isInitialized = net.isInitialized;
    final bool isLoaded = net.isLoaded;
    final String? url = net.url;

    return Container(
      height: 450,
      child: (isInitialized)
          ? Image(
              image: NetworkImage(url.toString()),
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (isLoaded && loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Center(
                    child: CircularProgressIndicator());
              },
            )
          : Center(
              child: const Text("Press the button to start randomize")),
    );
  }
}

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var net = context.watch<NetModel>();
    final List<String> links = net.links;

    return SelectableText((links.isNotEmpty) ? links.last : "null");
  }
}

class GenerateButtonWidget extends StatelessWidget {
  const GenerateButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoaded = context.select<NetModel, bool>((value) => value.isLoaded);

    return IconButton(
        iconSize: 40,
        onPressed:
            (isLoaded) ? () => context.read<NetModel>().getImageUrl() : null,
        icon: Icon(
          Icons.refresh,
          color: Colors.blue,
        ));
  }
}

class PreviousButtonWidget extends StatelessWidget {
  const PreviousButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> links = context.select<NetModel, List<String>>((value) => value.links);
    // var net = context.watch<NetModel>();
    // final List<String> links = net.links;

    return IconButton(
        iconSize: 40,
        onPressed: (links.length > 1) ? () => context.read<NetModel>().getPreviousUrl() : null,
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.blue,
        ));
  }
}


