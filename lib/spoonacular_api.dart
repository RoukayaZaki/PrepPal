// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<(String?, String?, String?)> fetchRecipe([String? recipe]) async {
  final url = recipe == null
      ? Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php')
      : Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=$recipe');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      final data = body['meals'] as List<dynamic>;
      final meal = data.first;
      final recipeTitle = meal['strMeal'] as String;
      final recipeInstructions = meal['strInstructions'] as String;
      final recipeImage = meal['strMealThumb'] as String;

      if (recipeTitle != null) {
        return (recipeTitle, recipeInstructions, recipeImage);
      } else {
        debugPrint('Recipe data is incomplete');
        return (null, null, null);
      }
    } else {
      debugPrint('Failed to fetch recipe: ${response.statusCode}');
      return (null, null, null);
    }
  } catch (e) {
    debugPrint('Error fetching recipe: $e');
    return (null, null, null);
  }
}
