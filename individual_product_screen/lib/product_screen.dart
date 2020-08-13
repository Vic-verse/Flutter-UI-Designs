import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  bool isLiked=false;
  bool isStared=false;

  //--------------------Available size btn values----------------------------//
  bool isbt1=false;
  bool isbt2=false;
  bool isbt3=false;
  bool isbt4=false;

  //-----------------Available Color Button values----------------------------//
  bool isc1= false;
  bool isc2= false;
  bool isc3= false;
  bool isc4= false;

//-----------------------------------------------------Available Size function-----------------------------//
  Widget availableSize(String text, {String btn}){
    bool isSelected=false;
    if(btn=="bt1"){
      isSelected= isbt1;
    }
    else if(btn=="bt2"){
      isSelected= isbt2;
    }
    else if(btn=="bt3"){
      isSelected= isbt3;
    }
    else if(btn=="bt4"){
      isSelected= isbt4;
    }
  
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: MaterialButton(
          minWidth: 1.0,
          color: isSelected ? Colors.orange : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
              style: !isSelected ? BorderStyle.solid : BorderStyle.none,
              color: Colors.grey,
              )
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: isSelected ? Colors.white : Colors.black,
              ),
          ),
          onPressed: (){
            setState(() {
              if(btn=="bt1"){
                isbt1= !isSelected;
                if(isSelected == false){
                  isbt2= isSelected;
                  isbt3= isSelected;
                  isbt4= isSelected;
                }
              }
              else if(btn=="bt2"){
                isbt2= !isSelected;
                if(isSelected == false){
                  isbt1= isSelected;
                  isbt3= isSelected;
                  isbt4= isSelected;
                }
              }
              else if(btn=="bt3"){
                isbt3= !isSelected;
                if(isSelected == false){
                  isbt2= isSelected;
                  isbt1= isSelected;
                  isbt4= isSelected;
                }
              }
              else if(btn=="bt4"){
                isbt4= !isSelected;
                if(isSelected == false){
                  isbt2= isSelected;
                  isbt3= isSelected;
                  isbt1= isSelected;
                }
              }
            });
          }
          ),
      ),
    );
  }

  //-----------------------------------------------------Available color function-----------------------------//

  Widget availableColor(Color color, {String btn}) {
    bool isSelected= false;
    if(btn=="bt1"){
      isSelected= isc1;
    }
    else if(btn=="bt2"){
      isSelected= isc2;
    }
    else if(btn=="bt3"){
      isSelected= isc3;
    }
    else if(btn=="bt4"){
      isSelected= isc4;
    }
    return GestureDetector(
      onTap: (){
        setState(() {
              if(btn=="bt1"){
                isc1= !isSelected;
                if(isSelected == false){
                  isc2= isSelected;
                  isc3= isSelected;
                  isc4= isSelected;
                }
              }
              else if(btn=="bt2"){
                isc2= !isSelected;
                if(isSelected == false){
                  isc1= isSelected;
                  isc3= isSelected;
                  isc4= isSelected;
                }
              }
              else if(btn=="bt3"){
                isc3= !isSelected;
                if(isSelected == false){
                  isc2= isSelected;
                  isc1= isSelected;
                  isc4= isSelected;
                }
              }
              else if(btn=="bt4"){
                isc4= !isSelected;
                if(isSelected == false){
                  isc2= isSelected;
                  isc3= isSelected;
                  isc1= isSelected;
                }
              }
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: color.withAlpha(150),
          child: isSelected ? Icon(Icons.check_circle,color: color, size: 30,) : CircleAvatar(radius: 18, backgroundColor: color),
          
        ),
      ),
    );
  }

  //------------------------------------------Review Widget-----------------------------//
  Widget review(String img, double per, {bool istrue= false}){
    return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    img,
                    height: istrue ? 40.0 : 50.0,
                    width: istrue ? 40.0 : 50.0,
                    ),
                    Spacer(),
                   LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 110,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2000,
                      percent: per,
                      center: Text('${per*100} %'),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: Colors.green,
                    ),
                ],
              ),
            );
  }

  //--------------------------------------Reaction------------------------------//
  reaction(BuildContext context){
     AlertDialog alert = AlertDialog(
       shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.blue),
            ),
        title: Center(
          child: Text(
            "Reaction",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),
        ),
        content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button('assets/images/wow.gif'),
                  button('assets/images/happy.gif'),
                  button('assets/images/neutral.gif'),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button('assets/images/disappointed.gif', istrue: true),
                  button('assets/images/angry.gif'),
                ],
              )
            ],
          ),
      );
      showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        },
        );
  }

  String reactionImage="assets/images/star.png";

  Widget button(String img,{bool istrue: false}){
    return Expanded(
      child: MaterialButton(
        minWidth: 0,
        onPressed: () {
          setState(() {
            reactionImage=img;
            Navigator.of(context).pop(); 
          });
        },
        child: Image.asset(
          img, 
          height: istrue ? 40.0 : 50.0,
          width: istrue ? 40.0 : 50.0,
          ),
        ),
    );
  }

  //-------------------------------------Carousel Items--------------------------------//
  List<String> images=[
    'assets/images/product1.jpg',
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
    'assets/images/product4.jpg',
    'assets/images/product5.jpg',
    'assets/images/product6.jpg',
  ];

//-------------------------------main-------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
             Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(LineAwesomeIcons.angle_left), 
                  iconSize: 40.0,
                  onPressed: (){}
                  ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.favorite), 
                  iconSize: 50.0,
                  color: isLiked?Colors.red:Colors.grey,
                  onPressed: (){
                    setState(() {
                      isLiked= !isLiked;
                    });
                   }
                 ),
               )
            ],
            ),
//----------------------------------------Carousel Slider--------------------------------------------//
            Padding(
              padding: const EdgeInsets.only(top:80.0, left:40, right: 40),
              child: CarouselSlider.builder(
                itemCount: 6, 
                itemBuilder: (BuildContext context, int itemIndex) => Container(
                  // width: MediaQuery.of(context).physicalDepth,
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(images[itemIndex]),
                      fit: BoxFit.cover,
                      ),
              ),
                ), 
                options: CarouselOptions(
                  aspectRatio: 16/9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                )
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270.0, left:20.0, right: 20.0),
              child: Expanded(
                child: Container(
                  // width: MediaQuery.of(context).physicalDepth,
                  height: 280.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child:ListView(
                    children:<Widget>[

//--------------------------------------name, amount, star----------------------------//
                     Align(
                      alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Nike Air Max',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                fontStyle: FontStyle.italic,
                              ),
                              ),
                            Spacer(flex: 3),
                            Text(
                              "220",
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              ),
                            Text(
                              "\$",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15.0,
                              ),
                              ),
                            Spacer(flex: 1),
                            MaterialButton(
                                // minWidth: 0,
                                onPressed: () {
                                  setState(() {
                                    reaction(context);
                                  });  
                                },
                                child: Image.asset(
                                  reactionImage,
                                  height: (reactionImage=="assets/images/disappointed.gif") ? 40.0 : 50.0,
                                  width: (reactionImage=="assets/images/disappointed.gif") ? 40.0 : 50.0,
                                ),
                              ),
                          ],
                        ),
                    ),

//------------------------------Available Sizes---------------------------------//
                    SizedBox(height:20.0),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text(
                        'Available Sizes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                        ),
                    ),
                    SizedBox(height:10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        availableSize("UK 7", btn: "bt1"),
                        availableSize("UK 8", btn: "bt2"),
                        availableSize("UK 9", btn: "bt3"),
                        availableSize("UK 10", btn: "bt4"),
                      ],
                    ),
//----------------------------Available Colors --------------------------------------//
                    SizedBox(height:20.0),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text(
                        'Available Colors',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                        ),
                    ),
                    SizedBox(height:10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        availableColor(Colors.black, btn: "bt1"),
                        availableColor(Colors.blue, btn: "bt2"),
                        availableColor(Colors.purple, btn: "bt3"),
                        availableColor(Colors.orange, btn: "bt4"),
                      ],
                    ),
//--------------------------------------Description------------------------------------//
                    SizedBox(height:20.0),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                        ),
                    ),
                    SizedBox(height:10.0),
                    Expanded(
                      child: Text(
                        "Nike Air Max Motion 2 men's Shoe THE LOOK AND FEEL OF AIR. Taking inspiration from the Air Max 270, the Nike Air Max Motion 2 blends a breathable mesh upper with no-sew overlays for heritage style. A large, U-shaped Max Air unit provides all-day comfort, while the heel clip delivers maxed-out visual impact and cushioning. U-shaped Max Air unit provides visual impact and a cushioned underfoot feel. Breathable mesh upper with no-sew skins for enhanced durability. Large TPU heel clip draws inspiration from the Air Max 270. Outsole features rubber in the heel for enhanced durability and Injected Unit (IU) foam in the forefoot for a soft feel. Thin, low-profile tongue and traditional lacing secure the fit.",
                        style: TextStyle(
                          fontSize: 15.0
                        ),
                      ),
                      ),
//--------------------------------------------Review--------------------------------------//
                    SizedBox(height:20.0),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: Text(
                        'Review',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                        ),
                    ),
                    SizedBox(height:10.0),
                    review("assets/images/wow.gif", 0.7),
                    review("assets/images/happy.gif", 0.15),
                    review("assets/images/neutral.gif", 0.04),
                    review("assets/images/disappointed.gif", 0.05, istrue: true),
                    review("assets/images/angry.gif", 0.06),
                    ],
                  ),
                ),
              ),
            ),
//--------------------------------------Buttons----------------------------//
            Align(
              alignment: Alignment.bottomLeft,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: Colors.blue,
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        onPressed:(){}
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        color: Colors.blue,
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        onPressed:(){}
                        ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
        ),
    );
  }
}