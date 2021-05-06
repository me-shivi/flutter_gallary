import 'package:flutter/material.dart';

class SettingImage extends StatefulWidget {
  SettingImage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingImageState createState() => _SettingImageState();
}

class _SettingImageState extends State<SettingImage> {

  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    "Choose Path of image folder:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ListTile(  
                  title: const Text('Internal Storage'),  
                  leading: Radio(  
                    value: 0,  
                    groupValue: _radioValue,  
                    onChanged: _handleRadioValueChange,
                  ),  
                ),
                ListTile(  
                  title: const Text('Memory Card'),  
                  leading: Radio(  
                    value: 1,  
                    groupValue: _radioValue,  
                    onChanged: _handleRadioValueChange,
                  ),  
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {}, 
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}