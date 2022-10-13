import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_table/json_table.dart';

import '../widgets/searchbar.dart';

class QueryResult extends StatefulWidget {
  @override
  State<QueryResult> createState() => _QueryResultState();

  var jsonTable;

  QueryResult({this.jsonTable});
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Expanded(
                    child: JsonTable(
                      widget.jsonTable,
                      showColumnToggle: true,
                      allowRowHighlight: true,
                      rowHighlightColor: Colors.yellow[500]!.withOpacity(0.7),
                      paginationRowCount: 30,
                      onRowSelect: (index, map) {
                        print(index);
                        print(map);
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
