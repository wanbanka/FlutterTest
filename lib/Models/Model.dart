class Model {
//Getter récupérant la variable counter
  static int get counter => _counter;
  static int _counter = 0;

  //Augmente la variable counter de 1 ++
  static int incrementCounter() => ++_counter;
}
