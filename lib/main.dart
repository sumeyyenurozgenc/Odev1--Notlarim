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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: (){
              print("removed");
            },
          ),
          Icon(Icons.add),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                color: Color(0xffff0000),
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Yazi('Şuanki değer $_counter'),
            Sayac(
                'dışarıdaki değer $_counter',
              ilkDeger:3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
            label: 'Bir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'İki',
          ),
        ],
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  final String icerik;
  const Yazi(this.icerik, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(icerik);
  }
}

class Sayac extends StatefulWidget {
  final String baslik;
  final int ilkDeger;
  const Sayac(this.baslik, {Key? key, required this.ilkDeger}) : super(key: key);

  @override
  State<Sayac> createState() => _SayacState();
}

class _SayacState extends State<Sayac> {
  int sayi = 0;

  @override
  void initState() {
    super.initState();
    sayi = widget.ilkDeger;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          sayi++;
        });
      },
      child: Text(
        '${widget.baslik} içerideki: ${sayi}',
      ),
    );
  }
}


