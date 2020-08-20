import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

// function to return the items
  Widget items(var icon, var text, var page){
    return Expanded(
          child: GestureDetector(
            onTap: (){
              if(page != null){
                Navigator.pushNamed(context, page);
              }
            },
            child: Container(
                  height: 10.0,
                  margin: EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ).copyWith(bottom: 30.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        size: 30.0,
                        color: Theme.of(context).primaryColor
                      ),
                      SizedBox(width: 10.0,),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).primaryColor
                        ),
                        ),
                        Spacer(),
                        Icon(
                        LineAwesomeIcons.angle_right,
                        size: 20.0,
                        color: Theme.of(context).primaryColor
                      ),
                    ],
                  ),
                  ),
          ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final textStyleTop=TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).primaryColor
  );

  final textStyleStat=TextStyle(
    fontSize: 15.0,
    color: Theme.of(context).primaryColor
  );

    var info = Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 125.0,
                            width: 125.0,
                            margin: EdgeInsets.only(top:30),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('assets/images/img1.jpg'),
                            ),
                          ),
                          SizedBox(height:15.0),
                          Text(
                            'Tomy Stark',
                            style: GoogleFonts.pacifico(
                              textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 25.0,
                                letterSpacing: .5
                                ),
                              ),
                            ),
                          SizedBox(height:5.0),
                          Text(
                            'tony.ironman@gmail.com',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                                letterSpacing: .5
                                ),
                             ),
                            ),
                          SizedBox(height: 15.0,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            '10',
                            style: textStyleTop,
                          ),
                          Text(
                            'Purchased',
                            style: textStyleStat,
                          )
                        ]
                      ),
                      Text(
                            "\u007c",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                      Column(
                        children: <Widget>[
                          Text(
                            '20',
                            style: textStyleTop,
                          ),
                          Text(
                            'Wish List',
                            style: textStyleStat,
                          )
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
      
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: IconButton(
                        icon: Icon(LineAwesomeIcons.arrow_left, color: Theme.of(context).primaryColor),
                        onPressed: (){}
                        ),
                    ),
                    info,  //Extracted local variable
                Padding(
                  padding: const EdgeInsets.only(right:10.0),
                  child: IconButton(
                    icon: Icon(LineAwesomeIcons.moon, color: Theme.of(context).primaryColor),
                    onPressed: (){},
                    ),
                ),
              ],
            ),
            SizedBox(height: 40.0),
            items(LineAwesomeIcons.shopping_cart, 'Wish List', '/wish_list'),
            items(LineAwesomeIcons.history, 'Purchase History', '/purchase_history'),
            items(LineAwesomeIcons.cog, 'Settings','/settings'),
            items(LineAwesomeIcons.alternate_sign_out, 'Logout',''),
          ]
      ),
    ),
    );
  }
}