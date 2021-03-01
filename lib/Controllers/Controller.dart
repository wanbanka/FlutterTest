import 'package:mvc_application/controller.dart' show ControllerMVC;

class Controller extends ControllerMVC {
//Singleton: instanciation d'un et un seul controlleur

  factory Controller() => _this ??= Controller._();

  static Controller _this;
  Controller._();
}
