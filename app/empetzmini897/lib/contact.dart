// import 'package:flutter/material.dart';

// class Contact extends StatelessWidget {
//   const Contact({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         Container(
//             height: 1000,
//             child: Image(
//               image: AssetImage('lib/image/contactus.jpg'),
//               fit: BoxFit.cover,
//             )),
//         Padding(
//           padding: const EdgeInsets.only(top: 150.0),
//           child: Padding(
//             padding: const EdgeInsets.only(right: 30, left: 30, bottom: 100),
//             child: Card(
//               color: const Color.fromARGB(255, 78, 45, 244),
//               child: ListTile(
//                 title: Text(
//                   "8466747880",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight:
//                           FontWeight.bold), // Change text color to black
//                 ),
//                 leading: Icon(
//                   Icons.phone,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 210.0),
//           child: Padding(
//             padding: EdgeInsets.only(left: 30, right: 30),
//             child: Card(
//               color: Color.fromARGB(255, 78, 45, 244),
//               child: ListTile(
//                 title: Text(
//                   'lkkj@gmailcom',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 leading: Icon(
//                   Icons.mail,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     ));
//   }
// }
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5D3), // Light beige background
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF032B57), Color(0xFF035781)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        titleSpacing: 0, // removes extra gap so back button aligns nicely
        title: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(left: 8), // keeps it aligned to edge
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text(
              "Contact Us",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Message
              TextField(
                controller: messageController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Message",
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Send Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  onPressed: () {
                    // Send logic
                  },
                  child: const Text("SEND", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 40),

              // Info
              const Text(
                "Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 15),

              Row(
                children: const [
                  Icon(Icons.print, color: Colors.black, size: 28),
                  SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Icon(Icons.phone, color: Colors.black, size: 28),
                  SizedBox(width: 10),
                  Text("+123 456 789", style: TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: const [
                  Icon(Icons.apartment, color: Colors.black, size: 28),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
