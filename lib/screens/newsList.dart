import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsApp/data/dataProcessing.dart';
import 'package:newsApp/data/fetchData.dart';
import 'package:newsApp/screens/newsDesc.dart';
import 'newsDesc.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  Stream<List<NewsData>> news;

  @override
  void initState() {
    super.initState();
    news = Stream.fromFuture(new FetchData().getNewsData).asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "News",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            child: _buildNewsList(news),
            margin: EdgeInsets.only(top: 5),
            color: Colors.white,
          ),
        ));
  }

//New list on home page
  Widget _buildNewsList(Stream<List<NewsData>> newsStream) {
    return StreamBuilder<List<NewsData>>(
      stream: newsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SpinKitChasingDots(
            color: Colors.grey,
            size: 50.0,
          );
        } else {
          List<NewsData> news = snapshot.data;
          return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Description(news: news[index]),
                            ));
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    news[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    news[index].publisher,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Color.fromRGBO(166, 166, 166, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
