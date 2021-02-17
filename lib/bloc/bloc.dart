import 'package:get/get.dart';

part 'home.dart';

abstract class Bloc {
  void init();
  void dispose();
}

class StateController<T> extends GetxController {
  StateController(this._value);
  
  T _value;

  set value(T newValue) {
    if (newValue != _value) {
      _value = newValue;
    }
    update();
  }

  T get value => _value;
}