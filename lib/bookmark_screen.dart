import 'package:departure/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
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
          'Book Mark',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.brown.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              width: width,
              child: ListView.builder(
                itemCount: proVar.bookMarkList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.brown.shade700),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            proVar.bookMarkList[index].slock!,
                            style: TextStyle(
                                fontSize: 20, color: Colors.brown.shade700),
                          ),
                          IconButton(
                              onPressed: () {
                                proVar.removebookmark(index);
                              },
                              icon: Icon(
                                Icons.close,
                                size: 26,
                                color: Colors.brown.shade700,
                              ))
                        ],
                      ),
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
