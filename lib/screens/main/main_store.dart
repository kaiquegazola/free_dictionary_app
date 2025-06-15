import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart' as l10n;
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

  Locale get currentLocale => l10n.currentLocale.value;

  @action
  void changeLocale(Locale locale) {
    l10n.changeLanguage(locale);
  }
}
