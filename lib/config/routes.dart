import 'package:flutter/material.dart';  
import '../screens/home_screen.dart';  
import '../screens/recipe_detail_screen.dart';  
import '../screens/favorite_screen.dart';  
import '../screens/search_screen.dart';  

class AppRoutes {  
  static Map<String, WidgetBuilder> get routes => {  
    '/': (context) => const HomeScreen(),  
    '/recipe-detail': (context) => const RecipeDetailScreen(),  
    '/favorites': (context) => const FavoritesScreen(),  
    '/search': (context) => const SearchScreen(),  
  };  
}  
