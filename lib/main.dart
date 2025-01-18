import 'package:flutter/material.dart';
import 'package:singleton/sequence_generator.dart';

import 'base_logger.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: "1",),
                Tab(text: "2",),
                Tab(text: "3",)
              ],
            ),
            title : const Text("Singleton Sequence Generator"),
          ),
          body: const TabBarView(
            children: [
              SequencePage(),
              SequencePage(),
              SequencePage()
            ],
          ),
        ),
      ),
    );
  }
}

class SequencePage extends StatefulWidget {
  const SequencePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SequencePage();
  }
}

class _SequencePage extends State<SequencePage>{
  void _incrementCounter(){
    setState(() {
      SequenceGenerator().getNextNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Last sequence Number: '),
            Text('${SequenceGenerator().getCurrentNumber()}',style: Theme.of(context).textTheme.headlineLarge,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _incrementCounter,
          label: const Text('Generate Next Number'),
          icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}