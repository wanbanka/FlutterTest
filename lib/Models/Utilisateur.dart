import 'Personne.dart';
import 'Profession.dart';
import 'Adresse.dart';

class Utilisateur extends Personne with Profession {
  String _login;
  String _motDePasse;

  Utilisateur(String prenom, Adresse adresse, this._login, this._motDePasse)
      : super(prenom, adresse);

  String get login => this._login;

  String get motdepasse => this._motDePasse;
}
