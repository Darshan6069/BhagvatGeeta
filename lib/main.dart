
import 'package:departure/home_screen.dart';
import 'package:departure/provider.dart';
import 'package:departure/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonProvider(),
        )
      ],
      child: Consumer<JsonProvider>(
        builder: (context,theme,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: (theme.istheme==true)?ThemeData.dark():ThemeData.light(useMaterial3: true),
            home: SplashScreen(),
          );
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLanguage = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final proVar = Provider.of<JsonProvider>(context, listen: true);

    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/bgiamge.jpg',
                ),
                fit: BoxFit.cover)),
      ),
      Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SELECT A LANGUAGE',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.brown.shade900,
                    fontWeight: FontWeight.w700),
              ),
              Switch(
                thumbColor: MaterialStatePropertyAll(Colors.brown.shade700),
                  activeTrackColor: Colors.white,
                  value: proVar.getTheme,
                  onChanged: (value) {
                    proVar.setTheme = value;
                  })

            ],
          ),
          SizedBox(
            height: height - 230,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(isLan: true),));
                },
                child: Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.brown.shade900,
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'ENGLISH',
                      style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen(isLan: false),));

                },
                child: Container(
                  height: 70,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.brown.shade900,
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'HINDI',
                      style: TextStyle(
                          fontSize: 29,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ]));
  }
}
