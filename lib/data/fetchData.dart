import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsApp/data/dataProcessing.dart';

//Handles API requests to get the news data
class FetchData {
  Future<List<NewsData>> get getNewsData async {
    String url =
        "https://learnappmaking.com/ex/news/articles/Apple?secret=CHWGk3OTwgObtQxGqdLvVhwji6FsYm95oe87o3ju";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = convert.jsonDecode(response.body);

      //Convert JSON response to custom dart object in the background with the compute isolate method
      return compute(parseNewsData, data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

/*
 * @ param Map data from the api
 * @ return list of custom News object
 */
List<NewsData> parseNewsData(Map<String, dynamic> newsData) {
  List<dynamic> _newsList = newsData['articles'];
  final List<Map<String, dynamic>> articles =
      _newsList.cast<Map<String, dynamic>>();
  return articles.map<NewsData>((json) => NewsData.fromJson(json)).toList();
}
