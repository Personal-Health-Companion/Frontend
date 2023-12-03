import 'package:capstonedesign_23_2/providers/HospitalList.dart';
import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'providers/Hospital.dart';
import 'apis/hospitalAPI.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '                 Hospitals',
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      body: HospitalPanel(),
    );
  }
}

class HospitalPanel extends StatefulWidget {
  const HospitalPanel({Key? key}) : super(key: key);

  @override
  State<HospitalPanel> createState() => _HospitalPanelState();
}

class _HospitalPanelState extends State<HospitalPanel> {

  TextEditingController Search = TextEditingController();

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<HospitalList>().updateHospitalList(15);
  }


  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: Search,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF9F9FB),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      labelText: "찾고 싶으신 병원을 입력해주세요."
                  ),
                ),
                flex: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  width: 80,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<HospitalList>().updateSearchHospitalList(user.Id, Search.text);
                    },
                    child: Text("검색"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<HospitalList>(
            builder: (context, hospitalList, child) {
              return ListView.builder(
                itemCount: hospitalList.allHospital.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Flexible(child: Text(hospitalList.allHospital[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,)),
                              Text(" | "),
                              Text(hospitalList.allHospital[index].code, style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  var telephoneUrl = "tel:${hospitalList.allHospital[index].telephone}";
                                  if (await canLaunch(telephoneUrl)) {
                                    await launch(telephoneUrl);
                                  } else {
                                    throw 'Could not launch $telephoneUrl';
                                  }
                                },
                                child: Icon(Icons.call),
                              ),
                              Text(" " + hospitalList.allHospital[index].telephone, style: TextStyle(fontSize: 18), maxLines: 2, overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    hospitalList.allHospital[index].address,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

