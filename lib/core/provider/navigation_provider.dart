import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(BuildContext content, int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void navigateToPage(BuildContext context, int index){
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/search');
        break; 
      case 2:
        Navigator.pushReplacementNamed(context, '/favorite');
        break; 
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
      default:
    }
  }
}
