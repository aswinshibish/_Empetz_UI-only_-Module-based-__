import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? nameError;
  String? usernameError;
  String? phoneNumberError;
  String? emailError;
  String? passwordError;

  String? validatedName(String name) {
    if (name.isEmpty) return 'Name cannot be empty';
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(name)) {
      return 'Name must not contain special characters or numbers';
    }
    return null;
  }

  String? validateUsername(String username) {
    if (username.isEmpty) return 'Username cannot be empty';
    if (RegExp(r'[!@#<>?":_~;[\]\\|=+(*&^%0-9-)]').hasMatch(username)) {
      return 'Username must not contain special characters or numbers';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 6) return 'Password must be at least 6 characters long';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Password must have at least one uppercase letter';
    if (!RegExp(r'[0-9]').hasMatch(password)) return 'Password must have at least one number';
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  String? validateEmail(String email) {
    if (email.length < 6) return 'Email must be at least 6 characters long';
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  bool isChecked = false;

  Future<void> senddata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Save registration data locally
    await prefs.setString('username', usernameController.text.trim());
    await prefs.setString('firstName', nameController.text.trim());
    await prefs.setString('phone', phoneNumberController.text.trim());
    await prefs.setString('email', emailController.text.trim());
    // Note: Storing passwords in SharedPreferences is not secure in production
    await prefs.setString('password', passwordController.text.trim());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Registered successfully")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.pets_sharp,
                color: Color.fromARGB(255, 3, 44, 91),
                size: 200,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  errorText: nameError,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    nameError = validatedName(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: usernameError,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    usernameError = validateUsername(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              TextField(
                controller: phoneNumberController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  errorText: phoneNumberError,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    phoneNumberError = validatePhoneNumber(value);
                  });
                },
              ),
              const SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: emailError,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    emailError = validateEmail(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: passwordError,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    passwordError = validatePassword(value);
                  });
                },
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Text('Keep me signed in'),
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        nameError = validatedName(nameController.text);
                        usernameError = validateUsername(usernameController.text);
                        phoneNumberError = validatePhoneNumber(phoneNumberController.text);
                        emailError = validateEmail(emailController.text);
                        passwordError = validatePassword(passwordController.text);
                      });

                      if (passwordError == null &&
                          usernameError == null &&
                          phoneNumberError == null &&
                          emailError == null &&
                          nameError == null) {
                        senddata();
                      }
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade900,
                            const Color.fromARGB(255, 11, 24, 52)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}