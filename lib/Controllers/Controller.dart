import 'package:mvc_application/controller.dart' show ControllerMVC;
import '../Models/Model.dart';

class Controller extends ControllerMVC {
//Singleton: instanciation d'un et un seul controlleur

  factory Controller() => _this ??= Controller._();

  static Controller _this;
  Controller._();

//Récupération de la propriété counter du modèle Model
  int get counter => Model.counter;

  //Appel de la méthode incrementCounter du modèle Model
  void incrementCounter() => Model.incrementCounter();
}
