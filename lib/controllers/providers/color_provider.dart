import 'package:color_palette_generator_app_flutter/modals/Global/globals.dart';
import 'package:color_palette_generator_app_flutter/modals/color_modal.dart';
import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  ColorModal colorModal = ColorModal(
    First_Color: 2,
    Secound_Color: 3,
    Third_Color: 6,
    Fourth_Color: 10,
    Fifth_Color: 23,
  );

  ChangeColor() {
    colorModal.First_Color = RR_Random.nextInt(allColors.length) + 1;
    colorModal.Secound_Color = RR_Random.nextInt(allColors.length) + 1;
    colorModal.Third_Color = RR_Random.nextInt(allColors.length) + 1;
    colorModal.Fourth_Color = RR_Random.nextInt(allColors.length) + 1;
    colorModal.Fifth_Color = RR_Random.nextInt(allColors.length) + 1;

    notifyListeners();
  }
}
