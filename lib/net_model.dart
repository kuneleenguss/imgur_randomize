import 'package:flutter/material.dart';
import 'package:flutter_application_1/net_repository.dart';

class NetModel extends ChangeNotifier {
  String? url;

  bool isLoaded = true;
  bool isInitialized = false;
  
  List<String> links = <String>[];

  NetRepository _netRepository = NetRepository();

  void getImageUrl() async {
      isLoaded = false;
      isInitialized = true;
      notifyListeners();
    
    url = await _netRepository.getResponseUrl();
    
      isLoaded = true;
      // select relies on the value obtained to be immutable
      links = [...links, url.toString()];
      // links.add(url.toString());
      notifyListeners();
      print(links.length);
  }

  void getPreviousUrl() {
    //select relies on the value obtained to be immutable
    links = [...links];
    links.removeAt(links.length - 1);
    url = links.elementAt(links.length - 1);
    notifyListeners();
  }
}