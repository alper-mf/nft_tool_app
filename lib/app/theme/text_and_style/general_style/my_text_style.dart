import 'package:flutter/material.dart';

/// Uygulama genelinde tüm text style ler buradan çekilmektedir
/// İsimler 'Size - FontWight - Color' Formatında ayarlanmıştır

TextStyle s12w400Dark(BuildContext context) => Theme.of(context).textTheme.subtitle1!;

TextStyle s12w700Dark(BuildContext context) => Theme.of(context).textTheme.subtitle2!;

TextStyle s14w700Dark(BuildContext context) => Theme.of(context).textTheme.bodyText2!;

TextStyle s14w400Dark(BuildContext context) => Theme.of(context).textTheme.bodyText1!;

TextStyle s16w400Dark(BuildContext context) => Theme.of(context).textTheme.headline1!;

TextStyle s16w700Dark(BuildContext context) => Theme.of(context).textTheme.headline2!;

TextStyle s18w400Dark(BuildContext context) => Theme.of(context).textTheme.headline3!;

TextStyle s18w700Dark(BuildContext context) => Theme.of(context).textTheme.headline4!;

TextStyle s22w400Dark(BuildContext context) => Theme.of(context).textTheme.headline5!;

TextStyle s22w700Dark(BuildContext context) => Theme.of(context).textTheme.headline6!;

TextStyle s34w700Dark(BuildContext context) => Theme.of(context).textTheme.button!;
