import 'package:playwith_customer_app/core/i18n/strings/en_us.dart';
import 'package:playwith_customer_app/core/i18n/strings/pt_br.dart';
import 'package:playwith_customer_app/core/i18n/strings/translation.dart';
import 'package:flutter/widgets.dart';

class I18n {
  static Translation strings = EnUs();

  static void load({required Locale locale}) {
    switch (locale.toString()) {
      case 'en_US':
        strings = EnUs();
        break;
      case 'pt_BR':
        strings = PtBr();
        break;
      default:
        strings = EnUs();
        break;
    }
  }
}
