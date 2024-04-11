import 'package:departure/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_it/share_it.dart';

import 'modelclass.dart';

class detailScreen extends StatefulWidget {
  final List<Verse> verseList;
  final String? chp_name;
  final bool language;

  detailScreen({
    super.key,
    required this.chp_name,
    required this.verseList,
    required this.language,
  });

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final proVar = Provider.of<JsonProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              CupertinoIcons.back,
              size: 28,
              color: Colors.white,
            )),
        title: Text(
          widget.chp_name!,
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.brown.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height - 90,
              width: width,
              child: ListView.builder(
                itemCount: widget.verseList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.brown.shade700, width: 2),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Verse : ${widget.verseList[index].verseId.toString()}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.brown.shade800),
                                ),
                                Divider(
                                  color: Colors.brown.shade800,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.verseList[index].verse,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.brown.shade800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.brown.shade800,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: (widget.language == true)
                                      ? Text(
                                          widget.verseList[index].commentaryEg,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.brown.shade800),
                                        )
                                      : Text(
                                          widget.verseList[index].commentaryHn,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.brown.shade800),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.brown.shade800,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    proVar.addbookmark(
                                        widget.verseList[index].verse);
                                    setState(() {
                                      const SnackBar(width: 30,
                                          content: Text('ADD to Bookmark'));
                                    });
                                  },
                                  icon: Icon(
                                    Icons.bookmark_add,
                                    size: 28,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    ShareIt.text(
                                      content: widget.verseList[index].verse,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    size: 28,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
