import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube2/lists.dart';
import 'package:youtube2/player.dart';
import 'package:gsheets/gsheets.dart';
import 'sick.dart';
import 'rota.dart';
import 'report_sales.dart';
import 'package:youtube2/gsheets_api.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blue, // navigation bar color
      statusBarColor: Colors.pink, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSheetsApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static String _toDoText = "213";

  final List<Widget> _widgetOptions = <Widget>[
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ]),
          height: 150,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        maxRadius: 50,
                        child: Icon(Icons.face),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sadulla',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Accessories',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Carrefour',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Text(_toDoText = GoogleSheetsApi.read().toString())
            ],
          ),
        ),
        Container(
          height: 150,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.alarm_on),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Clock In ')
                ],
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.alarm_off),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Clock Out')
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.hourglass_top),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Break In')
                ],
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Icon(Icons.hourglass_bottom),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Break Out')
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Builder(
                builder: (context) => ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Rota()));
                  },
                  child: Text('Upload your ROTA'),
                ),
              ),
              Builder(
                builder: (context) => ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sick()));
                  },
                  child: Text('Leave/absent'),
                ),
              ),
              Builder(
                builder: (context) => ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sick()));
                  },
                  child: const Text('Competitor Report'),
                ),
              ),
              Builder(
                builder: (context) => ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sick()));
                  },
                  child: const Text('Report an issue'),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Builder(
            builder: (context) => ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadSales()));
              },
              child: Text('Upload Sales'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: flatButtonStyle,
            onPressed: () {},
            child: Text('Upload Stock'),
          ),
          const SizedBox(
            height: 30,
          ),
          Builder(
            builder: (context) => ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Text('Stock request'),
            ),
          ),
        ],
      ),
    ),
    IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: flatButtonStyle,
            onPressed: () {},
            child: Text('Lazor'),
          ),
          SizedBox(
            height: 30,
          ),
          Builder(
            builder: (context) => ElevatedButton(
              style: flatButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomYoutubePlayer(
                            "https://youtu.be/ZRs7koSSEyU")));
              },
              child: Text('Xiaomi'),
            ),
          ),
        ],
      ),
    ),
  ];

  static var flatButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.blue.shade100,
    onPrimary: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: true,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey.shade600,
              ),
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Logout"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Feedback"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("About App"),
                  ),
                ];
              }),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.blue[700]!,
              hoverColor: Colors.blue[100]!,
              gap: 8,
              activeColor: Colors.blue,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[100]!,
              color: Colors.black38,
              tabs: [
                GButton(
                  icon: Icons.work_outline,
                  text: 'Work',
                ),
                GButton(
                  icon: Icons.post_add,
                  text: 'Sales/Stock',
                ),
                GButton(
                  icon: Icons.school_outlined,
                  text: 'Training',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
