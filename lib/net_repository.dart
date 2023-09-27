import 'dart:io';
import 'dart:math';
import 'package:universal_io/io.dart';
import 'package:http/http.dart' as http;


class NetRepository {
  final String charAll =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  final _host = "https://i.imgur.com/";
  
  var _response;

  String _getRandom() {
    var path = "";
    for (var i = 0; i < 5; i++) {
      path = path + charAll[Random().nextInt(charAll.length)];
    }

    return path + ".jpg";
  }

  Future<String> getResponseUrl() async {
    _response = await http.get(Uri.parse(_host + _getRandom()));
        
    if (_response.contentLength == 503) {
      await getResponseUrl();
    }
    
    return _response.request.url.toString();
  }
}
