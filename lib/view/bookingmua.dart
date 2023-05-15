import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yourmuaa/view/home_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String nama = '';
  String email = '';
  String number = '';
  var namaController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var radioValue = '';

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 125, 141, 135),
        title: Text('Booking Your Specialist',
            style: GoogleFonts.aleo(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            formInput(context),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            radioButt(context),
            const SizedBox(height: 10),
            buildDatePicker(context),
            const SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                // String nama = namaController.text;
                // String email = emailController.text;
                // String number = numberController.text;
                if (isValid) {
                  _showAlertDialog();
                }
              },
              child: Text(
                'NEXT',
                style: GoogleFonts.roboto(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 125, 141, 135)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: Text('select day',
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 21, 58, 33))),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate),
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: const Color.fromARGB(255, 51, 90, 64))),
      ],
    );
  }

  Widget formInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namaController,
                    onChanged: (String value) {
                      nama = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama harus diisi";
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    onChanged: (String value) {
                      nama = value;
                    },
                    validator: (value) {
                      var _isValid =
                          EmailValidator.validate(emailController.text);
                      if (!_isValid) {
                        return "Email harus terdapat @";
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: numberController,
                    onChanged: (String value) {
                      nama = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nomor telepon harus diisi";
                      } else if (value.length < 10) {
                        return "Nomor minimal 10 digit";
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Phone Number',
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget radioButt(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<String>(
            value: 'Party/Graduation/Engagement',
            groupValue: radioValue,
            onChanged: (String? value) {
              setState(
                () {
                  radioValue = value ?? '';
                },
              );
            },
          ),
          title: const Text('Party/Graduation/Engagement'),
        ),
        ListTile(
          leading: Radio<String>(
            value: 'Wedding',
            groupValue: radioValue,
            onChanged: (String? value) {
              setState(
                () {
                  radioValue = value ?? '';
                },
              );
            },
          ),
          title: const Text('Wedding'),
        )
      ],
    );
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Center(
              child: Text(
                'Booking Success',
                style: GoogleFonts.aleo(fontSize: 20),
              ),
            ),
            content: SizedBox(
              height: 320,
              width: 500,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                        Text(
                          namaController.text,
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                        Text(
                          emailController.text,
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Number',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                        Text(
                          numberController.text,
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Package',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                        Text(
                          radioValue.toString(),
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(_dueDate),
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 125, 141, 135),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 3),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const HomePage(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return SlideInDown(child: child);
                                }));
                      },
                      child: Text(
                        'Close',
                        style: GoogleFonts.roboto(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
