import 'dart:io';
import 'package:mvc_application/controller.dart' show ControllerMVC;
import '../Models/User.dart';
import 'package:image_picker/image_picker.dart' show ImageSource;
import '../Services/PhotoService.dart';

class Controller extends ControllerMVC {
//Singleton: instanciation d'un et un seul controlleur

  factory Controller() => _this ??= Controller._();

  static Controller _this;
  Controller._();

//Utilisateur stocké dans le controller

  User userLogged = User("Dimitri", "Antos", null);

  //Erreur potentielle au moment de charger une photo

  dynamic errorPicture = "";

  //Instanciation d'un photoService

  PhotoService photoService = PhotoService();

  //Appelle la méthode du photoService et modifie les propriétés en
  //conséquence.

  Future<void> retrievePicture(ImageSource imageSource) async {
    await photoService.retrievePicture(imageSource).then((picture) {
      userLogged.image = File(picture);
      errorPicture = "";
    }).catchError((error) {
      errorPicture = error;
      userLogged.image = null;
    });
  }
}
