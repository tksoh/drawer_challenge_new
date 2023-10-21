import 'custom_drawer_guitar.dart';
import 'package:flutter/material.dart';

import 'custom_drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool flip = false;

  @override
  Widget build(BuildContext context) {
    final actions = [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: IconButton(
          onPressed: () {
            setState(() {
              flip = !flip;
            });
          },
          icon: const Icon(Icons.flip),
        ),
      )
    ];

    AppBar appBar = flip
        ? AppBar(
            actions: actions,
          )
        : AppBar(
            actions: actions,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => CustomDrawer.of(context)?.open(),
                );
              },
            ),
            title: const Text('Hello Flutter Europe'),
          );
    Widget child = MyHomePage(appBar: appBar);
    if (flip) {
      child = CustomGuitarDrawer(child: child);
    } else {
      child = CustomDrawer(child: child);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppBar appBar;

  const MyHomePage({super.key, required this.appBar});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
