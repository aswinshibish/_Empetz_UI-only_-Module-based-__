import 'dart:convert';
import 'dart:io';

import 'package:empetzmini897/sellerpage2.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserPostedPetsScreen extends StatefulWidget {
  const UserPostedPetsScreen({super.key});

  @override
  State<UserPostedPetsScreen> createState() => _UserPostedPetsScreenState();
}

class _UserPostedPetsScreenState extends State<UserPostedPetsScreen> {
  late Future<List<Map<String, dynamic>>> _futurePets;

  @override
  void initState() {
    super.initState();
    _futurePets = fetchUserPostedPets();
  }

  Future<List<Map<String, dynamic>>> fetchUserPostedPets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedPets = prefs.getStringList('pets');

    if (savedPets == null || savedPets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No pets found")),
      );
      return [];
    }

    List<Map<String, dynamic>> pets = savedPets
        .map((str) => jsonDecode(str) as Map<String, dynamic>)
        .toList();

    // Assign temporary id as index for deletion
    for (int i = 0; i < pets.length; i++) {
      pets[i]['id'] = i;
    }

    return pets;
  }

  Future<void> _refreshData() async {
    setState(() {
      _futurePets = fetchUserPostedPets();
    });
  }
  
  Future<void> deletePet(String petId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? savedPets = prefs.getStringList('pets');

      if (savedPets == null) {
        debugPrint("No pets to delete");
        return;
      }

      int index = int.parse(petId);
      if (index < 0 || index >= savedPets.length) {
        debugPrint("Invalid index");
        return;
      }

      savedPets.removeAt(index);
      await prefs.setStringList('pets', savedPets);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pet deleted successfully")),
      );
      _refreshData();
    } catch (e) {
      debugPrint("Delete error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete pet: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futurePets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());

          if (snapshot.hasError)
            return Center(child: Text("Error: ${snapshot.error}"));

          final pets = snapshot.data ?? [];

          if (pets.isEmpty) {
            return const Center(child: Text("No pets posted yet"));
          }

          return RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                final pet = pets[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: pet['ImagePath'] != null
                          ? FileImage(File(pet['ImagePath']))
                          : null,
                    ),
                    title: Text(
                      pet['Name'] ?? 'Unknown',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Price: ₹${pet['Price'] ?? 'N/A'}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        // Show temporary loading
                        setState(() {
                          pets.removeAt(index);
                        });

                        await deletePet(pet['id'].toString());
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Myform()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 3, 44, 91),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}