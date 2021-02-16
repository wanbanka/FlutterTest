import 'package:image_picker/image_picker.dart';

//Service gérant le chargement d'une photo/image

class PhotoService {
//Récupère une image soit de la galerie, soit de la caméra. Retourne
//le chemin de cette photo, ou une erreur s'il n'y a pas de chargement.

  Future<dynamic> retrievePicture(ImageSource imageSource) async {
    ImagePicker imagePicker = ImagePicker();

    try {
      final pickedFile = await imagePicker.getImage(source: imageSource);
      return Future.value(pickedFile.path);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
