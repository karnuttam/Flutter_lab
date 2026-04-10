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
      home: const MyHomePage(title: 'Expanded - '),
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
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header (fixed height)
          Container(
            height: 80,
            color: Colors.black,
            alignment: Alignment.center,
            child: Text(
              "Header",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          //Main Body
          Expanded(
            key: ValueKey("mainBody"),
            flex: 8,
            child: Row(
              children: [
                //Sidebar
                Expanded(
                  key: ValueKey("sidebar"),
                  flex: 2,
                  child: Container(
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.blue,
                            child: Center(child: Text("Menu 1")),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.cyan,
                            child: Center(child: Text("Menu 2")),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.teal,
                            child: Center(child: Text("Menu 3")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Main Content Area
                Expanded(
                  key: ValueKey("content"),
                  flex: 6,
                  child: Column(
                    children: [
                      //Top Content
                      Expanded(
                        child: Container(
                          color: Colors.orange,
                          child: Center(child: Text("Top Content")),
                        ),
                      ),
                      //Middle Content(nested Row)
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red,
                                child: Center(child: Text("Left Panel")),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.purple,
                                child: Center(child: Text("Right Panel")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Bottom Content
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                          child: Center(child: Text("Bottom Content")),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Footer
          Container(
            height: 60,
            color: Colors.black87,
            alignment: Alignment.center,
            child: Text("Footer", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
