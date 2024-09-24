import 'package:ensenarte/utils/assets_routes.dart';

enum UserLevel {
  none,
  basic,
  intermediate,
  advanced,
}

extension UserLevelExtension on UserLevel {
  String get displayName {
    switch (this) {
      case UserLevel.none:
        return "Ninguno";
      case UserLevel.basic:
        return "Básico";
      case UserLevel.intermediate:
        return "Medio";
      case UserLevel.advanced:
        return "Avanzado";
    }
  }

  String get asset {
    switch (this) {
      case UserLevel.none:
        return MedalAsset.none;
      case UserLevel.basic:
        return MedalAsset.basic;
      case UserLevel.intermediate:
        return MedalAsset.intermediate;
      case UserLevel.advanced:
        return MedalAsset.advanced;
    }
  }
}
