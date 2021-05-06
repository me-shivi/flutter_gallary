import 'package:flutter/material.dart';
import './gallary_image.dart';
import './setting_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chandukaka Saraf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Jewellery Gallery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void selectSettingTab(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return SettingImage();
      }
    ));
  }

  void selectGallaryTab(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return GallaryImage();
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Chandukaka Saraf & Sons Pvt. Ltd.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Jewellery Gallary',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                selectSettingTab(context);
              },
            ),
            ListTile(
              title: Text(
                'Gallary Page',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                selectGallaryTab(context);
              }
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/logo.jpg"),
              ),
              SizedBox(height: 30),
              Text(
                "Chandukaka Saraf & Sons Pvt. Ltd.",
                style: TextStyle(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text("Jewellery Gallary",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
