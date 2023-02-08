import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/net_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/lab.dart';

class NetImageWidget extends StatelessWidget {
  const NetImageWidget({Key? key, required this.isInitialized, required this.isLoaded, required this.url}) : super(key: key);

  final bool isInitialized;
  final bool isLoaded;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 250,
      height: 450,
      // color: Colors.blue[500],
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
                    // child: const Text('Check if your URL is correct'));
                    child: CircularProgressIndicator());
              },
            )
          : Center(
            // child: const Text("Type URL in the field below")
            child: const Text("Press the button to start randomize")
            ),
    );
  }
}

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({Key? key, required this.links}) : super(key: key);

  final List<String> links;

  @override
  Widget build(BuildContext context) {
    return SelectableText((links.isNotEmpty)
          ? links.last
          : "null");
  }
}

class GenerateButtonWidget extends StatelessWidget {
  const GenerateButtonWidget({Key? key, required this.isLoaded, required this.onPressed}) : super(key: key);

  final bool isLoaded;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 40,
        onPressed: (isLoaded)
          ? onPressed
          : null,
        icon: Icon(
          Icons.refresh,
          color: Colors.blue,
        ));
  }
}

class PreviousButtonWidget extends StatelessWidget {
  const PreviousButtonWidget({Key? key, required this.links, required this.onPressed}) : super(key: key);

  final List<String> links;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 40,
        onPressed: (links.length > 1)
          ? onPressed
          : null,
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.blue,
        ));
  }
}

// class TextFieldWidget extends StatelessWidget {
//   const TextFieldWidget({Key? key}) : super(key: key);

//   final String? url;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//         // controller: url,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: 'Url',
//         ),
//         onSubmitted: (String value) {
//           url = value;
//           getUrl();
//         });
//   }
// }

// Widget netImageWidget() {
//     return Container(
//       // width: 250,
//       height: 500,
//       // color: Colors.blue[500],
//       child: (
//        isInitialized)
//           ? Image(
//               image: NetworkImage(url.toString()),
//               loadingBuilder: (BuildContext context, Widget child,
//                   ImageChunkEvent? loadingProgress) {
//                 if (isloaded && loadingProgress == null) {
//                   return child;
//                 }
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               },
//               errorBuilder: (BuildContext context, Object exception,
//                   StackTrace? stackTrace) {
//                 return Center(
//                     // child: const Text('Check if your URL is correct'));
//                     child: CircularProgressIndicator());
//               },
//             )
//           : Center(child: const Text("Type URL in the field below")),
//     );
//   }

//   Widget inputTextWidget() {
//     // return Text(url.toString());
//     return Text((links.isNotEmpty)
//           ? links.last
//           : "null");
    
//   }

//   Widget textFieldWidget() {
//     return TextField(
//         // controller: url,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: 'Url',
//         ),
//         onSubmitted: (String value) {
//           url = value;
//           getUrl();
//         });
//   }

//   Widget generateButtonWidget() {
//     return IconButton(
//         iconSize: 40,
//         onPressed: (isloaded)
//           ? getRandomUrl
//           : null,
//         icon: Icon(
//           Icons.refresh,
//           color: Colors.blue,
//         ));
//   }

//   Widget previousButtonWidget() {
//     return IconButton(
//         iconSize: 40,
//         onPressed: (links.length > 1)
//           ? getPreviousUrl
//           : null,
//         icon: Icon(
//           Icons.arrow_back_ios_new_rounded,
//           color: Colors.blue,
//         ));
//   }


