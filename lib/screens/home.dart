import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:query_generator/api/gpt3.dart';
import 'package:query_generator/constants/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:query_generator/screens/result.dart';
import 'dart:convert';

import '../constants/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String genQueryURL = "";
  String exQueryURL = "";
  String genResult = "Result will be shown here";
  String exResult = "Result will be shown here";

  var jsonTable = [];
  var data;
  var exData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: const [
              FaIcon(FontAwesomeIcons.github),
              SizedBox(width: 10),
              Text("GitHub Repo"),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                color: Colors.white,
              )),
          const SizedBox(
            width: 5,
          ),
          PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: "About",
                    child: Text("About"),
                  ),
                ];
              },
              padding: EdgeInsets.zero,
              offset: const Offset(20, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onSelected: (value) {
                if (value == "About") {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("About Querify"),
                          content: const Text(CustomText.aboutQuerify),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"))
                          ],
                        );
                      });
                }
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                MediaPath.titleImage,
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Enter your query',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) => genQueryURL =
                              "${CustomText.genQueryUrl}write sql statement:$value",
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: IconButton(
                          onPressed: () async {
                            data = await getQuery(genQueryURL);
                            setState(() {
                              genResult = data;
                            });
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                genResult,
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () async {
                    exQueryURL = "${CustomText.exQueryUrl}$genResult";
                    exData = await getQuery(exQueryURL);
                    setState(() {
                      exResult = exData;
                    });
                    jsonTable = jsonDecode(exResult);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryResult(
                          jsonTable: jsonTable,
                        ),
                      ),
                    );
                  },
                  child: Text("Execute Query")),
            ],
          ),
        ),
      ),
    );
  }
}
