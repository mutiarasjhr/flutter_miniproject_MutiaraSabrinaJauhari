import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yourmuaa/view/bookingmua.dart';
import 'package:yourmuaa/data_layanan.dart';
import 'package:yourmuaa/model/mua.dart';
import 'package:yourmuaa/view_model/muaprovider.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMuaPage extends StatefulWidget {
  final int byId;
  const DetailMuaPage({super.key, required this.byId});

  @override
  State<DetailMuaPage> createState() => _DetailMuaPageState();
}

class _DetailMuaPageState extends State<DetailMuaPage> {
  late Future<List<Specialist>> _specialist;

  double sliderValue = 1.0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<MuaProvider>(context, listen: false)
        .fetchSingleMua(widget.byId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 125, 141, 135),
          title: const Text('About MUA',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer<MuaProvider>(
                  builder: (context, muaprov, child) {
                    if (muaprov.requestState == RequestState.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (muaprov.requestState == RequestState.loaded) {
                      final mua = muaprov.specialist;
                      muaprov.fetchSingleMua(widget.byId.toString());
                      if (mua != null) {
                        final Image = mua.portofolio.length;
                        return Column(
                          children: [
                            aboutMua(context, mua),
                            priceList(context, mua),
                            priceWed(context, mua),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    } else if (muaprov.requestState == RequestState.error) {
                      return Text(muaprov.message);
                    } else {
                      return const Text('Unknown error');
                    }
                  },
                ),
                buttonBook(context),
              ],
            ),
          ),
        ));
  }

  Widget portofolio(BuildContext context) {
    return Card(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mua1.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          mua1[index],
                          fit: BoxFit.cover,
                        ))
                  ],
                ));
          }),
    );
  }

  Widget aboutMua(BuildContext context, mua) {
    return Card(
      color: Color.fromARGB(255, 233, 237, 236),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mua.name.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
              'Telah Berpengalaman di Bidang Make-Up Artist sejak 5 tahun yang lalu. Dan telah diakui oleh galih Sodiro dan seorang make-Up Artist yangg bersertifikat',
              style: TextStyle(fontSize: 15)),
          Padding(padding: const EdgeInsets.all(5)),
        ],
      ),
    );
  }

  Widget priceList(BuildContext context, mua) {
    return Card(
      color: Color.fromARGB(255, 233, 237, 236),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Pricelist for Party, Graduation, Engagement',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(mua.pricelist.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Free Soflens',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Hair do/ Hijab do',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget priceWed(BuildContext context, mua) {
    return Card(
      color: Color.fromARGB(255, 233, 237, 236),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pricelist for Wedding',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(mua.pricelistwed.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ],
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Free Soflens',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Hair do/ Hijab do',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Touch Up 1 x',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonBook(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 125, 141, 135),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(seconds: 3),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const BookingPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideInDown(child: child);
                }));
      },
      child: Text(
        'Booking Now',
        style: GoogleFonts.roboto(
            fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}
