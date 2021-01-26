abstract class Adresse {
  int _numeroDeVoie;
  String _nomDeLaVoie;
  String _nomDeLaCommune;

  int get numeroDeVoie => _numeroDeVoie;

  set numeroDeVoie(int value) => _numeroDeVoie = value;

  String get nomDeLaVoie => _nomDeLaVoie;

  set nomDeLaVoie(String value) => _nomDeLaVoie = value;

  String get nomDeLaCommune => _nomDeLaCommune;

  set nomDeLaCommune(String value) => _nomDeLaCommune = value;

  Adresse(this._numeroDeVoie, this._nomDeLaVoie, this._nomDeLaCommune);
}
