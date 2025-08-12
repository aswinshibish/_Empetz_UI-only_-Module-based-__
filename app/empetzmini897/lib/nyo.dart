// // // // import 'package:flutter/material.dart';

// // // // void main() {
// // // //   runApp(const MyApp());
// // // // }

// // // // class MyApp extends StatelessWidget {
// // // //   const MyApp({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       home: CatsScreen(),
// // // //     );
// // // //   }
// // // // }

// // // // class CatsScreen extends StatelessWidget {
// // // //   final List<Map<String, String>> cats = [
// // // //     {
// // // //       "name": "Bella",
// // // //       "price": "₹ 5,000",
// // // //       "location": "thrissur, kerala",
// // // //       "time": "1 hour ago",
// // // //       "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5h4v_WmePqbeI7I4jrubOi6cFN39kAlbUrA&s",
// // // //       "fav": "true"
// // // //     },
// // // //     {
// // // //       "name": "Lucy",
// // // //       "price": "₹ 1,500",
// // // //       "location": "kochi, kerala",
// // // //       "time": "5 hour ago",
// // // //       "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX4EbLlkmCJhmk4LI_PxiTc7OrHEkFE_wjeA&s",
// // // //       "fav": "false"
// // // //     },
// // // //     {
// // // //       "name": "Loki",
// // // //       "price": "₹ 2,000",
// // // //       "location": "kannur, kerala",
// // // //       "time": "1 day ago",
// // // //       "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv4MTKxKMt1nmnb2So9o_eLOB84OLZN1pfmg&s",
// // // //       "fav": "false"
// // // //     },
// // // //     {
// // // //       "name": "Milo",
// // // //       "price": "₹ 10,000",
// // // //       "location": "kochi, kerala",
// // // //       "time": "1 day ago",
// // // //       "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIHapIeCiwS7x6LmNiUMsGcyA3R8dgs-nSdQ&s",
// // // //       "fav": "true"
// // // //     },
// // // //     {
// // // //       "name": "Leo",
// // // //       "price": "₹ 6,500",
// // // //       "location": "thrissur, kerala",
// // // //       "time": "3 day ago",
// // // //       "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNdI01ulN6lWCX-4FQtMUO0QW9VIp_Q_6nsw&s",
// // // //       "fav": "false"
// // // //     },
// // // //     {
// // // //       "name": "Oggy",
// // // //       "price": "₹ 3,000",
// // // //       "location": "thrissur, kerala",
// // // //       "time": "1 week ago",
// // // //       "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBfRaIl1GKY743VUdBOrL04K4gbgqvDZp3iw&s",
// // // //       "fav": "false"
// // // //     },
// // // //   ];

// // // //   CatsScreen({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       appBar: AppBar(
// // // //   title: const Text(
// // // //     "CATS",
// // // //     style: TextStyle(fontWeight: FontWeight.bold),
// // // //   ),
// // // //   centerTitle: true,
// // // //   actions: [
// // // //     IconButton(
// // // //       icon: const Icon(Icons.search),
// // // //       onPressed: () {},
// // // //     ),
// // // //     IconButton(
// // // //       icon: const Icon(Icons.filter_list),
// // // //       onPressed: () {},
// // // //     ),
// // // //   ],
// // // //   flexibleSpace: Container(
// // // //     decoration: const BoxDecoration(
// // // //       gradient: LinearGradient(
// // // //         colors: [Color(0xFF032B57), Color(0xFF035781)],
// // // //         begin: Alignment.topLeft,
// // // //         end: Alignment.bottomRight,
// // // //       ),
// // // //     ),
// // // //   ),
// // // // ),

// // // //       body: ListView.builder(
// // // //         itemCount: cats.length,
// // // //         itemBuilder: (context, index) {
// // // //           final cat = cats[index];
// // // //           return Card(
// // // //             color: const Color(0xFFF0F0F0),
// // // //             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// // // //             shape: RoundedRectangleBorder(
// // // //               borderRadius: BorderRadius.circular(10),
// // // //             ),
// // // //             child: ListTile(
// // // //               leading: ClipRRect(
// // // //                 borderRadius: BorderRadius.circular(50),
// // // //                 child: Image.network(
// // // //                   cat['image']!,
// // // //                   width: 55,
// // // //                   height: 55,
// // // //                   fit: BoxFit.cover,
// // // //                 ),
// // // //               ),
// // // //               title: Text(
// // // //                 cat['name']!,
// // // //                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// // // //               ),
// // // //               subtitle: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Text(cat['price']!, style: const TextStyle(fontSize: 14)),
// // // //                   const SizedBox(height: 2),
// // // //                   Text(cat['location']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
// // // //                 ],
// // // //               ),
// // // //               trailing: Column(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   Icon(
// // // //                     Icons.favorite,
// // // //                     color: cat['fav'] == "true" ? Colors.red : Colors.white,
// // // //                   ),
// // // //                   Text(
// // // //                     cat['time']!,
// // // //                     style: const TextStyle(fontSize: 10, color: Colors.black54),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       home: PetDetailsScreen(),
// // //     );
// // //   }
// // // }

// // // class PetDetailsScreen extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Column(
// // //         children: [
// // //           // Image section
// // //           Stack(
// // //             children: [
// // //               ClipRRect(
// // //                 borderRadius: const BorderRadius.only(
// // //                     bottomLeft: Radius.circular(0),
// // //                     bottomRight: Radius.circular(0)),
// // //                 child: Image.network(
// // //                   "https://images.unsplash.com/photo-1574158622682-e40e69881006",
// // //                   height: 300,
// // //                   width: double.infinity,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 top: 40,
// // //                 left: 10,
// // //                 child: IconButton(
// // //                   icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //                   onPressed: () {},
// // //                 ),
// // //               ),
// // //               Positioned(
// // //                 top: 40,
// // //                 right: 10,
// // //                 child: Icon(Icons.favorite_border, color: Colors.red, size: 28),
// // //               ),
// // //             ],
// // //           ),

// // //           // Details section
// // //           Expanded(
// // //             child: Container(
// // //               color: const Color(0xFFED8B47),
// // //               padding: const EdgeInsets.all(16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   // Name & Location
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: const [
// // //                           Text(
// // //                             "Persian Cat",
// // //                             style: TextStyle(
// // //                                 fontSize: 20,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 color: Colors.white),
// // //                           ),
// // //                           Text(
// // //                             "Bella",
// // //                             style: TextStyle(
// // //                                 fontSize: 16,
// // //                                 color: Colors.white70,
// // //                                 fontWeight: FontWeight.w500),
// // //                           ),
// // //                           const Text(
// // //                     " ₹ 5,000",
// // //                     style: TextStyle(color: Colors.white),
// // //                   ),
// // //                   const SizedBox(height: 12),
// // //                         ],
// // //                       ),
                      
// // //                       const Text(
// // //                         "Thrissur, Kerala",
// // //                         style: TextStyle(color: Colors.white),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 16),

// // //                   // Info boxes
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       _infoBox("3 months", "Age"),
// // //                       _infoBox("4.3 kg", "Weight"),
// // //                       _infoBox("Male", "Gender"),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 12),

// // //                   // Vaccinated date
// // //                   const Text(
// // //                     "Vaccinated on: 10/08/2022",
// // //                     style: TextStyle(color: Colors.white),
// // //                   ),
// // //                   const SizedBox(height: 12),


// // //                   // User profile box
// // //                   Container(
// // //                     padding: const EdgeInsets.all(8),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white.withOpacity(0.9),
// // //                       borderRadius: BorderRadius.circular(8),
// // //                     ),
// // //                     child: Row(
// // //                       children: [
// // //                         const CircleAvatar(
// // //                           backgroundImage: NetworkImage(
// // //                               "https://randomuser.me/api/portraits/women/44.jpg"),
// // //                         ),
// // //                         const SizedBox(width: 8),
// // //                         Expanded(
// // //                           child: Column(
// // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                             children: const [
// // //                               Text("Mai",
// // //                                   style:
// // //                                       TextStyle(fontWeight: FontWeight.bold)),
// // //                               Text("Posted one day ago",
// // //                                   style: TextStyle(fontSize: 12)),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 16),

// // //                   // Pet story
// // //                   const Text(
// // //                     "Pet Story",
// // //                     style: TextStyle(
// // //                         fontSize: 18,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Colors.white),
// // //                   ),
// // //                   const SizedBox(height: 8),
// // //                   const Text(
// // //                     "This little sweetie is 3 months year male cat. He has been at the shelter since he was born, and we'd really love to see his get into a new home soon!",
// // //                     style: TextStyle(color: Colors.white, fontSize: 14),
// // //                   ),
// // //                   const Spacer(),

// // //                   // Buttons
// // //                   Row(
// // //                     children: [
// // //                       Expanded(
// // //                         child: ElevatedButton.icon(
// // //                           style: ElevatedButton.styleFrom(
// // //                               backgroundColor: const Color(0xFFB0D9E4),
// // //                               shape: RoundedRectangleBorder(
// // //                                   borderRadius: BorderRadius.circular(12))),
// // //                           onPressed: () {},
// // //                           icon: const Icon(Icons.chat_bubble_outline,
// // //                               color: Colors.white),
// // //                           label: const Text("CHAT",
// // //                               style: TextStyle(color: Colors.white)),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 10),
// // //                       Expanded(
// // //                         child: ElevatedButton.icon(
// // //                           style: ElevatedButton.styleFrom(
// // //                               backgroundColor: const Color(0xFF3A2D33),
// // //                               shape: RoundedRectangleBorder(
// // //                                   borderRadius: BorderRadius.circular(12))),
// // //                           onPressed: () {},
// // //                           icon: const Icon(Icons.call, color: Colors.white),
// // //                           label: const Text("CALL",
// // //                               style: TextStyle(color: Colors.white)),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _infoBox(String value, String label) {
// // //     return Container(
// // //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(8),
// // //       ),
// // //       child: Column(
// // //         children: [
// // //           Text(value,
// // //               style: const TextStyle(
// // //                   fontWeight: FontWeight.bold, color: Colors.black)),
// // //           Text(label, style: const TextStyle(fontSize: 12)),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(primarySwatch: Colors.orange),
// //       home: const Profile(),
// //     );
// //   }
// // }

// // class Profile extends StatelessWidget {
// //   const Profile({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       appBar: AppBar(
// //   title: const Text("Profile"),
// //   centerTitle: true,
// //   actions: [
// //     IconButton(
// //       icon: const Icon(Icons.edit),
// //       onPressed: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(builder: (_) => const EditProfile()),
// //         );
// //       },
// //     )
// //   ],
// //   flexibleSpace: Container(
// //     decoration: const BoxDecoration(
// //       gradient: LinearGradient(
// //         colors: [Color(0xFF032B57), Color(0xFF035781)],
// //         begin: Alignment.topLeft,
// //         end: Alignment.bottomRight,
// //       ),
// //     ),
// //   ),
// // ),

// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             const CircleAvatar(
// //               radius: 50,
// //               backgroundImage: NetworkImage(
// //                   "https://upload.wikimedia.org/wikipedia/en/9/90/John_Wick_Keanu.jpeg"),
// //             ),
// //             const SizedBox(height: 10),
// //             const Text(
// //               "John Wick",
// //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 20),
// //             Expanded(
// //               child: Container(
// //                 height: 600,
// //                 width: 400,
// //                 child: Card(
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12)),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(16.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: const [
// //                         Text("Email : jonathan123@gmail.com"),
// //                         SizedBox(height: 8),
// //                         Text("Phone No : 9876543210"),
// //                         SizedBox(height: 8),
// //                         Text("Address : Floor 8\nStark Towers\nNew York\n123456"),
// //                         SizedBox(height: 8),
// //                         Text("Account created on : 12/12/2023"),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const Spacer(),
// //             ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color(0xFFE8C48C),
// //                 minimumSize: const Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(12)),
// //               ),
// //               onPressed: () {},
// //               child: const Text(
// //                 "Logout",
// //                 style: TextStyle(color: Colors.black),
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             TextButton(
// //               onPressed: () {},
// //               child: const Text(
// //                 "Delete Account",
// //                 style: TextStyle(color: Colors.red),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class EditProfile extends StatefulWidget {
// //   const EditProfile({super.key});

// //   @override
// //   State<EditProfile> createState() => _EditProfileState();
// // }

// // class _EditProfileState extends State<EditProfile> {
// //   final TextEditingController nameController =
// //       TextEditingController(text: "John Wick");
// //   final TextEditingController emailController =
// //       TextEditingController(text: "jonathan123@gmail.com");
// //   final TextEditingController phoneController =
// //       TextEditingController(text: "9876543210");
// //   final TextEditingController addressController =
// //       TextEditingController(text: "ABC def\nabc building\n000111");

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F5F5),
// //       appBar: AppBar(
// //         title: const Text("Edit Profile"),
// //         centerTitle: true,
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Color(0xFF032B57), Color(0xFF035781)],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             Column(
// //               children: const [
// //                 CircleAvatar(
// //                   radius: 50,
// //                   backgroundImage: NetworkImage(
// //                       "https://upload.wikimedia.org/wikipedia/en/9/90/John_Wick_Keanu.jpeg"),
// //                 ),
// //                 SizedBox(height: 5),
// //                 Text("change / delete photo",
// //                     style: TextStyle(color: Colors.black54)),
// //               ],
// //             ),
// //             const SizedBox(height: 20),
// //             TextField(
// //               controller: nameController,
// //               decoration: const InputDecoration(
// //                 labelText: "Name",
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             TextField(
// //               controller: emailController,
// //               decoration: const InputDecoration(
// //                 labelText: "Email",
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             const SizedBox(height: 12),
// //             Row(
// //               children: [
// //                 SizedBox(
// //                   width: 60,
// //                   child: TextField(
// //                     decoration: const InputDecoration(
// //                       labelText: "+91",
// //                       border: OutlineInputBorder(),
// //                     ),
// //                     enabled: false,
// //                   ),
// //                 ),
// //                 const SizedBox(width: 8),
// //                 Expanded(
// //                   child: TextField(
// //                     controller: phoneController,
// //                     decoration: const InputDecoration(
// //                       labelText: "Mobile Number",
// //                       border: OutlineInputBorder(),
// //                     ),
// //                     keyboardType: TextInputType.phone,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 12),
// //             TextField(
// //               controller: addressController,
// //               maxLines: 3,
// //               decoration: const InputDecoration(
// //                 labelText: "Address",
// //                 border: OutlineInputBorder(),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color(0xFFE8C48C),
// //                 minimumSize: const Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(12)),
// //               ),
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //               child: const Text(
// //                 "Save",
// //                 style: TextStyle(color: Colors.black),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(ContactUsApp());
// }

// class ContactUsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Contact(),
//     );
//   }
// }

// class Contact extends StatelessWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF3E5D3), // Light beige background
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//              colors: [Color(0xFF032B57), Color(0xFF035781)],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {},
//         ),
//         title: const Text(
//           "Contact Us",
//           style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
//         ),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Name
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: "Name",
//                   labelStyle: TextStyle(color: Colors.black),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Email
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   labelStyle: TextStyle(color: Colors.black),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),

//               // Message
//               TextField(
//                 controller: messageController,
//                 maxLines: 3,
//                 decoration: const InputDecoration(
//                   labelText: "Message",
//                   labelStyle: TextStyle(color: Colors.black),
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Send Button
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black87,
//                     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                   ),
//                   onPressed: () {
//                     // Send logic
//                   },
//                   child: const Text("SEND", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Info
//               const Text(
//                 "Info",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               const SizedBox(height: 15),

//               Row(
//                 children: const [
//                   Icon(Icons.print, color: Colors.black, size: 28),
//                   SizedBox(width: 10),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: const [
//                   Icon(Icons.phone, color: Colors.black, size: 28),
//                   SizedBox(width: 10),
//                   Text("+123 456 789", style: TextStyle(fontSize: 16, color: Colors.black)),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: const [
//                   Icon(Icons.apartment, color: Colors.black, size: 28),
//                   SizedBox(width: 10),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
