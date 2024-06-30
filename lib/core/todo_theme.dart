import 'package:flutter/material.dart';

enum ProjectColors {
  aquaLake,
  mangoOrange,
  etherealWhite,
  alpineBlue,
  haborMist,
  jungleMist,
  blackisBack,
  white
}

extension ProjectColorsExtension on ProjectColors {
  Color? get color {
    switch (this) {
      case ProjectColors.aquaLake:
        return const Color(0xff3396A1);
      case ProjectColors.mangoOrange:
        return const Color(0xffFF8A5B);
      case ProjectColors.etherealWhite:
        return const Color(0xffE6F2F3);
      case ProjectColors.alpineBlue:
        return const Color(0xffDAE4E5);
      case ProjectColors.jungleMist:
        return const Color(0xffAFC4C6);
      case ProjectColors.blackisBack:
        return const Color(0xff111718);
      case ProjectColors.haborMist:
        return const Color(0xff88A7AA);
      case ProjectColors.white:
        return const Color(0xffFFFFFF);
    }
  }
}

final ThemeData themeProject = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: ProjectColors.aquaLake.color!),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ProjectColors.aquaLake.color,
      foregroundColor: ProjectColors.white.color),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return ProjectColors.blackisBack.color!;
      }
      return ProjectColors.white.color!;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
        backgroundColor: ProjectColors.etherealWhite.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: ProjectColors.aquaLake.color,
        foregroundColor: ProjectColors.white.color),
  ),
  dialogTheme: DialogTheme(backgroundColor: ProjectColors.white.color),
);
