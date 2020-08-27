import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// ignore: deprecated_member_use
import 'package:collection/iterable_zip.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Duration _duration = Duration(milliseconds: 500);
  Tween<Offset> _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
  }
//------------------------Colors for container-----------------------//
  Color ccolor1=Colors.white;
  Color tcolor1=Colors.black;
  Color ccolor2=Colors.white;
  Color tcolor2=Colors.black;
  Color ccolor3=Colors.white;
  Color tcolor3=Colors.black;
  Color ccolor4=Colors.white;
  Color tcolor4=Colors.black;
  Color ccolor5=Colors.white;
  Color tcolor5=Colors.black;
  
  //---------------------------------------------main widget function-----------------------//
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
    
//-----------------------------Item function------------------------//
    Widget items(String image, String text){
      return Card(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(image),
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
                              text,
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
        );
    }

    //----------------------------------TextArea------------------------------------//
     TextEditingController textController;
     String text='Pictures';
     
    // ignore: non_constant_identifier_names
    var iconAndTitle = Expanded(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                hintText: 'Search',
              ),
              onSubmitted: (txt) {
                setState(() {
                  text = txt;
                });
              },
            ),
          )       
      );
//-------------------------------Container ---------------------------------//
// ignore: non_constant_identifier_names
void change_to_normal(String opt){
  if(opt=='opt1'){
    ccolor2=ccolor3=ccolor4=ccolor5=Colors.white;
    tcolor2=tcolor3=tcolor4=tcolor5=Colors.black;
  }
  else if(opt=='opt2'){
    ccolor1=ccolor3=ccolor4=ccolor5=Colors.white;
    tcolor1=tcolor3=tcolor4=tcolor5=Colors.black;
  }
  else if(opt=='opt3'){
    ccolor2=ccolor1=ccolor4=ccolor5=Colors.white;
    tcolor2=tcolor1=tcolor4=tcolor5=Colors.black;
  }
  else if(opt=='opt4'){
    ccolor2=ccolor3=ccolor1=ccolor5=Colors.white;
    tcolor2=tcolor3=tcolor1=tcolor5=Colors.black;
  }
  else if(opt=='opt5'){
    ccolor2=ccolor3=ccolor4=ccolor1=Colors.white;
    tcolor2=tcolor3=tcolor4=tcolor1=Colors.black;
  }
}

Widget sortby(String text, String opt){
  Color ccolor, tcolor;
  switch(opt){
    case 'opt1': ccolor=ccolor1; tcolor= tcolor1; break;
    case 'opt2': ccolor=ccolor2; tcolor= tcolor2; break;
    case 'opt3': ccolor=ccolor3; tcolor= tcolor3; break;
    case 'opt4': ccolor=ccolor4; tcolor= tcolor4; break;
    case 'opt5': ccolor=ccolor5; tcolor= tcolor5; break;
  }
  return Container(
          width: MediaQuery.of(context).size.width,
          height: 50.0,
          decoration: BoxDecoration(
            color: ccolor,
            border: Border(top: BorderSide(width: 2.0))
          ),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: tcolor,
                  ),
                  ),
              ),
            ),
            onTap: (){
              setState(() {
                switch(opt){
                  case 'opt1': ccolor1= Colors.yellow[800]; tcolor1= Theme.of(context).accentColor; change_to_normal('opt1'); break;
                  case 'opt2': ccolor2= Colors.yellow[800]; tcolor2= Theme.of(context).accentColor; change_to_normal('opt2'); break;
                  case 'opt3': ccolor3= Colors.yellow[800]; tcolor3= Theme.of(context).accentColor; change_to_normal('opt3'); break;
                  case 'opt4': ccolor4= Colors.yellow[800]; tcolor4= Theme.of(context).accentColor; change_to_normal('opt4'); break;
                  case 'opt5': ccolor5= Colors.yellow[800]; tcolor5= Theme.of(context).accentColor; change_to_normal('opt5'); break;
                }
              });
            },
          ),
        );
}
//--------------------------------------------Range Slider Values-----------------------------//
RangeValues values= RangeValues(500, 50000);
String text1='500', text2='50000';

//-----------------Available Color Button values----------------------------//
  bool isc1= false;   bool isc4= false;
  bool isc2= false;   bool isc5= false;
  bool isc3= false;   bool isc6= false;

//---------------Available Size-------------------------------//
bool isbt1=false;  bool isbt3=false;
bool isbt2=false;  bool isbt4=false;

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
    else if(btn=="bt5"){
      isSelected= isc5;
    }
    else if(btn=="bt6"){
      isSelected= isc6;
    }
    return GestureDetector(
      onTap: (){
        setState(() {
              if(btn=="bt1"){
                isc1= !isSelected;
                if(isSelected == false){
                  isc2= isSelected; isc3= isSelected; isc4= isSelected; isc5= isSelected; isc6= isSelected;
                }
              }
              else if(btn=="bt2"){
                isc2= !isSelected;
                if(isSelected == false){
                  isc1= isSelected; isc3= isSelected; isc4= isSelected; isc5= isSelected; isc6= isSelected;
                }
              }
              else if(btn=="bt3"){
                isc3= !isSelected;
                if(isSelected == false){
                  isc2= isSelected; isc1= isSelected; isc4= isSelected; isc5= isSelected; isc6= isSelected;
                }
              }
              else if(btn=="bt4"){
                isc4= !isSelected;
                if(isSelected == false){
                  isc2= isSelected; isc3= isSelected; isc1= isSelected; isc5= isSelected; isc6= isSelected;
                }
              }
              else if(btn=="bt5"){
                isc5= !isSelected;
                if(isSelected == false){
                  isc2= isSelected; isc3= isSelected; isc1= isSelected; isc4= isSelected; isc6= isSelected;
                }
              }
              else if(btn=="bt6"){
                isc6= !isSelected;
                if(isSelected == false){
                  isc2= isSelected; isc3= isSelected; isc1= isSelected; isc5= isSelected; isc4= isSelected;
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
  //--------------------------------Available Size-----------------------------//
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
        return Scaffold(
          floatingActionButton: GestureDetector(
              child: FloatingActionButton(
              child: Icon(
                LineAwesomeIcons.filter, 
                color: Theme.of(context).accentColor, 
                size: 30.0,
                ),
              elevation: 5,
              backgroundColor: Colors.yellow[800],
              foregroundColor: Colors.white,
              onPressed: () async {
                if (_controller.isDismissed)
                  _controller.forward();
                else if (_controller.isCompleted)
                  _controller.reverse();
              },
            ),
          ),
        body: Container(
          color: Theme.of(context).accentColor,
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  iconAndTitle,
                  Container(
                    margin: EdgeInsets.only(top: 120.0),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                          Padding(
                                padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  )
                              ),
                        Expanded(
                        child: GridView.count(
                            crossAxisCount: 2,
                            padding: const EdgeInsets.all(20.0),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: IterableZip([images,names]).map((item) => items(item[0], item[1])).toList(),
                            ),
                        ),
                      ],
                  ),
                  ),
                  SizedBox.expand(
                    child: SlideTransition(
                      position: _tween.animate(_controller),
                      child: DraggableScrollableSheet(
                        builder: (BuildContext context, ScrollController scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color:Theme.of(context).accentColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0)
                              ),
                            ),
                            child: ListView(
                              controller: scrollController,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:10.0),
                                  child: Center(
                                    child: Text(
                                      'Options',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
//-------------------options----------------------------//
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[900],
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ExpansionTile(
                                      backgroundColor: Colors.white,
                                      trailing: Icon(
                                        LineAwesomeIcons.filter,
                                        color: Colors.purple[800],
                                        size: 35.0,
                                      ),
                                      title:Padding(
                                        padding: const EdgeInsets.only(left:10.0),
                                        child: Text(
                                            'Filters',
                                            style: TextStyle(
                                              color: Colors.purple[800],
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                      ),
                                      children: <Widget>[
    //-------------------------Price Range--------------------------------------//
                                        Card(
                                          elevation: 10.0,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top:10.0),
                                                child: Text(
                                                  'Price Range',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8.0, left:10.0),
                                                    child: Text(text1),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 8.0, right:10.0),
                                                    child: Text(text2),
                                                  ),
                                                ],
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8.0, right: 10.0, left:10.0),
                                                child: RangeSlider(
                                                    min: 500,
                                                    max: 50000,
                                                    divisions: 100,
                                                    values: values, 
                                                    onChanged: (value){
                                                      setState(() {
                                                        values= value;
                                                        text1= value.start.toInt().toString();
                                                        text2= value.end.toInt().toString();
                                                      });
                                                    }
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
    //---------------------------Available Colors -----------------------------------//
                                        Card(
                                          elevation: 10.0,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top:10.0),
                                                child: Text(
                                                  'Colors',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
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
                                                  availableColor(Colors.red, btn: "bt5"),
                                                  availableColor(Colors.green, btn: "bt6"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
//------------------------Available Size------------------------------------//
                                       Card(
                                         elevation: 10.0,
                                         child: Column(
                                           children: [
                                             Padding(
                                                padding: const EdgeInsets.only(top:10.0),
                                                child: Text(
                                                  'Sizes',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height:10.0),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  availableSize("S", btn: "bt1"),
                                                  availableSize("M", btn: "bt2"),
                                                  availableSize("L", btn: "bt3"),
                                                  availableSize("XL", btn: "bt4"),
                                                ],
                                              ),
                                           ],
                                         ),
                                       ),
                                      ],
                                      ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0, right:20.0, bottom:20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[900],
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ExpansionTile(
                                      backgroundColor: Colors.white,
                                      trailing: Icon(
                                        LineAwesomeIcons.sort,
                                        color: Colors.purple[800],
                                        size: 35.0,
                                      ),
                                      title:Padding(
                                        padding: const EdgeInsets.only(left:10.0),
                                        child: Text(
                                            'Sort By',
                                            style: TextStyle(
                                              color: Colors.purple[800],
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                      ),
                                      children: [
                                        Column(
                                          children: [
                                             sortby('Popular', 'opt1'),
                                             sortby('Newest', 'opt2'),
                                             sortby('Coustomer Review', 'opt3'),
                                             sortby('Price: High to Low', 'opt4'),
                                             sortby('Price: Low to High', 'opt5'),
                                          ],
                                        ),
                                      ],
                                      ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0, right:20.0, bottom:20.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[900],
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: ExpansionTile(
                                      backgroundColor: Colors.white,
                                      trailing: Image.asset(
                                        'assets/images/brand.ico',
                                        color: Colors.purple[800],
                                        width: 35.0,
                                        height: 35.0,
                                        ),
                                      title:Padding(
                                        padding: const EdgeInsets.only(left:10.0),
                                        child: Text(
                                            'Brand',
                                            style: TextStyle(
                                              color: Colors.purple[800],
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                      ),
                                      children: [
                                        CheckboxGroup(
                                            labels: <String>[
                                              "Adidas",
                                              "Diesels",
                                              "Nike",
                                              "Louis Vuitton",
                                              "	Cartier",
                                            ],
                                            labelStyle: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold
                                            ),
                                            activeColor: Colors.yellow[800],
                                            checkColor: Theme.of(context).accentColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ),
      )
    );
  }
}