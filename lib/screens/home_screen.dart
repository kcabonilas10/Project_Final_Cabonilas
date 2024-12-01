import 'package:flutter/material.dart';  
import '../widgets/recipe_card.dart';  
import '../widgets/category_chips.dart';  
import '../services/recipe_service.dart';  

class HomeScreen extends StatefulWidget {  
  const HomeScreen({super.key});  

  @override  
  State<HomeScreen> createState() => _HomeScreenState();  
}  

class _HomeScreenState extends State<HomeScreen> {  
  final RecipeService _recipeService = RecipeService();  
  String _selectedCategory = 'All';  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: CustomScrollView(  
        slivers: [  
          SliverAppBar(  
            expandedHeight: 120,  
            floating: true,  
            pinned: true,  
            flexibleSpace: FlexibleSpaceBar(  
              title: const Text('Culinary Delight'),  
              background: Container(  
                decoration: BoxDecoration(  
                  gradient: LinearGradient(  
                    colors: [  
                      Theme.of(context).colorScheme.primary,  
                      Theme.of(context).colorScheme.secondary,  
                    ],  
                  ),  
                ),  
              ),  
            ),  
            actions: [  
              IconButton(  
                icon: const Icon(Icons.search),  
                onPressed: () => Navigator.pushNamed(context, '/search'),  
              ),  
              IconButton(  
                icon: const Icon(Icons.favorite),  
                onPressed: () => Navigator.pushNamed(context, '/favorites'),  
              ),  
            ],  
          ),  
          SliverToBoxAdapter(  
            child: CategoryChips(  
              selectedCategory: _selectedCategory,  
              onCategorySelected: (category) {  
                setState(() => _selectedCategory = category);  
              },  
            ),  
          ),  
          SliverPadding(  
            padding: const EdgeInsets.all(16),  
            sliver: SliverGrid(  
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                crossAxisCount: 2,  
                mainAxisSpacing: 16,  
                crossAxisSpacing: 16,  
                childAspectRatio: 0.75,  
              ),  
              delegate: SliverChildBuilderDelegate(  
                (context, index) {  
                  final recipe = _recipeService.getRecipes(_selectedCategory)[index];  
                  return RecipeCard(recipe: recipe);  
                },  
                childCount: _recipeService.getRecipes(_selectedCategory).length,  
              ),  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
}  