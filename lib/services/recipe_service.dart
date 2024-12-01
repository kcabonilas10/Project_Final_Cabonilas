import '../models/recipe.dart';  

class RecipeService {  
  final List<Recipe> _recipes = [  
    Recipe(  
      id: '1',  
      title: 'Creamy Pasta Carbonara',  
      description: 'Classic Italian pasta dish with creamy sauce',  
      imageUrl: 'assets/images/carbonara.jpg',  
      ingredients: ['Spaghetti', 'Eggs', 'Pecorino Romano', 'Guanciale', 'Black Pepper'],  
      steps: [  
        'Boil pasta in salted water',  
        'Cook guanciale until crispy',  
        'Mix eggs and cheese',  
        'Combine all ingredients'  
      ],  
      cookingTime: 25,  
      difficulty: 'Medium',  
      category: 'Italian',  
    ),  
    // Add more recipes here  
  ];  

  List<Recipe> getRecipes(String category) {  
    if (category == 'All') return _recipes;  
    return _recipes.where((recipe) => recipe.category == category).toList();  
  }  

  List<Recipe> getFavorites() {  
    return _recipes.where((recipe) => recipe.isFavorite).toList();  
  }  

  void toggleFavorite(String id) {  
    final recipeIndex = _recipes.indexWhere((recipe) => recipe.id == id);  
    if (recipeIndex != -1) {  
      _recipes[recipeIndex].isFavorite = !_recipes[recipeIndex].isFavorite;  
    }  
  }  
}  