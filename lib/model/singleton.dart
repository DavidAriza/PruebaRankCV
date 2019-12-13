class Singleton {
  static final Singleton _appData = new Singleton._internal();
  
  String text;
  factory Singleton() {
    return _appData;
  }
  Singleton._internal();
}
final appData = Singleton();