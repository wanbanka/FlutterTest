import 'package:appMVC/Models/Adresse.dart';
import 'package:mvc_application/controller.dart' show ControllerMVC;
import '../Models/Model.dart';
import '../Models/Personne.dart';
import '../Models/SalarieExtension.dart';
import '../Models/AdresseFR.dart';
import '../Models/AdresseUS.dart';

class Controller extends ControllerMVC {
//Singleton: instanciation d'un et un seul controlleur

  factory Controller() => _this ??= Controller._();

  static Controller _this;
  Controller._();

  AdresseFR aFr = AdresseFR('44000', 110, "Rue de la Paix", "Nantes");

  AdresseUS aUs = AdresseUS('3302', 'CA', 150, "Hollywood", "Los Angeles");

//Récupération de la propriété counter du modèle Model
  int get counter => Model.counter;

  //Appel de la méthode incrementCounter du modèle Model
  void incrementCounter() => Model.incrementCounter();

  Adresse displayLogin() {
    Personne<AdresseFR> user = Personne("Denis", aFr);

    return user.getAdresse();
  }

  Adresse displayLogin2() {
    Personne<AdresseUS> user2 = Personne("Denis", aUs);

    return user2.getAdresse();
  }
}
