import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  //--------------------------Language---------------------//
  List<String> language=[
    'English',
    'Hindi'
  ];
  var currentLang='English';

  //-------------------Country-----------------------------//
  List<String> country=[
    'India', 'United States', 'United Kingdom', 'Canada', 'France', 'Japan'
  ];
  var currentCon='India';

  //------------------------Notifications--------------------//
  // ignore: non_constant_identifier_names
  bool isSwitched_sh= false;
   // ignore: non_constant_identifier_names
  bool isSwitched_ph= false;

  //------------------------Address-------------------------//
  TextEditingController _textFieldController = TextEditingController();
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
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
                              'Settings',
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
                        Padding(
                          padding: const EdgeInsets.only(top:120.0),
                          child: ListView(
                            children: <Widget>[
                            Expanded(
                                                          child: Container(
                                    height: 70.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ).copyWith(bottom: 20.0),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey,
                                    ),
                                    child: Row(
                                              children: <Widget>[
                                                SizedBox(width: 10.0,),
                                                Text(
                                                      'Language',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Theme.of(context).primaryColor
                                                      ),
                                                    ),
                                                Spacer(flex: 2),
                                                Container(
                                                  padding: EdgeInsets.only(left:7.0, right: 2.0),
                                                  decoration: BoxDecoration(
                                                                  color: Theme.of(context).primaryColor,
                                                                  borderRadius: BorderRadius.circular(15)
                                                                ), 
                                                child: DropdownButton(
                                                  iconEnabledColor: Colors.white,
                                                  dropdownColor: Theme.of(context).primaryColor,
                                                  elevation: 0,
                                                  items: language.map((lang) {
                                                    return DropdownMenuItem(
                                                      value: lang,
                                                      child: Text(lang, style: TextStyle(color: Colors.white),),
                                                      );
                                                  }).toList(), 
                                                  onChanged: (String newLang){
                                                    setState(() {
                                                      this.currentLang= newLang;
                                                    });
                                                  },
                                                  value: currentLang,
                                                ),
                                                  ),
                                                Spacer(flex: 1),
                                              ],
                                            ),
                                  ),
                            ),

  //----------------------------------Country------------------------------------------------//

                                Expanded(
                                                                  child: Container(
                                    height: 70.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ).copyWith(bottom: 20.0),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey,
                                    ),
                                    child: Row(
                                              children: <Widget>[
                                                SizedBox(width: 10.0,),
                                                Text(
                                                      'Country',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Theme.of(context).primaryColor
                                                      ),
                                                    ),
                                                Spacer(flex: 2),
                                                Container(
                                                  padding: EdgeInsets.only(left:7.0, right: 2.0),
                                                  decoration: BoxDecoration(
                                                                  color: Theme.of(context).primaryColor,
                                                                  borderRadius: BorderRadius.circular(15)
                                                                ), 
                                                child: DropdownButton(
                                                  iconEnabledColor: Colors.white,
                                                  dropdownColor: Theme.of(context).primaryColor,
                                                  elevation: 0,
                                                  items: country.map((con) {
                                                    return DropdownMenuItem(
                                                      value: con,
                                                      child: Text(con, style: TextStyle(color: Colors.white),),
                                                      );
                                                  }).toList(), 
                                                  onChanged: (String newCon){
                                                    setState(() {
                                                      this.currentCon= newCon;
                                                    });
                                                  },
                                                  value: currentCon,
                                                ),
                                                  ),
                                                Spacer(flex: 1),
                                              ],
                                            ),
                                  ),
                                ),

//-------------------------------Notification-----------------------------//
                                Expanded(
                                                                  child: Container(
                                    height: 60.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ).copyWith(bottom: 20.0),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey,
                                    ),
                                    child: Row(
                                              children: <Widget>[
                                                SizedBox(width: 10.0,),
                                                Text(
                                                      'Shipping Notifications',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Theme.of(context).primaryColor
                                                      ),
                                                    ),
                                                Spacer(flex: 2),
                                                Switch(
                                                  value: isSwitched_sh, 
                                                  onChanged: (value){
                                                    setState(() {
                                                      isSwitched_sh=value;
                                                    });
                                                  },
                                                  activeTrackColor: Colors.blueGrey,
                                                  activeColor: Theme.of(context).accentColor,
                                                  inactiveThumbColor: Theme.of(context).primaryColor,
                                                  inactiveTrackColor: Colors.blueGrey,
                                                  ),
                                                Spacer(flex: 1),
                                              ],
                                            ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 60.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ).copyWith(bottom: 20.0),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey,
                                    ),
                                    child: Row(
                                              children: <Widget>[
                                                SizedBox(width: 10.0,),
                                                Text(
                                                      'Personalized Notifications',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Theme.of(context).primaryColor
                                                      ),
                                                    ),
                                                Spacer(flex: 2),
                                                Switch(
                                                  value: isSwitched_ph, 
                                                  onChanged: (value){
                                                    setState(() {
                                                      isSwitched_ph=value;
                                                    });
                                                  },
                                                  activeTrackColor: Colors.blueGrey,
                                                  activeColor: Theme.of(context).accentColor,
                                                  inactiveThumbColor: Theme.of(context).primaryColor,
                                                  inactiveTrackColor: Colors.blueGrey,
                                                  ),
                                                Spacer(flex: 1),
                                              ],
                                            ),
                                  ),
                                ),

//-------------------------------Address--------------------------------//
                                Expanded(
                                                                  child: Container(
                                    height: 210.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ).copyWith(bottom: 20.0),
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey,
                                    ),
                                    child: Column(
                                              children: <Widget>[
                                                SizedBox(height: 10.0,),
                                                Text(
                                                      'Default Address',
                                                      style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Theme.of(context).primaryColor
                                                      ),
                                                    ),
                                                Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20.0)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: TextField(
                                                        controller: _textFieldController,
                                                        enabled: _isEnabled,
                                                        keyboardType: TextInputType.multiline,
                                                        maxLines: null,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          hintText: 'Type your address here',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                 MaterialButton(
                                                      color: Theme.of(context).accentColor,
                                                      textColor: Colors.white,
                                                      splashColor: Colors.green,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(15.0)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(_isEnabled ? "Save" : "Edit"),
                                                      ),
                                                      onPressed: () => setState(() => _isEnabled = !_isEnabled),
                                                    ),
                                              ],
                                            ),
                                  ),
                                ),

//--------------------------------------------About-------------------------------------//
                              Expanded(
                              child: GestureDetector(
                                onTap: (){
                                    Navigator.pushNamed(context, '/about');
                                },
                               child: Container(
                                    height: 50.0,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                    ).copyWith(bottom: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.grey,
                                    ),
                                    child:Row(
                                        children: <Widget>[
                                    SizedBox(width: 10.0,),
                                            Text(
                                                  'About',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Theme.of(context).primaryColor
                                        ),
                                                ),
                                            Spacer(),
                                            Icon(
                                            LineAwesomeIcons.angle_right,
                                            size: 30.0,
                                            color: Theme.of(context).primaryColor
                                          ),
                                        ],
                                      ),
                                      ),
                                    ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
  }
}