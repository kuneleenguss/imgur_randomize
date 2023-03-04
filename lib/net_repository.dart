// import 'dart:io';
import 'dart:math';
import 'package:universal_io/io.dart';
import 'package:http/http.dart' as http;


class NetRepository {
  final String charAll =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  final _host = "https://i.imgur.com/";

  var _response;

  // HttpClient client = HttpClient();

  String _getRandom() {
    var path = "";
    for (var i = 0; i < 5; i++) {
      path = path + charAll[Random().nextInt(charAll.length)];
    }

    return path + ".jpg";
    // return path + ".png";
  }

  Future<String> getResponse() async {
    _response = await http.get(Uri.parse(_host + _getRandom()));
    
    if (_response.contentLength == 503) {
      await getResponse();
    }

    return _response.request.url.toString();
  }

  // while (true) {
  //   await getResponse();
  //   print("${response.request}, ${response.contentLength}");

  //   // HttpClientRequest request = await client.get('i.imgur.com', 80, '/Zqx9i.jpg');
  //   // HttpClientResponse response = await request.close();
  //   // print('${response.headers} \n ${response.redirects[0].statusCode}');

  //   stdin.readLineSync();
  // }
  

}
