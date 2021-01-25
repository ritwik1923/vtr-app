import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class NetworkHandler {
  String baseurl = "http://10.0.2.2:80";
  Dio dio = new Dio();

  Future post(String url, FormData body) async {
    url = formater(url);
    Response res2 = await dio.post(url, data: body);
    var s = res2.data;
    return s;
  }

  Future allData(String url) async {
    url = formater(url);
    Response res2 = await dio.get(url);
    var s = res2.data;
    debugPrint("Sending Response");
    return s;
  }

  String formater(String url) {
    return baseurl + url;
  }

  NetworkImage getImage(String imageName) {
    String url = formater("/uploads//$imageName");
    return NetworkImage(url);
  }
}
