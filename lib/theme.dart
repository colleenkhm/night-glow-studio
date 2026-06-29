import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6f5d0e),
      surfaceTint: Color(0xff6f5d0e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfffbe187),
      onPrimaryContainer: Color(0xff554600),
      secondary: Color(0xff63568f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe8ddff),
      onSecondaryContainer: Color(0xff4b3e76),
      tertiary: Color(0xff0f6b57),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa2f2d9),
      onTertiaryContainer: Color(0xff005141),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff1e1b13),
      onSurfaceVariant: Color(0xff4b4639),
      outline: Color(0xff7d7767),
      outlineVariant: Color(0xffcec6b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffddc56e),
      primaryFixed: Color(0xfffbe187),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffddc56e),
      onPrimaryFixedVariant: Color(0xff554600),
      secondaryFixed: Color(0xffe8ddff),
      onSecondaryFixed: Color(0xff1f1048),
      secondaryFixedDim: Color(0xffcebdff),
      onSecondaryFixedVariant: Color(0xff4b3e76),
      tertiaryFixed: Color(0xffa2f2d9),
      onTertiaryFixed: Color(0xff002019),
      tertiaryFixedDim: Color(0xff86d6be),
      onTertiaryFixedVariant: Color(0xff005141),
      surfaceDim: Color(0xffe1d9cc),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e5),
      surfaceContainer: Color(0xfff5eddf),
      surfaceContainerHigh: Color(0xffefe7da),
      surfaceContainerHighest: Color(0xffe9e2d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff413500),
      surfaceTint: Color(0xff6f5d0e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff7f6c1d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3a2d64),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff72649f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003e32),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff267a66),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff3a3629),
      outline: Color(0xff575244),
      outlineVariant: Color(0xff726d5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffddc56e),
      primaryFixed: Color(0xff7f6c1d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff655302),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff72649f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5a4c85),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff267a66),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00604e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcdc6b9),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbf3e5),
      surfaceContainer: Color(0xffefe7da),
      surfaceContainerHigh: Color(0xffe4dcce),
      surfaceContainerHighest: Color(0xffd8d1c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff362b00),
      surfaceTint: Color(0xff6f5d0e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff574800),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff302259),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4e4078),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003328),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005343),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff302c20),
      outlineVariant: Color(0xff4e493b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffddc56e),
      primaryFixed: Color(0xff574800),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3d3200),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4e4078),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff372960),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005343),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003a2e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbfb8ab),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f0e2),
      surfaceContainer: Color(0xffe9e2d4),
      surfaceContainerHigh: Color(0xffdbd4c6),
      surfaceContainerHighest: Color(0xffcdc6b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffddc56e),
      surfaceTint: Color(0xffddc56e),
      onPrimary: Color(0xff3b3000),
      primaryContainer: Color(0xff554600),
      onPrimaryContainer: Color(0xfffbe187),
      secondary: Color(0xffcebdff),
      onSecondary: Color(0xff35275e),
      secondaryContainer: Color(0xff4b3e76),
      onSecondaryContainer: Color(0xffe8ddff),
      tertiary: Color(0xff86d6be),
      onTertiary: Color(0xff00382c),
      tertiaryContainer: Color(0xff005141),
      onTertiaryContainer: Color(0xffa2f2d9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff16130b),
      onSurface: Color(0xffe9e2d4),
      onSurfaceVariant: Color(0xffcec6b4),
      outline: Color(0xff979080),
      outlineVariant: Color(0xff4b4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d4),
      inversePrimary: Color(0xff6f5d0e),
      primaryFixed: Color(0xfffbe187),
      onPrimaryFixed: Color(0xff221b00),
      primaryFixedDim: Color(0xffddc56e),
      onPrimaryFixedVariant: Color(0xff554600),
      secondaryFixed: Color(0xffe8ddff),
      onSecondaryFixed: Color(0xff1f1048),
      secondaryFixedDim: Color(0xffcebdff),
      onSecondaryFixedVariant: Color(0xff4b3e76),
      tertiaryFixed: Color(0xffa2f2d9),
      onTertiaryFixed: Color(0xff002019),
      tertiaryFixedDim: Color(0xff86d6be),
      onTertiaryFixedVariant: Color(0xff005141),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3d392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1e1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2d2a21),
      surfaceContainerHighest: Color(0xff38342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff4db81),
      surfaceTint: Color(0xffddc56e),
      onPrimary: Color(0xff2e2500),
      primaryContainer: Color(0xffa5903e),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe2d6ff),
      onSecondary: Color(0xff2a1b52),
      secondaryContainer: Color(0xff9788c5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9cecd3),
      onTertiary: Color(0xff002c22),
      tertiaryContainer: Color(0xff4f9f89),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe4dcc9),
      outline: Color(0xffb9b1a0),
      outlineVariant: Color(0xff969080),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d4),
      inversePrimary: Color(0xff564700),
      primaryFixed: Color(0xfffbe187),
      onPrimaryFixed: Color(0xff161100),
      primaryFixedDim: Color(0xffddc56e),
      onPrimaryFixedVariant: Color(0xff413500),
      secondaryFixed: Color(0xffe8ddff),
      onSecondaryFixed: Color(0xff14033d),
      secondaryFixedDim: Color(0xffcebdff),
      onSecondaryFixedVariant: Color(0xff3a2d64),
      tertiaryFixed: Color(0xffa2f2d9),
      onTertiaryFixed: Color(0xff00150f),
      tertiaryFixedDim: Color(0xff86d6be),
      onTertiaryFixedVariant: Color(0xff003e32),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff48443a),
      surfaceContainerLowest: Color(0xff090703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2b281f),
      surfaceContainerHigh: Color(0xff363229),
      surfaceContainerHighest: Color(0xff413d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffefc0),
      surfaceTint: Color(0xffddc56e),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd9c26a),
      onPrimaryContainer: Color(0xff0f0b00),
      secondary: Color(0xfff4edff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffcab9fa),
      onSecondaryContainer: Color(0xff0e0034),
      tertiary: Color(0xffb4ffe7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff82d2ba),
      onTertiaryContainer: Color(0xff000e0a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff8efdc),
      outlineVariant: Color(0xffcac2b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe9e2d4),
      inversePrimary: Color(0xff564700),
      primaryFixed: Color(0xfffbe187),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffddc56e),
      onPrimaryFixedVariant: Color(0xff161100),
      secondaryFixed: Color(0xffe8ddff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcebdff),
      onSecondaryFixedVariant: Color(0xff14033d),
      tertiaryFixed: Color(0xffa2f2d9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff86d6be),
      onTertiaryFixedVariant: Color(0xff00150f),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff545045),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff343027),
      surfaceContainerHigh: Color(0xff3f3b32),
      surfaceContainerHighest: Color(0xff4b463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
