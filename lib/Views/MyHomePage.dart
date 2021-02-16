import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show StateMVC;
import '../Controllers/Controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

//Page d'accueil

class MyHomePage extends StatefulWidget {
  final String title = 'Flutter Demo Home Page';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends StateMVC<MyHomePage> {
//Instanciation d'un controlleur permettant de récupérer logique et variables

  _MyHomePageState() : super(Controller()) {
    con = controller;
  }

//Controlleur à utiliser pour la page d'accueil

  Controller con;

  //Widget affichant l'image, ou l'erreur de chargement, ou aucune image

  Widget _visualiserImage() {
    if (con.userLogged.image != null) {
      return Image.file(con.userLogged.image);
    } else if (con.errorPicture != "") {
      return Text(
        "Erreur de récupération d'image: ${con.errorPicture}",
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        "Aucune image",
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "${con.userLogged.prenom} ${con.userLogged.nom}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[300],
                  fontSize: 40.0),
            ),
            _visualiserImage()
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () async {
                //Récupère une image de la galerie
                await con.retrievePicture(ImageSource.gallery).then((nothing) {
                  setState(() {
                    _visualiserImage();
                  });
                });
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.photo_library),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: () async {
                //Récupère une image prise par la caméra

                await con.retrievePicture(ImageSource.camera).then((nothing) {
                  setState(() {
                    _visualiserImage();
                  });
                });
              },
              backgroundColor: Colors.green[800],
              child: const Icon(Icons.photo_camera),
            ),
          ),
          con.userLogged.image != null
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      //Appel de la fonction de cropping

                      File croppedFile = await ImageCropper.cropImage(
                          //Chemin de l'image à traiter
                          sourcePath: con.userLogged.image.path,
                          //Presets de cropping
                          aspectRatioPresets: [
                            CropAspectRatioPreset.square,
                            CropAspectRatioPreset.ratio3x2,
                            CropAspectRatioPreset.original,
                            CropAspectRatioPreset.ratio4x3,
                            CropAspectRatioPreset.ratio16x9
                          ],
                          //Modifications de la page de cropping sous Android
                          androidUiSettings: AndroidUiSettings(
                              toolbarTitle: 'Cropper',
                              toolbarColor: Colors.deepOrange,
                              toolbarWidgetColor: Colors.white,
                              initAspectRatio: CropAspectRatioPreset.original,
                              lockAspectRatio: false),
                          //Modifications de la page de cropping sous IOS
                          iosUiSettings:
                              IOSUiSettings(minimumAspectRatio: 1.0));

                      //Modification de l'image de l'utilisateur

                      setState(() {
                        con.userLogged.image = File(croppedFile.path);
                        _visualiserImage();
                      });
                    },
                    backgroundColor: Colors.green[800],
                    child: const Icon(Icons.photo_size_select_large),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(0.0),
                )
        ],
      ),
    );
  }
}
