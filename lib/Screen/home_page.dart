import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yourmuaa/Screen/login_page.dart';
import 'package:yourmuaa/Screen/bookingmua.dart';
import 'package:yourmuaa/data_layanan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 141, 135),
        title: Text('Your Make-Up Artist',
            style: GoogleFonts.aleo(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookingPage()),
                );
              },
              child: SizedBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: layanan.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                Image.asset(layanan[index], fit: BoxFit.cover),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
    // bottomNavigationBar: const BottomBar();
  }
}

// class BottomBar extends StatelessWidget {
//   const BottomBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.white,
//       backgroundColor: Color.fromARGB(255, 125, 141, 135),
//       showSelectedLabels: true,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.home,
//             color: Colors.white,
//           ),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.person,
//             color: Colors.white,
//           ),
//           label: 'Account',
          // activeIcon: AlertDialog(
          //   title: Center(
          //     child: Text('Are You Sure want to LogOut this App?'),
          //   ),
          //   actions: [
          //     TextButton(
          //         onPressed: () {
          //           Navigator.pushAndRemoveUntil(
          //               context,
          //               MaterialPageRoute(builder: (context) => LoginPage()),
          //               (route) => false);
          //         },
          //         child: const Text('Ya')),
          //     TextButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('No'))
          //   ],
          // )
//         ),
//       ],
//     );
//   }
// }
