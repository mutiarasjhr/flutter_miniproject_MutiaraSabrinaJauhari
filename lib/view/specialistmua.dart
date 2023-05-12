import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourmuaa/view/detailmua.dart';
import 'package:yourmuaa/api/api_mua.dart';
import 'package:yourmuaa/model/mua.dart';
import 'package:yourmuaa/view_model/muaprovider.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialistPage extends StatefulWidget {
  const SpecialistPage({super.key});

  @override
  State<SpecialistPage> createState() => _SpecialistPageState();
}

class _SpecialistPageState extends State<SpecialistPage> {
  late Future<List<Specialist>> _specialist;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<MuaProvider>(context, listen: false).fetchProductList());
    // _specialist = ApiMua.getSpecialist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 141, 135),
        title: Text('Spesialist Mua',
            style: GoogleFonts.aleo(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: Consumer<MuaProvider>(builder: ((context, muaprov, child) {
        if (muaprov.requestState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: muaprov.listmua.length,
            itemBuilder: (context, index) {
              final mua = muaprov.listmua[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 1),
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                DetailMuaPage(
                                    byId: int.parse(mua.id.toString())),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideInUp(child: child);
                            },
                          ),
                        );
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              SizedBox(
                                height: 60,
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(mua.avatar.toString()),
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text(
                                    mua.name.toString(),
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            });
      })),
    );
  }
}
