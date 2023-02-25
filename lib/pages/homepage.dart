import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textcontroller = TextEditingController();
  void copy() async {
    await FlutterClipboard.copy(_textcontroller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        "📝 text Copied to clipboard",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 20),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow[300],
        centerTitle: true,
        title: Text(
          "Text Copier".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(fontSize: 20),
                    controller: _textcontroller,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 20),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 77, horizontal: 10),
                      hintText: 'text',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    top: 5,
                    right: 10,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.copy_outlined,
                          size: 30,
                        ),
                        onPressed: copy,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: copy,
                  child: Text('Copy Text'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
