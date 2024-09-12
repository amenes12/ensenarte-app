import 'package:ensenarte/utils/assets_routes.dart';

Map<String, String> userLevels = {
  "none": "Ninguno",
  "basic": "Básico",
  "intermediate": "Medio",
  "advanced": "Avanzado",
};

String getUserMedalAssets(String currentLevel) {
  switch (currentLevel) {
    case "none":
      return MedalAsset.none;
    case "basic":
      return MedalAsset.basic;
    case "intermediate":
      return MedalAsset.intermediate;
    case "advanced":
      return MedalAsset.advanced;
    default:
      return "Recurso no encontrado";
  }
}
