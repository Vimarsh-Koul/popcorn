import 'package:flutter/material.dart';

Icon cus = Icon(
  Icons.search,
  size: 30.0,
  color: Colors.white,
);
Widget search = Text("POPCORN",
    style: TextStyle(
      fontFamily: 'Bebas Neue',
      fontSize: 40,
    ));

// AppBar app_bar() {
//   return AppBar(
//     leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
//     title: Center(
//       child: search,
//       //     child: Text(
//       //     search,
//       //   style: TextStyle(
//       //     fontFamily: 'Bebas Neue',
//       //     fontSize: 40,

//       //   ),
//       // ),
//     ),
//     elevation: 20.0,
//     actions: <Widget>[
//       IconButton(
//         padding: EdgeInsets.fromLTRB(0.0, 4.0, 18.0, 0.0),
//         // icon: Icon(
//         //   Icons.search,
//         //   size: 30.0,
//         //   color: Colors.white,
//         // ),
//         onPressed: () {
          
//         },
//         icon: cus,
//       ),
//     ],
//   );
// }

// // class Search extends SearchDelegate<String>
// // {
// //   List<String> cities =[
// //     'panchkula',
// //   ];
// // }
// 

class app_bar extends StatefulWidget {
  @override
  _app_barState createState() => _app_barState();
}

class _app_barState extends State<app_bar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
    leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
    title: Center(
      child: search,
      //     child: Text(
      //     search,
      //   style: TextStyle(
      //     fontFamily: 'Bebas Neue',
      //     fontSize: 40,

      //   ),
      // ),
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
           
          });
        },
        icon: cus,
      ),
    ],
  );
  }
}