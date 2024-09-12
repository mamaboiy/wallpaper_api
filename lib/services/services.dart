import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper_api/model_class/model.dart';
final Uri _url = Uri.parse('https://flutter.dev');

class WallpaperServices {
  String _baseUrl = 'https://api.pexels.com/v1/';
  final _key = 'GN5Az3LNMtbFW5GBh0tRowJzr4jaQsQd21G5MGtlYDtXxVG6cKN3Dvqh';

  Future<List<WallpaperClass>> fetchWallpaperData(String category) async {
    try {
      final url = "${_baseUrl}search?query=${category}&per_page=20";
      final response =
          await http.get(Uri.parse(url), headers: {"Authorization": _key});
      final allData = jsonDecode(response.body);
      final List data = allData["photos"];
      print(data);
      return data.map((photo) => WallpaperClass.fromMap(photo)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> openUrl(String imgurl) async {
    final Uri _url= Uri.parse(imgurl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
