import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImageInput extends StatefulWidget {

  final Function onSelectedImage;
  ImageInput(this.onSelectedImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File _storedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takeImage() async {
    final pickedImage = await _picker.getImage(source: ImageSource.gallery,imageQuality:20);

    if(pickedImage == null){
      return;
    }
    setState(() {
      if(pickedImage != null){
        _storedImage = File(pickedImage.path);
      }
    });

    final imageName = path.basename(pickedImage.path);
    final appDirectory = await sysPath.getApplicationDocumentsDirectory();

    final savedImage = await _storedImage.copy("${appDirectory.path}/$imageName");
    widget.onSelectedImage(savedImage);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file( _storedImage,
            fit: BoxFit.cover,
            width: double.infinity,
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image),
              Text("No image"),
            ],
          ),
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takeImage,
            icon: Icon(Icons.camera),
            label: Text(
              "Take Image",
            ),
            splashColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
