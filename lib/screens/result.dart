import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/searchbar.dart';

class QueryResult extends StatefulWidget {
  var generatedQuery;

  QueryResult(@required this.generatedQuery);

  @override
  State<QueryResult> createState() => _QueryResultState();
}

class _QueryResultState extends State<QueryResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black87,
        title: SearchBar(),
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
          IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaIcon(
              FontAwesomeIcons.search,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Execute query to show result",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
