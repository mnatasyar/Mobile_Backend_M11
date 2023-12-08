import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool _isChecked = false;
  String _selectedRadio = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Semantic")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Aplikasi Semantics buatan Anak Negeri",
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name".i18n(),
                // Semantics for TextField
                semanticsLabel: 'Input your name',
                hint: 'Enter your name here',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.help),
                  title: Text(
                    "Text_call".i18n(),
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () {},
                  // Semantics for ListTile
                  tileSemantics: 'Contact support',
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(
                    "johndoe@test.com",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () {},
                  // Semantics for ListTile
                  tileSemantics: 'Send email',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Checkbox with Semantics
                Semantics(
                  label: 'Agree to terms',
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                ),
                Text('Checkbox-agree'.i18n()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton with Semantics
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Semantics(
                      onTapHint: 'Tap twice to sign in',
                      child: Text("Button-sign-in".i18n()),
                    ),
                  ),
                ),
                // ElevatedButton with Semantics
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Semantics(
                      onTapHint: 'Tap twice to sign out',
                      child: Text("Button-sign-out".i18n()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // FloatingActionButton with Semantics
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: Semantics(
                onTapHint: 'Double tap to add item',
                child: Icon(Icons.add),
              ),
            ),
          ),
          // Radio Button with Semantics
          ListTile(
            title: const Text('Option 1'),
            leading: Semantics(
              label: 'Select option 1',
              child: Radio(
                value: 'Option 1',
                groupValue: _selectedRadio,
                onChanged: (value) {
                  setState(() {
                    _selectedRadio = value.toString();
                  });
                },
              ),
            ),
          ),
          // DropdownButton with Semantics
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              hint: Semantics(
                label: 'Select an option',
                child: Text('Select an option'),
              ),
              value: _selectedRadio.isNotEmpty ? _selectedRadio : null,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRadio = newValue!;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // Chips with Semantics
          Wrap(
            children: <Widget>[
              InputChip(
                label: Semantics(
                  label: 'Lifestyle',
                  child: Text('Lifestyle'),
                ),
                onPressed: () {},
              ),
              InputChip(
                label: Semantics(
                  label: 'Travel',
                  child: Text('Travel'),
                ),
                onPressed: () {},
              ),
              InputChip(
                label: Semantics(
                  label: 'Food',
                  child: Text('Food'),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
