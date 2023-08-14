import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Web App'),
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
  List<String> messages = ["", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (String message in messages) Text(message),
              ],
            ),
            ElevatedButton(
                onPressed: (() {
                  final state =
                  js.JsObject.fromBrowserObject(js.context['state']);
                  messages[0] = state['arg0'];
                  messages[1] = state['arg1'];
                  messages[2] = state['arg2'];

                  setState(() {});
                }),
                child: const Text("rebuild")),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'You can see the data from native apps.',
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("data 1: ${messages[0]}"),
                Text("data 2: ${messages[1]}"),
                Text("data 3: ${messages[2]}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
