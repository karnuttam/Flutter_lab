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
      home: const MyHomePage(title: 'ListView'),
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
    var names = [
      "Ram",
      "Rohit",
      "Lakshman",
      "Lakhan",
      "John Snow",
      "Tom",
      "Hardy",
      "Scarlett",
      "Johnson",
      "Chrish",
      "Evens",
      "Robert",
      "Downey",
      "Raman",
      "Supriya",
    ];

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
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 22,
        ),
      ),
      body: /*ListView(
        physics: BouncingScrollPhysics(),
        //shrinkWrap: true,//used inside column
        children: [
          ListTile(title: Text("Item 1")),
          ListTile(title: Text("Item 2")),
          ListTile(title: Text("Item 3")),
          ListTile(title: Text("Item 4")),


          Container(height: 100, color: Colors.red),
          Container(height: 100, color: Colors.green),
          Container(height: 100, color: Colors.blue),

        ],
      ),*/
          /*ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          Container(width: 100, color: Colors.red),
          Container(width: 100, color: Colors.green),
          Container(width: 100, color: Colors.blue),
        ],
      ),*/
          /*
          ListView.builder(
            itemCount: 20,

            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("User $index"),
                subtitle: Text("Subtitle $index"),
              );
            },
          ),*/
          /*
          ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) {
              return Divider(thickness: 2);
            },
            itemBuilder: (context, index) {
              return ListTile(title: Text("Item $index"));
            },
          ),*/
          /*
          ListView.custom(
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(title: Text("Custom Item $index"));
            }, childCount: 20),
          ),*/
          ListView.builder(
            scrollDirection: Axis.vertical,
            reverse: false,
            shrinkWrap: false,
            padding: EdgeInsets.all(10),
            itemCount: names.length,
            physics: BouncingScrollPhysics(),

            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(child: Text("$index")),
                  title: Text(names[index]),
                  subtitle: Text("Flutter Developer"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              );
            },
          ),
    );
  }
}
