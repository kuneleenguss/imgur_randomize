import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/net_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/widgets.dart';

// void main() {
//   runApp(MyWidget());
// }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Ultra Mega Imgur Image Randomizer')),
        ),
        body: MainWidget(),
      ),
    );
  }
}

//TODO: ДОПИСАТЬ КНОПКУ "НАЗАД" - DONE
//TODO: Отключить кнопку, пока загрузка не закончена - DONE
//TODO: Dark Mode
//TODO: Вынести Widget'ы в отдельный файл - DONE


class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  // TextEditingController url = TextEditingController();
  // url = "https://i.imgur.com/g4OAi.jpg";
  String? url;
  bool isLoaded = true;
  bool isInitialized = false;
  final links = <String>[];

  NetRepository netRepository = NetRepository();


  void updateWidget() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    links.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1000,
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NetImageWidget(
              isInitialized: isInitialized, 
              isLoaded: isLoaded, 
              url: url,
              ),
            InputTextWidget(
              links: links,
              ),
            // textFieldWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenerateButtonWidget(
                  isLoaded: isLoaded, 
                  onPressed: () {
                    getRandomUrl();
                  }),
                PreviousButtonWidget(
                  links: links,
                  onPressed: () {
                    getPreviousUrl();
                  },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void getRandomUrl() async {
    setState(() {
      isLoaded = false;
      isInitialized = true;
    });
    // updateWidget();
    
    url = await netRepository.getResponse();

    setState(() {
      isLoaded = true;
      links.add(url.toString());
    });
    // updateWidget();
  }

  void getPreviousUrl() {
    setState(() {
      links.removeAt(links.length - 1);
      url = links.elementAt(links.length - 1);
    });
    // updateWidget();
  }

}

// class MainWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp (
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//         title: Center(child: Text('Тени аутентичности')),
//       ),
//         body: Center(
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               NetImageWidget(),
//               Text("dasd"),
//             ],
//             // child: NetImageWidget(),
//             // child: netImage,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       child: Directionality(
//         textDirection: TextDirection.ltr,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             //BlueBox(),
//             //BlueBox(),
//             Flexible(
//               flex: 1,
//               child: SizedBox(
//                 child: Text(
//                   'Privet gavno!!',
//                   style: TextStyle(color: Colors.blue.shade400, fontSize: 52.0),
//                 ),
//               ),
//             ),
//             Flexible(flex: 1, child: SizedBox(child: BlueBox())),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BlueBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Container(
//         // width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           border: Border.all(),
//         ),
//       ),
//     );
//   }
// }
