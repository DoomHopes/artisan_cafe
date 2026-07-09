import 'package:flutter/material.dart';
import 'package:artisan_cafe/l10n/app_localizations.dart';

extension LocalizedContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
