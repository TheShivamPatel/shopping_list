import 'package:shopping_list/data/categoriesData.dart';
import 'package:shopping_list/models/categoriesModel.dart';
import 'package:shopping_list/models/groceryItemsModel.dart';

final groceryItems = [
  GroceryItemsModel(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GroceryItemsModel(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[Categories.fruit]!,
  ),
  GroceryItemsModel(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[Categories.meat]!,
  ),
];
