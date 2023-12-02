import 'package:capstonedesign_23_2/providers/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
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
          '                   Hospitals',
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

class HospitalPanel extends StatelessWidget {
  HospitalPanel({super.key});

  TextEditingController Search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
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
                labelText: "검색할 내용을 입력하세요."
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Hospital>>(
              future: hospitalAPI.getHospitals(user.Id),
              builder: (BuildContext context, AsyncSnapshot<List<Hospital>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF065535), width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(child: Text("    " + snapshot.data![index].name)), // Flexible 위젯 추가
                                    Flexible(child: Text(" | " + snapshot.data![index].code)),  // Fle
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("    "),
                                    InkWell(
                                      onTap: () async {
                                        var telephoneUrl = "tel:${snapshot.data![index].telephone}";
                                        if (await canLaunch(telephoneUrl)) {
                                          await launch(telephoneUrl);
                                        } else {
                                          throw 'Could not launch $telephoneUrl';
                                        }
                                      },
                                      child: Icon(Icons.call),
                                    ),
                                    Text(snapshot.data![index].telephone),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
