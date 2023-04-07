import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

class _FirstScreenState extends State<FirstScreen> {
  late String _selectedOption;
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedOption = _options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
              value: _selectedOption,
              items: _options.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (selectedOption) {
                setState(() {
                  _selectedOption = selectedOption!;
                });
              },
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: textController,
                textAlign: TextAlign.center,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Enter Text here',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondScreen(selectedOption: _selectedOption, textValue: textController.text,),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}



class SecondScreen extends StatelessWidget {
  final String selectedOption;
  final String textValue;

  const SecondScreen({super.key, required this.selectedOption, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selected option: $selectedOption', style: const TextStyle(fontSize: 20)),
            Text('Written Text: $textValue', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}