import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller;
  double offset = 0;

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        offset = controller.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: controller,
              itemBuilder: (_, i) => Card(
                child: ExpansionTile(
                  title: Text('Item $i'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Dummy text'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Dummy text'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Dummy text'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Dummy text'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Dummy text'),
                    ),
                  ],
                ),
              ),
              itemCount: 5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 30,
                  child: Text(
                    'Offset: ${offset.toStringAsFixed(1)}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  flex: 35,
                  child: RaisedButton(
                    onPressed: () => controller.jumpTo(0),
                    child: Text('Jump=>0'),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 35,
                  child: RaisedButton(
                    onPressed: () => controller.animateTo(0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear),
                    child: Text('Animate=>0'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
