import 'package:final_eval/models/cart.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {

  int _counter = 0 ;
  int get counter => _counter;

  double _totalPrice = 0.0 ;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart ;
  Future<List<Cart>> get cart => _cart ;

  Future<List<Cart>> getData () async {
    return _cart ;
  }

  void addTotalPrice (double productPrice){
    _totalPrice = _totalPrice +productPrice ;
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    _totalPrice = _totalPrice  - productPrice ;
    notifyListeners();
  }

  double getTotalPrice (){
    return  _totalPrice ;
  }

  void addCounter (){
    _counter++;
    notifyListeners();
  }

  void removerCounter (){
    _counter--;
    notifyListeners();
  }

  int getCounter (){
    return  _counter ;
  }
}