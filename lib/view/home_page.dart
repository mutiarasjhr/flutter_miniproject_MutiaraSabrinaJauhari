import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourmuaa/view/specialistmua.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences loginData;
  String username = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
      email = loginData.getString('email').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widgetAkun(context),
          const Padding(padding: EdgeInsets.only(top: 250)),
          SizedBox(
            height: 50,
            width: 180,
            child: buttonNext(context),
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  Widget buttonNext(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 125, 141, 135),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 3),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    // BookingPage(),
                    const SpecialistPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideInDown(child: child);
                }));
      },
      child: Text(
        'MUA',
        style: GoogleFonts.roboto(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }

  Widget widgetAkun(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 125, 141, 135),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        height: 250,
        width: 720,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Your Make Up Artist",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Welcome ",
                style: GoogleFonts.pacifico(
                    fontSize: 50,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 125, 141, 135),
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
