import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _meals = []; // Lista de comidas
  final TextEditingController _mealController = TextEditingController();

  void _addMeal() {
    if (_mealController.text.isNotEmpty) {
      setState(() {
        _meals.add(_mealController.text);
        _mealController.clear();
      });
    }
  }

  void _removeMeal(int index) {
    setState(() {
      _meals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planificador de Comidas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _mealController,
              decoration: const InputDecoration(
                labelText: 'Añadir comida',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addMeal,
              child: const Text('Añadir'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _meals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_meals[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeMeal(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

