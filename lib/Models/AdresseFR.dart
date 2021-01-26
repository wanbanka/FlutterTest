import 'Adresse.dart';

class AdresseFR extends Adresse {
  String codePostal;

  AdresseFR(this.codePostal, int numeroDeVoie, String nomDeLaVoie,
      String nomDeLaCommune)
      : super(numeroDeVoie, nomDeLaVoie, nomDeLaCommune);
}
