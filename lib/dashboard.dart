import 'package:flutter/material.dart';
import 'package:google_maps/polygon_Screen.dart';
import 'package:google_maps/polylines.dart';
import 'package:google_maps/user_current_location.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
        centerTitle: true,

      ),
      body:
      Padding(
        padding: const EdgeInsets.only(left: 90),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Polylines()));
              }, //This prop for beautiful expressions
              child: Text(
                  "Polyline"), // This child can be everything. I want to choose a beautiful Text Widget
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                minimumSize: Size(200, 100), //change size of this beautiful button
                // We can change style of this beautiful elevated button thanks to style prop
                primary: Colors.red, // we can set primary color
                onPrimary: Colors.white, // change color of child prop
                onSurface: Colors.blue, // surface color
                shadowColor: Colors
                    .grey, //shadow prop is a very nice prop for every button or card widgets.
                elevation: 5, // we can set elevation of this beautiful button
                side: BorderSide(
                    color: Colors.redAccent.shade400, //change border color
                    width: 2, //change border width
                    style: BorderStyle
                        .solid), // change border side of this beautiful button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), //change border radius of this beautiful button thanks to BorderRadius.circular function
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> PolygonScreen()));
              }, //This prop for beautiful expressions
              child: Text(
                  "Polygon"), // This child can be everything. I want to choose a beautiful Text Widget
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                minimumSize: Size(200, 100), //change size of this beautiful button
                // We can change style of this beautiful elevated button thanks to style prop
                primary: Colors.red, // we can set primary color
                onPrimary: Colors.white, // change color of child prop
                onSurface: Colors.blue, // surface color
                shadowColor: Colors
                    .grey, //shadow prop is a very nice prop for every button or card widgets.
                elevation: 5, // we can set elevation of this beautiful button
                side: BorderSide(
                    color: Colors.redAccent.shade400, //change border color
                    width: 2, //change border width
                    style: BorderStyle
                        .solid), // change border side of this beautiful button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), //change border radius of this beautiful button thanks to BorderRadius.circular function
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserCUrrentLocation()));
              }, //This prop for beautiful expressions
              child: Text(
                  "User Location"), // This child can be everything. I want to choose a beautiful Text Widget
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                minimumSize: Size(200, 100), //change size of this beautiful button
                // We can change style of this beautiful elevated button thanks to style prop
                primary: Colors.red, // we can set primary color
                onPrimary: Colors.white, // change color of child prop
                onSurface: Colors.blue, // surface color
                shadowColor: Colors
                    .grey, //shadow prop is a very nice prop for every button or card widgets.
                elevation: 5, // we can set elevation of this beautiful button
                side: BorderSide(
                    color: Colors.redAccent.shade400, //change border color
                    width: 2, //change border width
                    style: BorderStyle
                        .solid), // change border side of this beautiful button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), //change border radius of this beautiful button thanks to BorderRadius.circular function
                ),
                tapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
