import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourmuaa/Screen/detailmua.dart';
import 'package:yourmuaa/api/api_mua.dart';
import 'package:yourmuaa/model/mua.dart';
import 'package:yourmuaa/view_model/provider.dart';

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
        title: Text('Specialist Mua'),
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
                            MaterialPageRoute(
                                builder: (context) => const DetailMuaPage()));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 60,
                                  child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(mua.avatar.toString()))),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(mua.name.toString()),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              );
            });
        return Text('nodata');
      })),
    );
  }
}
