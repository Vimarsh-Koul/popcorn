import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/Models/images.dart';
import 'package:popcorn/Models/top_rated.dart';
import 'package:popcorn/Models/trending.dart';
import 'package:popcorn/Services/api_manager.dart';
import 'package:popcorn/Widgets/appbar.dart';
import 'package:popcorn/Models/now_playing.dart';
import 'package:popcorn/Models/popular_tv.dart';
import 'package:popcorn/Models/upcoming_movies.dart';

// Icon cus = Icon(
//   Icons.search,
//   size: 30.0,
//   color: Colors.white,
// );
// Widget search = Text("POPCORN",
//     style: TextStyle(
//       fontFamily: 'Bebas Neue',
//       fontSize: 40,
//     ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
// Icon cus = Icon(
//   Icons.search,
//   size: 30.0,
//   color: Colors.white,
// );
// Widget search = Text("POPCORN",
//     style: TextStyle(
//       fontFamily: 'Bebas Neue',
//       fontSize: 40,
//     ));

class _HomeState extends State<Home> {
  String base_url;
  Future<UpcomingMovies> _upcoming_movies_result;
  Future<TopRated> _top_rated_result;
  Future<Trending> _trending_result;
  Future<ImageModel> _config_result;
  Future<NowPlaying> _now_playing_result;
  Future<PopularTv> _popular_tv_results;
  @override
  void initState() {
    _now_playing_result = API_manager().get_now_playing();
    _top_rated_result = API_manager().get_top_rated();
    _trending_result = API_manager().get_trending();
    _popular_tv_results = API_manager().get_popular_tv();
    _upcoming_movies_result = API_manager().get_upcoming_movies();
    _config_result = API_manager().get_config().then((value) {
      base_url = value.images.baseUrl;
    });
    super.initState();
  }

  Icon cus = Icon(
    Icons.search,
    size: 30.0,
    color: Hexcolor('#f8de8d'),
  );
  Widget search = Text("POPCORN",
      style: TextStyle(
        color: Hexcolor('#f8de8d'),
        fontFamily: 'Bebas Neue',
        fontSize: 40,
      ));
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[600],
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Hexcolor('#f8de8d'),
            ),
            onPressed: () {}),
        title: Center(
          child: search,
        ),
        elevation: 20.0,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.fromLTRB(0.0, 4.0, 18.0, 0.0),
            // icon: Icon(
            //   Icons.search,
            //   size: 30.0,
            //   color: Colors.white,
            // ),
            onPressed: () {
              setState(() {
                if (this.cus.icon == Icons.search) {
                  this.cus = Icon(
                    Icons.cancel,
                    color: Hexcolor('#f8de8d'),
                  );
                  this.search = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      hintText: "Search A Movie",
                      hintStyle: TextStyle(
                        color: Hexcolor('#f8de8d'),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cus = Icon(
                    Icons.search,
                    color: Hexcolor('#f8de8d'),
                  );
                  this.search = Text("POPCORN",
                      style: TextStyle(
                        fontFamily: 'Bebas Neue',
                        fontSize: 40,
                        color: Hexcolor('#f8de8d'),
                      ));
                }
              });
            },
            icon: cus,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5, 10, 0, 3),
            child: Text(
              'Trending',
              style: TextStyle(
                // fontFamily: 'Bebas Neue',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: FutureBuilder<Trending>(
              future: _trending_result,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.results.length,
                      itemBuilder: (context, index) {
                        var _trending = snapshot.data.results[index];
                        print(_config_result);
                        return Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.network('http://image.tmdb.org/t/p/w154' +
                                  _trending.posterPath)
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(5, 10, 0, 3),
            child: Text(
              'Now Playing',
              style: TextStyle(
                // fontFamily: 'Bebas Neue',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: FutureBuilder<TopRated>(
              future: _top_rated_result,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.results.length,
                      itemBuilder: (context, index) {
                        var upcoming_movies = snapshot.data.results[index];
                        print(_config_result);
                        return Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.network('http://image.tmdb.org/t/p/w154' +
                                  upcoming_movies.posterPath)
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // FutureBuilder<UpcomingMovies>(
          //   future: _upcoming_movies_result,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: snapshot.data.results.length,
          //           itemBuilder: (context, index) {
          //             var upcoming_movies = snapshot.data.results[index];
          //             print(_config_result);
          //             return Container(
          //               padding: EdgeInsets.all(10),
          //               alignment: Alignment.topCenter,
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: <Widget>[
          //                   Image.network('http://image.tmdb.org/t/p/w154' +
          //                       upcoming_movies.posterPath)
          //                 ],
          //               ),
          //             );
          //           });
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
