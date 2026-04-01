import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF24A898)),
      ),
      home: const MyHomePage(title: 'Flutter Project'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 100,

                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TextButton(
                    child: Text("Click"),
                    onPressed: () {
                      print("You clicked the text button!");
                    },
                    onLongPress: () {
                      print("LongPressed!");
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(15),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      print("Elevated Button");
                    },
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  child: OutlinedButton(
                    onPressed: () {
                      print("Outline Button pressed!");
                    },
                    child: Text("Cancel"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: IconButton(
                    onPressed: () {
                      print("Icon Button Pressed");
                    },
                    icon: Icon(Icons.favorite),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Floating Button Pressed!");
                    },
                    child: Icon(Icons.add),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 130,

                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print("Material Button Pressed!");
                    },
                    child: Text("Old Button"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      print("Custom clickable widgets");
                    },
                    child: Container(
                      height: 50,
                      width: 200,

                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text("Custom Button")),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      print("Handle Gestures(tap, swipe,etc");
                    },
                    child: Container(
                      height: 50,
                      width: 100,

                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(child: Text("Tap me")),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 100,

                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    items: [DropdownMenuItem(value: 1, child: Text("One"))],
                    onChanged: (value) {
                      print("Dropdown Button clicked");
                    },
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: ToggleButtons(
                    isSelected: [true, false],
                    children: [Icon(Icons.home), Icon(Icons.settings)],
                    onPressed: (index) {
                      print("Toggle Buttons");
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  padding: EdgeInsets.all(10),
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Option 1")),
                    ],
                  ),
                ),

                Container(child: BackButton()),
                Container(child: CloseButton()),
                Container(
                  child: CupertinoButton(
                    child: Text("ios Button"),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
