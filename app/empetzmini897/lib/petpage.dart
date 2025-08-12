import 'dart:convert';
import 'package:empetzmini897/petdisply.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Mypets extends StatefulWidget {
  final String categoryId; 
  final String categoryName;
  const Mypets({super.key, required this.categoryId, required this.categoryName});

  @override
  State<Mypets> createState() => _MypetsState();
}

class _MypetsState extends State<Mypets> {
  List pets = [];

  @override
  void initState() {
    super.initState();
    getPets();
  }

  Future<void> getPets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedPets = prefs.getStringList('pets');

    if (savedPets == null || savedPets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No pets found')),
      );
      return;
    }

    // Filter pets by categoryId
    List<Map<String, dynamic>> filteredPets = savedPets
        .map((pet) => json.decode(pet) as Map<String, dynamic>)
        .where((pet) => pet['CategoryId'] == widget.categoryId)
        .map((pet) => {
              ...pet,
              'imagePath': pet['ImagePath'] ?? 'https://example.com/placeholder.jpg',
              'name': pet['Name'] ?? '',
              'age': pet['Age'] ?? '',
              'price': pet['Price'] ?? '',
              'userId': 'local_user', // Placeholder userId since no API
            })
        .toList();

    setState(() {
      pets = filteredPets;
    });

    if (filteredPets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No pets found for this category')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: TextStyle(color: Colors.white, fontFamily: 'Cursive'),
        ),
        backgroundColor: Color.fromARGB(255, 3, 44, 91),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: pets.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final pet = pets[index];
          return Card(
            color: Color.fromARGB(255, 3, 44, 91),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyDisplay(pet: pet, userId: pet['userId']),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        pet['imagePath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pet['name'] ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Age: ${pet['age'] ?? ''}",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Price: ₹${pet['price'] ?? ''}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}