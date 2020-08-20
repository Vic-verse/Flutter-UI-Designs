import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: deprecated_member_use
import 'package:collection/iterable_zip.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {

    final List<String> images=[
      'assets/images/img2.jpg',
      'assets/images/img3.jpg',
      'assets/images/img4.jpg',
      'assets/images/img5.jpg',
      'assets/images/img6.jpg',
      'assets/images/img7.jpg',
      'assets/images/img8.jpg',
      'assets/images/img9.jpg',
    ];
    final List<String> names=[
      'scenery 1',
      'scenery 2',
      'Devil',
      'Nebula',
      'Aurora',
      'Fox',
      'Road',
      'Birds'
    ];

    // ignore: non_constant_identifier_names
    var icon_and_title = Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(LineAwesomeIcons.arrow_left, color: Theme.of(context).primaryColor),
                          onPressed: (){
                            Navigator.pop(context);
                          }
                          ),
                        Spacer(flex: 1),
                        Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: Text(
                              'Wish List',
                              style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 25.0,
                                              letterSpacing: .5
                                              ),
                                            ),
                                    ),
                              ),
                        Spacer(flex:2),
                      ],
                      )
      );

        return Scaffold(
          body: Container(
            color:Theme.of(context).accentColor,
            child: SafeArea(
              child: Stack(
                    children: <Widget>[
                        icon_and_title,
                        Container(
                          margin: EdgeInsets.only(top: 80.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0)
                            ),
                          ),
                        ),
                        Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top:100.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(20.0),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: IterableZip([images,names]).map((item) => Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: AssetImage(item[0]),
                                    fit: BoxFit.cover
                                    )
                                ),
                                child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child:Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                        borderRadius: BorderRadius.circular(20.0)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                              item[1],
                                              style: TextStyle(
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )).toList(),
                            ),
                        )
                        ),
                      ],
                    ),
            ),
          ),
    );
  }
}