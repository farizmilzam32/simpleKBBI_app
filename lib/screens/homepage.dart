import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kbbi_app/screens/secondpage.dart';

late String kata;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SIMPLE KBBI APP',
              style: TextStyle(fontSize: 50, fontFamily: 'Roboto'),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/flame-158.png',
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                onChanged: (value) {
                  kata = value;
                },
                decoration: InputDecoration(
                    labelText: 'Masukkan Kata',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.red),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondPage(kata: kata)));
                },
                icon: Icon(
                  Icons.search,
                  size: 18,
                ),
                label: Text('Cari'))
          ],
        ),
      ),
    );
  }
}
