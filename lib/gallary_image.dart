import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';

class GallaryImage extends StatefulWidget {
  GallaryImage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GallaryImageState createState() => _GallaryImageState();
}

class _GallaryImageState extends State<GallaryImage> {

  List<Asset> images = <Asset>[];

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        // materialOptions: MaterialOptions(
        //   actionBarColor: "#abcdef",
        //   actionBarTitle: "Example App",
        //   allViewTitle: "All Photos",
        //   useDetailsView: false,
        //   selectCircleStrokeColor: "#000000",
        // ),
      );
    } on Exception catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallary Page"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  crossAxisCount: 5,
                  children: List.generate(images.length, (index) {
                    Asset asset = images[index];
                    return AssetThumb(
                      asset: asset,
                      width: 200,
                      height: 200,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: loadAssets,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}