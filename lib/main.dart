import 'package:flutter/material.dart';
import 'package:task4_mat_design/bingus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 4 Mat Design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const Color mainColor = Colors.purple;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Index 0: Main Page',
      style: optionStyle,
    ),
    const Text(
      'Index 1: Accept',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Cancel',
      style: optionStyle,
    ),
  ];

  late TabController controller;

  @override
  initState() {
    super.initState();

    controller = TabController(length: _widgetOptions.length, vsync: this);
    controller.addListener(() {
      setState(() {
        _selectedIndex = controller.index;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller.animateTo(index, duration: const Duration(seconds: 5));
    });
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
        title: const Text('Task 4 Material Design'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Text('Example of Drawer Header'),
            ),
            // Soo, this tiles are just placeholders
            // tbh i took them from Drawer docs page
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('BINGUS PAGE'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BingusPreviewPage()));
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'accept',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'cancel',
          ),
        ],
        selectedItemColor: Colors.purple[600],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('This is just an example'),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: mainColor,
        child: const Icon(Icons.check),
      ),
    );
  }
}
