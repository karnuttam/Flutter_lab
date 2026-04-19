import 'package:flutter/material.dart';

void main() {
  runApp(MySecondApp());
}

class MySecondApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        appBar: AppBar(title: Text("extendBody Example")),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFabdd02)),
          child: Image.network(
            "http://picsum.photos/250",
            width: 200,
            height: 200,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
            color: Colors.blue.withValues(alpha: 0.2),
            colorBlendMode: BlendMode.overlay,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
            semanticLabel: "Sample Image",
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white.withValues(alpha: 0.8),
          shape: CircularNotchedRectangle(),
          child: SizedBox(height: 60),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
