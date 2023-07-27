import 'package:flutter/material.dart';

import '../generated/l10n.dart';

extension LocaleHelper on BuildContext {
  S get appLocale => S.of(this);
}
