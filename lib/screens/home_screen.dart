import 'package:flutter/material.dart';
import '../models/ingredient.dart';

// Public widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState(); // Cambiar a tipo público
}

// Clase pública asociada
class HomeScreenState extends State<HomeScreen> {
  final List<Ingredient> _ingredients = [];

  void _addIngredient(String name, double quantity, String unit) {
    setState(() {
      _ingredients.add(Ingredient(name: name, quantity: quantity, unit: unit));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planificador de comidas'),
      ),
      body: Column(
        children: [
          IngredientForm(onAddIngredient: _addIngredient),
          Expanded(
            child: ListView.builder(
              itemCount: _ingredients.length,
              itemBuilder: (ctx, index) {
                final ingredient = _ingredients[index];
                return ListTile(
                  title: Text('${ingredient.name}'),
                  subtitle: Text('${ingredient.quantity} ${ingredient.unit}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Public widget
class IngredientForm extends StatefulWidget {
  final void Function(String, double, String) onAddIngredient;

  const IngredientForm({super.key, required this.onAddIngredient});

  @override
  IngredientFormState createState() => IngredientFormState(); // Cambiar a tipo público
}

// Clase pública asociada
class IngredientFormState extends State<IngredientForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  String _unit = 'grams';

  void _submitForm() {
    final name = _nameController.text;
    final quantity = double.tryParse(_quantityController.text);

    if (name.isEmpty || quantity == null || quantity <= 0) {
      return;
    }

    widget.onAddIngredient(name, quantity, _unit);
    _nameController.clear();
    _quantityController.clear();
    setState(() {
      _unit = 'grams';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nombre del ingrediente'),
          ),
          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Cantidad'),
          ),
          DropdownButton<String>(
            value: _unit,
            items: const [
              DropdownMenuItem(value: 'grams', child: Text('Gramos')),
              DropdownMenuItem(value: 'kilograms', child: Text('Kilogramos')),
              DropdownMenuItem(value: 'liters', child: Text('Litros')),
            ],
            onChanged: (value) {
              setState(() {
                _unit = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Añadir Ingrediente'),
          ),
        ],
      ),
    );
  }
}
