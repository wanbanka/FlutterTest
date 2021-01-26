import 'Personne.dart';
import 'Adresse.dart';

class Salarie extends Personne {
  int salaire;

  Salarie(String prenom, Adresse adresse, this.salaire)
      : super(prenom, adresse);
}
