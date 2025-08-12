import 'dart:convert';
import 'dart:io';
import 'package:empetzmini897/petpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  List<Map<String, dynamic>> petsname = [
    {'id': '1', 'name': 'Dog'},
    {'id': '2', 'name': 'Cat'},
    {'id': '3', 'name': 'Bird'},
  ];
  String? selectedCategoryId;
  String? selectedCategoryName;
  List<Map<String, dynamic>> breedsname = [];
  String? selectedBreedId;
  String? selectedBreedName;
  List<Map<String, dynamic>> locations = [
    {'id': '1', 'name': 'New York'},
    {'id': '2', 'name': 'Los Angeles'},
    {'id': '3', 'name': 'Chicago'},
  ];
  String? selectedLocationId;
  String? selectedLocationName;

  final TextEditingController NameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController vaccinatedController = TextEditingController();
  final TextEditingController petController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController adressController = TextEditingController();

  String? NameError;
  String? ageError;
  String? heightError;
  String? weightdError;
  String? petdError;
  String? pricedError;
  String? adressError;

  List<String> _locations1 = ['Male', 'Female'];
  String? _selectedLocation1;

  File? _pickedImage; // Image file

  final picker = ImagePicker(); // ImagePicker instance

  @override
  void initState() {
    super.initState();
    // Initialize breeds based on default category
    updateBreedsName(petsname[0]['id']);
  }

  void updateBreedsName(String categoryId) {
    setState(() {
      if (categoryId == '1') {
        breedsname = [
          {'id': '1', 'name': 'Labrador'},
          {'id': '2', 'name': 'German Shepherd'},
          {'id': '3', 'name': 'Poodle'},
        ];
      } else if (categoryId == '2') {
        breedsname = [
          {'id': '4', 'name': 'Persian'},
          {'id': '5', 'name': 'Siamese'},
          {'id': '6', 'name': 'Maine Coon'},
        ];
      } else if (categoryId == '3') {
        breedsname = [
          {'id': '7', 'name': 'Parrot'},
          {'id': '8', 'name': 'Canary'},
          {'id': '9', 'name': 'Budgie'},
        ];
      }
      selectedBreedId = null;
      selectedBreedName = null;
    });
  }

  Future<void> senddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedPets = prefs.getStringList('pets') ?? [];

    final petData = {
      'Name': NameController.text.trim(),
      'height': heightController.text.trim(),
      'Price': priceController.text.trim(),
      'Address': adressController.text.trim(),
      'Discription': petController.text.trim(),
      'weight': weightController.text.trim(),
      'Age': ageController.text.trim(),
      'BreedId': selectedBreedId!,
      'LocationId': selectedLocationId!,
      'CategoryId': selectedCategoryId!,
      'Gender': _selectedLocation1!,
      // Note: Image is not saved as it requires file storage; only path is stored if available
      'ImagePath': _pickedImage?.path ?? '',
    };

    savedPets.add(json.encode(petData));
    await prefs.setStringList('pets', savedPets);

    showSnack('Pet data submitted successfully!');

    // Navigate to Mypets page with category ID and name
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Mypets(
          categoryId: selectedCategoryId!,
          categoryName: selectedCategoryName ?? '',
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 3, 44, 91),
        title: Text('Add Pet Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Center(
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                    child: _pickedImage == null
                        ? IconButton(
                            onPressed: pickImage,
                            icon: Icon(Icons.add_a_photo_outlined),
                          )
                        : Image.file(
                            _pickedImage!,
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: NameController,
            decoration: InputDecoration(
              labelText: 'Enter Name',
              errorText: NameError,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() => NameError = validatedname(value)),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder()),
            hint: Text('Category'),
            value: selectedCategoryName,
            onChanged: (newValue) {
              if (newValue != null) {
                final selectedCategory = petsname.firstWhere(
                  (category) => category['name'] == newValue,
                  orElse: () => {'id': null, 'name': null},
                );
                if (selectedCategory['id'] != null) {
                  setState(() {
                    selectedCategoryName = newValue;
                    selectedCategoryId = selectedCategory['id'];
                  });
                  updateBreedsName(selectedCategory['id']);
                }
              }
            },
            items: petsname.map<DropdownMenuItem<String>>((category) {
              return DropdownMenuItem<String>(
                value: category['name']?.toString(),
                child: Text(category['name']?.toString() ?? ''),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder()),
            hint: Text('Breed'),
            value: selectedBreedName,
            onChanged: breedsname.isEmpty
                ? null
                : (newValue) {
                    if (newValue != null) {
                      final selectedBreed = breedsname.firstWhere(
                        (breed) => breed['name'] == newValue,
                        orElse: () => {'id': null, 'name': null},
                      );
                      if (selectedBreed['id'] != null) {
                        setState(() {
                          selectedBreedName = newValue;
                          selectedBreedId = selectedBreed['id'];
                        });
                      }
                    }
                  },
            items: breedsname.map<DropdownMenuItem<String>>((breed) {
              return DropdownMenuItem<String>(
                value: breed['name']?.toString(),
                child: Text(breed['name']?.toString() ?? ''),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'Age',
              errorText: ageError,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() => ageError = validatedage(value)),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            hint: Text('Gender'),
            value: _selectedLocation1,
            onChanged: (newValue) => setState(() => _selectedLocation1 = newValue),
            items: _locations1.map((location) {
              return DropdownMenuItem(value: location, child: Text(location));
            }).toList(),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: heightController,
            decoration: InputDecoration(
              labelText: 'Height',
              errorText: heightError,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() => heightError = validatedheight(value)),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: weightController,
            decoration: InputDecoration(
              labelText: 'Weight',
              errorText: weightdError,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() => weightdError = validatedweight(value)),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(border: OutlineInputBorder()),
            hint: Text('Location'),
            value: selectedLocationName,
            onChanged: (newValue) {
              if (newValue != null) {
                final selectedLocation = locations.firstWhere(
                  (location) => location['name'] == newValue,
                  orElse: () => {'id': null, 'name': null},
                );
                if (selectedLocation['id'] != null) {
                  setState(() {
                    selectedLocationName = newValue;
                    selectedLocationId = selectedLocation['id'];
                  });
                }
              }
            },
            items: locations.map<DropdownMenuItem<String>>((location) {
              return DropdownMenuItem<String>(
                value: location['name']?.toString(),
                child: Text(location['name']?.toString() ?? ''),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          TextField(
            controller: adressController,
            maxLines: 5,
            minLines: 3,
            decoration: InputDecoration(
              labelText: 'Adress',
              errorText: adressError,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            onChanged: (value) => setState(() => adressError = validatedadress(value)),
          ),
          SizedBox(height: 20),
          TextField(
            controller: petController,
            maxLines: 5,
            minLines: 3,
            decoration: InputDecoration(
              labelText: 'Description',
              errorText: petdError,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            onChanged: (value) => setState(() => petdError = validatedpet(value)),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            controller: priceController,
            decoration: InputDecoration(
              labelText: 'Price',
              errorText: pricedError,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => setState(() => pricedError = validatedprice(value)),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(250, 50),
                backgroundColor: Color.fromARGB(255, 3, 44, 91),
              ),
              onPressed: () async {
                setState(() {
                  NameError = validatedname(NameController.text);
                  ageError = validatedage(ageController.text);
                  heightError = validatedheight(heightController.text);
                  weightdError = validatedweight(weightController.text);
                  petdError = validatedpet(petController.text);
                  pricedError = validatedprice(priceController.text);
                  adressError = validatedadress(adressController.text);
                });

                if ([NameError, ageError, heightError, weightdError, adressError, petdError, pricedError].every((e) => e == null) &&
                    selectedCategoryId != null &&
                    selectedBreedId != null &&
                    _selectedLocation1 != null &&
                    selectedLocationId != null) {
                  await senddata();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all fields")));
                }
              },
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ),
        ]),
      ),
    );
  }

  String? validatedname(String name) {
    if (name.isEmpty) return 'Name cannot be empty';
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(name)) {
      return 'Name must not contain special characters or numbers';
    }
    return null;
  }

  String? validatedage(String age) => age.isEmpty ? 'Age cannot be empty' : null;
  String? validatedheight(String height) => height.isEmpty ? 'Height cannot be empty' : null;
  String? validatedweight(String weight) => weight.isEmpty ? 'Weight cannot be empty' : null;
  String? validatedpet(String pet) {
    if (pet.isEmpty) return 'Pet name cannot be empty';
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(pet)) {
      return 'Pet name must not contain special characters or numbers';
    }
    return null;
  }

  String? validatedprice(String price) => price.isEmpty ? 'Price cannot be empty' : null;
  String? validatedvaccinated(String Vaccinated) => Vaccinated.isEmpty ? 'Cannot be empty' : null;
  String? validatedadress(String adress) => adress.isEmpty ? 'Address cannot be empty' : null;
}