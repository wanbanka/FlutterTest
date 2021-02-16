import 'dart:io';

//Exemple de classe utilisateur

class User {
  String _nom;
  String _prenom;
  File _image;
  File get image => _image;

  set image(File value) => _image = value;

  String get nom => _nom;

  set nom(String value) => _nom = value;

  String get prenom => _prenom;

  set prenom(String value) => _prenom = value;

  User(this._prenom, this._nom, this._image);
}
