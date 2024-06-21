import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Model/Answer.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const appTitle = 'Flutter App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String onn = 'On';
  String huvilbar = 'Huvilbar';
  String asuulttoo = 'Asuulttoo';

  final List<String> _dropdownValues1 = ['On', '2021', '2022', '2023', '2024'];
  final List<String> _dropdownValues2 = ['Huvilbar', 'A', 'B', 'C', 'D', 'E'];
  final List<String> _dropdownValues3 = ['Asuulttoo', '5', '10', '15', '20', '25', '30'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          color: Colors.white,
          iconSize: 30,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildDropdownButton(onn, _dropdownValues1, (newValue) {
                  setState(() {
                    onn = newValue!;
                  });
                }),
                _buildDropdownButton(huvilbar, _dropdownValues2, (newValue) {
                  setState(() {
                    huvilbar = newValue!;
                  });
                }),
                _buildDropdownButton(asuulttoo, _dropdownValues3, (newValue) {
                  setState(() {
                    asuulttoo = newValue!;
                  });
                }),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              width: 500,
              height: 500,
              child: Lottie.asset('../assets/sandbox.json'), // Ensure this path is correct and the file is listed in pubspec.yaml
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 56, 2, 34), Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(
                        onn: int.parse(onn),
                        huvilbar: huvilbar,
                        asuulttoo: int.parse(asuulttoo),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "PLAY QUIZ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _buildDropdownButton(
    String selectedValue,
    List<String> dropdownValues,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButton<String>(
      dropdownColor: Colors.black,
      iconEnabledColor: Colors.white,
      value: selectedValue,
      onChanged: onChanged,
      items: dropdownValues.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: Colors.white)),
        );
      }).toList(),
    );
  }
}
