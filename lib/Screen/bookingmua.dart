import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:yourmuaa/Screen/specialistmua.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 141, 135),
        title: Text('Booking Your Specialist',
            style: GoogleFonts.aleo(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDatePicker(context),
            const SizedBox(height: 10),
            TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SpecialistPage()));
              },
              child: Text(
                'NEXT',
                style: GoogleFonts.roboto(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 125, 141, 135)),
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
                      color: Color.fromARGB(255, 21, 58, 33))),
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
                color: Color.fromARGB(255, 51, 90, 64))),
      ],
    );
  }
}
