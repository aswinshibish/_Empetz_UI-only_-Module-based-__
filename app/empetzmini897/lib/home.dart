
// import 'package:empetzmini897/contact.dart';
// import 'package:empetzmini897/notification.dart';
// import 'package:empetzmini897/petpage.dart';
// import 'package:empetzmini897/sellerhistory.dart';
// import 'package:flutter/material.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List catagory = [
//     {'id': '1', 'name': 'Dogs', 'imagePath': 'https://via.placeholder.com/100'},
//     {'id': '2', 'name': 'Cats', 'imagePath': 'https://via.placeholder.com/100'},
//     {'id': '3', 'name': 'Birds', 'imagePath': 'https://example.com/bird.jpg'},
//     // Add more static categories as needed
//   ];
//   String userName = 'Guest'; // Default username
//   String userAvatar = 'lib/image/pet1.jpg'; // Default avatar

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();  
//   }

//   Future<void> _loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
    
//     // Get locally stored username
//     String? localUsername = prefs.getString('username');
//     if (localUsername != null) {
//       setState(() {
//         userName = localUsername;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.white),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Mynotification()),
//                 );
//               },
//               icon: Icon(Icons.notifications),
//             ),
//           ],
//           bottom: TabBar(
//             tabs: [
//               Text(
//                 'BUYER',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Cursive',
//                 ),
//               ),
//               Text(
//                 'SELLER',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Cursive',
//                 ),
//               ),
//             ],
//           ),
//           title: Padding(
//             padding: const EdgeInsets.only(left: 90.0),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Home",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Cursive',
//                 ),
//               ),
//             ),
//           ),
//           backgroundColor: Color.fromARGB(255, 3, 44, 91),
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: const EdgeInsets.all(0),
//             children: [
//               DrawerHeader(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color(0xFF032B57), Color(0xFF035781)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                 ),
//                 margin: EdgeInsets.zero,
//                 padding: EdgeInsets.zero,
//                 child: SafeArea(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(4),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.white, width: 3),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black38,
//                               blurRadius: 8,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: CircleAvatar(
//                           radius: 42,
//                           backgroundImage: AssetImage(userAvatar),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Flexible(
//                         child: Text(
//                           userName,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'Cursive',
//                             shadows: [
                              
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                   child: ListTile(
//                     leading: Icon(Icons.person, color: Color(0xFF032B57)),
//                     title: Text(
//                       'My Profile',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Cursive',
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                   child: ListTile(
//                     leading: Icon(Icons.favorite, color: Color(0xFF032B57)),
//                     title: Text(
//                       'Favorite',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Cursive',
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Favorite()));
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                   child: ListTile(
//                     leading: Icon(Icons.phone, color: Color(0xFF032B57)),
//                     title: Text(
//                       'Contact',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Cursive',
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                   child: ListTile(
//                     leading: Icon(Icons.book, color: Color(0xFF032B57)),
//                     title: Text(
//                       'About Us',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Cursive',
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // BUYER TAB - Grid view of categories
//             catagory.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : GridView.builder(
//                     itemCount: catagory.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2),
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Mypets(
//                                 categoryId: catagory[index]['id'].toString(),
//                                 categoryName: catagory[index]['name'],
//                               ),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           child: Image.network(
//                             catagory[index]['imagePath'],
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//             UserPostedPetsScreen()
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color.fromARGB(255, 3, 44, 91),
//         centerTitle: true,
//         title: Text('Profile', style: TextStyle(color: Colors.white, fontFamily: 'Cursive')),
//       ),
//     );
//   }
// }

// class Favorite extends StatelessWidget {
//   const Favorite({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color.fromARGB(255, 3, 44, 91),
//         centerTitle: true,
//         title: Text('Favorite', style: TextStyle(color: Colors.white, fontFamily: 'Cursive')),
//       ),
//     );
//   }
// }

// class About extends StatelessWidget {
//   const About({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Color.fromARGB(255, 3, 44, 91),
//         centerTitle: true,
//         title: Text('About', style: TextStyle(color: Colors.white, fontFamily: 'Cursive')),
//       ),
//     );
//   }
// }
import 'package:empetzmini897/contact.dart';
import 'package:empetzmini897/notification.dart';
import 'package:empetzmini897/petpage.dart';
import 'package:empetzmini897/sellerhistory.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List catagory = [
    {'id': '1', 'name': 'Cats', 'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToBZ6A8A4OvEK-Cy_6HlLM96bA-rBi-E0ERA&s'},
    {'id': '2', 'name': 'Dogs', 'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAXJSPZaD2aBKb2pANdG3fkswzc46Ggnol2w&s'},
    {'id': '3', 'name': 'Birds', 'imagePath': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwDpkjRxRfDrOKtc_RQ_wgavbf6_M88XvZbA&s'},
    // Add more static categories as needed
  ];
  
  String userName = 'Guest'; // Default username
  String userAvatar = 'https://via.placeholder.com/150'; // Default avatar URL

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? localUsername = prefs.getString('username');
    if (localUsername != null) {
      setState(() {
        userName = localUsername;
      });
    }
    String? localAvatar = prefs.getString('userAvatar');
    if (localAvatar != null) {
      setState(() {
        userAvatar = localAvatar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Mynotification()));
              },
              icon: const Icon(Icons.notifications),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Text('BUYER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Cursive')),
              Text('SELLER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Cursive')),
            ],
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 90.0),
            child: Text("Home", style: TextStyle(color: Colors.white, fontFamily: 'Cursive')),
          ),
          backgroundColor: const Color.fromARGB(255, 3, 44, 91),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF032B57), Color(0xFF035781)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 42,
                          backgroundImage: NetworkImage(userAvatar),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                        child: Text(
                          userName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cursive',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _drawerTile(context, Icons.person, 'My Profile', const Profile()),
              _drawerTile(context, Icons.favorite, 'Favorite', const Favorite()),
              _drawerTile(context, Icons.phone, 'Contact',  Contact()),
              _drawerTile(context, Icons.book, 'About Us', const About()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            catagory.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: catagory.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
  if (catagory[index]['name'] == 'Cats') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CatsScreen()),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Mypets(
          categoryId: catagory[index]['id'].toString(),
          categoryName: catagory[index]['name'],
        ),
      ),
    );
  }
},

                        child: Card(
                          child: Image.network(
                            catagory[index]['imagePath'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
            UserPostedPetsScreen(),
          ],
        ),
      ),
    );
  }

  Widget _drawerTile(BuildContext context, IconData icon, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF032B57)),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Cursive',
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
        ),
      ),
    );
  }
}

// class Profile extends StatelessWidget {
//   const Profile({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return _simpleAppPage(context, 'Profile');
//   }
// }
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
  title: const Text("Profile",style: TextStyle(color: Colors.white),),
  centerTitle: true,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.edit, color: Colors.white,),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EditProfile()),
        );
      },
    )
  ],
  flexibleSpace: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF032B57), Color(0xFF035781)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ),
),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/9/90/John_Wick_Keanu.jpeg"),
            ),
            const SizedBox(height: 10),
            const Text(
              "John Wick",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: 600,
                width: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Email : jonathan123@gmail.com"),
                        SizedBox(height: 8),
                        Text("Phone No : 9876543210"),
                        SizedBox(height: 8),
                        Text("Address : Floor 8\nStark Towers\nNew York\n123456"),
                        SizedBox(height: 8),
                        Text("Account created on : 12/12/2023"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8C48C),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController =
      TextEditingController(text: "John Wick");
  final TextEditingController emailController =
      TextEditingController(text: "jonathan123@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "9876543210");
  final TextEditingController addressController =
      TextEditingController(text: "ABC def\nabc building\n000111");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("Edit Profile",style: TextStyle(color: Colors.white),),
        centerTitle: true,
          leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF032B57), Color(0xFF035781)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/en/9/90/John_Wick_Keanu.jpeg"),
                ),
                SizedBox(height: 5),
                Text("change / delete photo",
                    style: TextStyle(color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "+91",
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: "Mobile Number",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8C48C),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    return _simpleAppPage(context, 'Favorite');
  }
}

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return _simpleAppPage(context, 'About');
  }
}

Widget _simpleAppPage(BuildContext context, String title) {
  return Scaffold(
    appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: const Color.fromARGB(255, 3, 44, 91),
      centerTitle: true,
      title: Text(title, style: const TextStyle(color: Colors.white, fontFamily: 'Cursive')),
    ),
    body: Center(child: Text('$title Page')),
  );
}

class CatsScreen extends StatelessWidget {
  final List<Map<String, String>> cats = [
    {
      "name": "Bella",
      "price": "₹ 5,000",
      "location": "thrissur, kerala",
      "time": "1 hour ago",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5h4v_WmePqbeI7I4jrubOi6cFN39kAlbUrA&s",
      "fav": "true"
    },
    {
      "name": "Lucy",
      "price": "₹ 1,500",
      "location": "kochi, kerala",
      "time": "5 hour ago",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX4EbLlkmCJhmk4LI_PxiTc7OrHEkFE_wjeA&s",
      "fav": "false"
    },
    {
      "name": "Loki",
      "price": "₹ 2,000",
      "location": "kannur, kerala",
      "time": "1 day ago",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv4MTKxKMt1nmnb2So9o_eLOB84OLZN1pfmg&s",
      "fav": "false"
    },
    {
      "name": "Milo",
      "price": "₹ 10,000",
      "location": "kochi, kerala",
      "time": "1 day ago",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIHapIeCiwS7x6LmNiUMsGcyA3R8dgs-nSdQ&s",
      "fav": "true"
    },
    {
      "name": "Leo",
      "price": "₹ 6,500",
      "location": "thrissur, kerala",
      "time": "3 day ago",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNdI01ulN6lWCX-4FQtMUO0QW9VIp_Q_6nsw&s",
      "fav": "false"
    },
    {
      "name": "Oggy",
      "price": "₹ 3,000",
      "location": "thrissur, kerala",
      "time": "1 week ago",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBfRaIl1GKY743VUdBOrL04K4gbgqvDZp3iw&s",
      "fav": "false"
    },
  ];

  CatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("CATS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
       
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
        actions: [
          IconButton(icon: const Icon(Icons.search),color: Colors.white, onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list),color: Colors.white, onPressed: () {}),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF032B57), Color(0xFF035781)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          final cat = cats[index];
          return Card(
            color: const Color(0xFFF0F0F0),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(cat['image']!, width: 55, height: 55, fit: BoxFit.cover),
              ),
              title: Text(cat['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cat['price']!, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(cat['location']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: cat['fav'] == "true" ? Colors.red : Colors.white),
                  Text(cat['time']!, style: const TextStyle(fontSize: 10, color: Colors.black54)),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PetDetailsScreen(
                      name: cat['name']!,
                      price: cat['price']!,
                      location: cat['location']!,
                      image: cat['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PetDetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String image;

  const PetDetailsScreen({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(image, height: 300, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const Positioned(
                top: 40,
                right: 10,
                child: Icon(Icons.favorite, color: Colors.red, size: 28),
              ),
            ],
          ),
          Expanded(
            child: Container(
              
              padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF032B57), Color(0xFF035781)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Persian Cat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                          Text(name, style: const TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w500)),
                          Text(price, style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      Text(location, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoBox("3 months", "Age"),
                      _infoBox("4.3 kg", "Weight"),
                      _infoBox("Male", "Gender"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("Vaccinated on: 10/08/2022", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/44.jpg"),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Mai", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Posted one day ago", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Pet Story", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 8),
                  const Text(
                    "This little sweetie is 3 months year male cat. He has been at the shelter since he was born, and we'd really love to see his get into a new home soon!",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                     
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3A2D33), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          icon: const Icon(Icons.call, color: Colors.white),
                          label: const Text("CALL", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
           
