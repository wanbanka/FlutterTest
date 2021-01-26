import 'Adresse.dart';

class AdresseUS extends Adresse {
  String zipCode;
  String etat;

  AdresseUS(this.zipCode, this.etat, int numeroDeVoie, String nomDeLaVoie,
      String nomDeLaCommune)
      : super(numeroDeVoie, nomDeLaVoie, nomDeLaCommune);
}
