import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:popcorn/Models/trending.dart';
import 'package:popcorn/Services/api_manager.dart';
import 'package:popcorn/Widgets/appbar.dart';

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
  Future<Result> _trending_result;
  @override
  void initState() {
    _trending_result = API_manager().get_trending();
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
      body: FutureBuilder(
        future: _trending_result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(itemBuilder: (context, index) {
              return Text('Working');
            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
