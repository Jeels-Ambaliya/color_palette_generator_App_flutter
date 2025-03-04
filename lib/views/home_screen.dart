// ignore_for_file: camel_case_types

import 'package:color_palette_generator_app_flutter/modals/Global/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/color_controller.dart';
import '../controllers/providers/color_provider.dart';
import '../controllers/providers/theme_provider.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  void initState() {
    loadData();
    allColors = convertToObject();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<ColorProvider>(context).changeColor();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Provider.of<ThemeProvider>(context, listen: false).isDark,
        builder: (context, isDark, _) {
          return Consumer<ColorProvider>(builder: (context, colorProvider, _) {
            return Scaffold(
              backgroundColor: isDark ? Colors.black : Colors.white,
              appBar: AppBar(
                backgroundColor: isDark ? Colors.black : Colors.white,
                title: Text(
                  'Colors Generator App',
                  style: GoogleFonts.caveat(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                      },
                      icon: Icon(
                        (Provider.of<ThemeProvider>(context, listen: false)
                                    .isDark
                                    .value ==
                                false)
                            ? Icons.sunny
                            : Icons.wb_sunny_outlined,
                        color: isDark ? Colors.white : Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: ValueListenableBuilder(
                    valueListenable: colorProvider.colorsList,
                    builder: (context, colorsList, _) {
                      return Column(
                        children: List.generate(
                            colorProvider.colorsList.value.length, (index) {
                          return Container(
                            height: 95,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(
                                hexColors(
                                  allColors[
                                          colorProvider.colorsList.value[index]]
                                      .hexColor,
                                ),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: index == 0
                                    ? const Radius.circular(20)
                                    : const Radius.circular(0),
                                topRight: index == 0
                                    ? const Radius.circular(20)
                                    : const Radius.circular(0),
                                bottomLeft: index ==
                                        (colorProvider.colorsList.value.length -
                                            1)
                                    ? const Radius.circular(20)
                                    : const Radius.circular(0),
                                bottomRight: index ==
                                        (colorProvider.colorsList.value.length -
                                            1)
                                    ? const Radius.circular(20)
                                    : const Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32, left: 20),
                              child: Text(
                                "#${Color(
                                  hexColors(
                                    allColors[colorProvider
                                            .colorsList.value[index]]
                                        .hexColor,
                                  ),
                                ).toString()[10]}${Color(
                                  hexColors(
                                    allColors[colorProvider
                                            .colorsList.value[index]]
                                        .hexColor,
                                  ),
                                ).toString()[11]}${Color(
                                  hexColors(
                                    allColors[colorProvider
                                            .colorsList.value[index]]
                                        .hexColor,
                                  ),
                                ).toString()[12]}${Color(
                                  hexColors(
                                    allColors[colorProvider
                                            .colorsList.value[index]]
                                        .hexColor,
                                  ),
                                ).toString()[13]}${Color(
                                  hexColors(
                                    allColors[colorProvider
                                            .colorsList.value[index]]
                                        .hexColor,
                                  ),
                                ).toString()[14]}${Color(
                                  hexColors(
                                    allColors[colorProvider
                                            .colorsList.value[index]]
                                        .hexColor,
                                  ),
                                ).toString()[15]}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<ColorProvider>(context, listen: false)
                        .changeColor();
                  },
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: (Provider.of<ThemeProvider>(context, listen: true)
                                  .isDark
                                  .value ==
                              false)
                          ? Colors.white
                          : Colors.black,
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(3, 3),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Text(
                      "Generate",
                      style: GoogleFonts.orbitron(
                        textStyle: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: (Provider.of<ThemeProvider>(context,
                                          listen: false)
                                      .isDark
                                      .value ==
                                  false)
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
