abstract class Singleton {
  Singleton._privateConstructor();
}

class SequenceGenerator extends Singleton {
  //private constructor
  SequenceGenerator._privateConstructor() : super._privateConstructor();

  static final SequenceGenerator _instance = SequenceGenerator._privateConstructor();

  factory SequenceGenerator() {
    return _instance;
  }

  int _counter = 0;

  int getNextNumber () {
    _counter ++;
    return _counter;
  }

  int getCurrentNumber (){
    return _counter;
  }
}