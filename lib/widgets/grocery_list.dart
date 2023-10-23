import 'package:flutter/material.dart';
import 'package:shopping_list/models/groceryItemsModel.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItemsModel> _groceryItems = [];

  void _addNewItem() async {
    final newItem = await Navigator.of(context).push<GroceryItemsModel>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(_groceryItems[index].id),
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                _groceryItems.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              leading: Container(
                height: 20,
                width: 20,
                color: _groceryItems[index].category.color,
              ),
              title: Text(_groceryItems[index].name),
              trailing: Text(
                '${_groceryItems[index].quantity}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(onPressed: _addNewItem, icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
