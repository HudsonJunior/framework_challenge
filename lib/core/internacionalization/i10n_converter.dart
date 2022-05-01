import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:framework_test/core/resources/global_context.dart';

class I10nConverter {
  static final converter = {
    "Maçã": AppLocalizations.of(GlobalContext.globalKey.currentContext!)!.apple,
    "Abacaxi":
        AppLocalizations.of(GlobalContext.globalKey.currentContext!)!.pineapple,
    "Pêra": AppLocalizations.of(GlobalContext.globalKey.currentContext!)!.pear,
    "Banana":
        AppLocalizations.of(GlobalContext.globalKey.currentContext!)!.banana,
    "Manga":
        AppLocalizations.of(GlobalContext.globalKey.currentContext!)!.mango,
  };
}
