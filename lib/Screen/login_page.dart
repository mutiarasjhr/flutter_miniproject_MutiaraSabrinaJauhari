import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String username = '';
  String email = '';
  String password = '';

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  late SharedPreferences loginData;
  late bool newUser;
  var formKey = GlobalKey<FormState>();

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => const HomePage()),
      //     (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // physics: const ScrollPhysics(),
        child: SizedBox(
          height: 1000,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              textWelcome(context),
              SizedBox(height: 15),
              formWidget(context),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: MaterialButton(
                      height: 50,
                      minWidth: 150,
                      color: Color.fromARGB(255, 125, 141, 135),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "LOGIN",
                        style: GoogleFonts.lora(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();

                        String username = usernameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        loginData.setBool('login', false);
                        loginData.setString('username', username);
                        loginData.setString('email', email);
                        loginData.setString('password', password);
                        if (isValid) {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     PageRouteBuilder(
                          //       transitionDuration: const Duration(seconds: 1),
                          //       pageBuilder:
                          //           (context, animation, secondaryAnimation) =>
                          //               const HomePage(),
                          //       transitionsBuilder: (context, animation,
                          //           secondaryAnimation, child) {
                          //         return SlideInUp(child: child);
                          //       },
                          //     ),
                          //     (route) => false);
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textWelcome(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Welcome',
                style: GoogleFonts.pacifico(
                    fontSize: 50,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54)),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Login for Explore YourMua App',
              style: GoogleFonts.lora(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget formWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    onChanged: (String value) {
                      username = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username tidak boleh kosong";
                      }
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(95, 53, 53, 63)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Username'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      var _isValid =
                          EmailValidator.validate(emailController.text);
                      if (!_isValid) {
                        return "Email harus terdapat @";
                      }
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(95, 53, 53, 63)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Alamat Email'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (passwordController.text.length <= 8) {
                        return "Password minimal 8 karakter";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(95, 53, 53, 63)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Password'),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
