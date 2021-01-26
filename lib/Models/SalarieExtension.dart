import 'Salarie.dart';

extension SalarieExtension on Salarie {
  double convertirSalaireEnDollars() {
    return this.salaire * 1.11;
  }
}
