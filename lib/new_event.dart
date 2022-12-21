import 'package:flutter/material.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Event'),
        centerTitle: false,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple[200],
        ),
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 3, color: Colors.deepPurple,
                    )
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2, color: Colors.deepPurple,
                    )
                  ),
                  labelText: 'Event',
                  labelStyle: TextStyle(
                    color: Colors.deepPurple,
                  ),
                  focusColor: Colors.deepPurple,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 40),
              tileColor: Colors.deepPurple,
              style: ListTileStyle.list,
            ),
            const Spacer(
              flex: 1,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context, myController.text);
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(270, 40),
                backgroundColor: Colors.deepPurple[100],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
              ),
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
