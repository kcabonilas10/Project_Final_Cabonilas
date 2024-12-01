import 'package:flutter/material.dart';  
import '../models/recipe.dart';  

class RecipeCard extends StatelessWidget {  
  final Recipe recipe;  

  const RecipeCard({super.key, required this.recipe});  

  @override  
  Widget build(BuildContext context) {  
    return Card(  
      child: InkWell(  
        onTap: () => Navigator.pushNamed(  
          context,  
          '/recipe-detail',  
          arguments: recipe,  
        ),  
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,  
          children: [  
            ClipRRect(  
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),  
              child: Image.asset(  
                recipe.imageUrl,  
                height: 120,  
                width: double.infinity,  
                fit: BoxFit.cover,  
              ),  
            ),  
            Padding(  
              padding: const EdgeInsets.all(12),  
              child: Column(  
                crossAxisAlignment: CrossAxisAlignment.start,  
                children: [  
                  Text(  
                    recipe.title,  
                    style: Theme.of(context).textTheme.titleMedium,  
                    maxLines: 2,  
                    overflow: TextOverflow.ellipsis,  
                  ),  
                  const SizedBox(height: 4),  
                  Row(  
                    children: [  
                      Icon(  
                        Icons.access_time,  
                        size: 16,  
                        color: Theme.of(context).colorScheme.secondary,  
                      ),  
                      const SizedBox(width: 4),  
                      Text('${recipe.cookingTime} min'),  
                    ],  
                  ),  
                ],  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  