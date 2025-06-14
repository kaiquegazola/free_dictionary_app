import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'tab_options.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  @observable
  int currentIndex = 0;

  TabOption get currentTab => TabOption.values[currentIndex];

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @observable
  Locale currentLocale = const Locale('en', 'US');

  @action
  void changeLocale(Locale locale) {
    currentLocale = locale;
  }
}
