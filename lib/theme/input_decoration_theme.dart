import 'package:flutter/material.dart';
import '../constants.dart';

const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  fillColor: lightGreyColor,
  filled: true,
  hintStyle: TextStyle(color: greyColor),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  fillColor: darkGreyColor,
  filled: true,
  hintStyle: TextStyle(color: Colors.white), // Use a slightly transparent white for hints
  border: darkOutlineInputBorder,
  enabledBorder: darkOutlineInputBorder,
  focusedBorder: darkFocusedOutlineInputBorder,
  errorBorder: darkErrorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

const OutlineInputBorder darkOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: Colors.white24, // Use a lighter color for the border
  ),
);

const OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(color: primaryColor),
);

const OutlineInputBorder darkFocusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(color: primaryColor), // Same primary color for focus
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: errorColor,
  ),
);

const OutlineInputBorder darkErrorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: errorColor, // Keep error color consistent across themes
  ),
);

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadious)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}
