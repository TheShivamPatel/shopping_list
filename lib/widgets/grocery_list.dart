import 'package:flutter/material.dart';
import 'package:shopping_list/data/groceryItemsData.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            height: 20,
            width: 20,
            color: groceryItems[index].category.color,
          ),
          title: Text(groceryItems[index].name),
          trailing: Text(
            '${groceryItems[index].quantity}',
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }
}
