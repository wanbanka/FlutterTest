import 'Adresse.dart';

class Personne<T extends Adresse> {
  String _prenom;

  T adresse;

  Personne(this._prenom, this.adresse);

  String get prenom => this._prenom;

  T getAdresse() {
    return this.adresse;
  }
}
