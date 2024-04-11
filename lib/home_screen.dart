import 'package:departure/bookmark_screen.dart';
import 'package:departure/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isLan;

  const HomeScreen({super.key, required this.isLan});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isload = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final proVar = Provider.of<JsonProvider>(context, listen: false);
    setState(() {
      isload = true;
    });
    proVar.loadJsonData().then((value) {
      setState(() {
        isload = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final proVar = Provider.of<JsonProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },icon: Icon(CupertinoIcons.back,size: 28,color: Colors.white,)),
        title: Text(
          'Slock A Day',
          style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookMarkScreen(),));
          }, icon: Icon(Icons.menu,size: 26,color: Colors.white,))
        ],
        backgroundColor: Colors.brown.shade700,
      ),
      body: (isload == true)
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height - 90,
                    width: width,
                    child: ListView.builder(
                      itemCount: proVar.bhagvatList.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 55.0,
                                right: 6.0,
                                top: 9.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => detailScreen(
                                        chp_name: (widget.isLan == true)
                                            ? proVar.bhagvatList[index]
                                                .chapterNameEg
                                            : proVar.bhagvatList[index]
                                                .chapterNameHn,
                                        verseList:
                                            proVar.bhagvatList[index].verses, language: widget.isLan,),
                                  ));
                                },
                                child: Container(
                                  height: 127,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.brown.shade800),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 70.0, top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        (widget.isLan == true)
                                            ? Text(
                                                proVar.bhagvatList[index]
                                                    .chapterNameEg,
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              )
                                            : Text(
                                                proVar.bhagvatList[index]
                                                    .chapterNameHn,
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    color: Colors.white,
                                                fontWeight: FontWeight.bold
                                                ),
                                              ),
                                        Text(
                                          'Chapter No: ${proVar.bhagvatList[index].chapterId.toString()}',
                                          style: TextStyle(color: Colors.white,fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    proVar.bhagvatList[index].image),
                                radius: 57,
                              ),
                            )
                          ],
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
