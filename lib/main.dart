import 'package:event_sheduler/new_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Event Scheduler',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Scheduler'),
        centerTitle: false,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Container(
                  height: 60,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      events[index],
                      style: const TextStyle(
                        fontFamily: ('Roboto'),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                trailing: Expanded(
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                    ),
                    color: Colors.deepPurple,
                    onPressed: () {
                      setState(() {
                        events.remove(events[index]);
                      });
                    },
                  ),
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addANewEvent(context);
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addANewEvent(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewEvent(),
        ));

    setState(() {
      events.add(result);
    });
  }
}
