import 'package:flutter/cupertino.dart';

import '../../modals/theme_modal.dart';

class ThemeProvider extends ChangeNotifier {
  // ThemeModal themeModal = ThemeModal(isDark: false);
  ValueNotifier<bool> isDark = ValueNotifier(false);
  void changeTheme() {
    // themeModal.isDark = !themeModal.isDark;
    // notifyListeners();
    isDark.value = !isDark.value;
  }
}
