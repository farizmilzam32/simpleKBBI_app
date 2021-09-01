import 'package:flutter/material.dart';
import 'package:kbbi_app/models/kamusmodels.dart';
import 'package:kbbi_app/screens/homepage.dart';
import 'package:kbbi_app/services/api.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required kata}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Future<KamusModels> _kamusModels;
  @override
  void initState() {
    super.initState();
    _kamusModels = API().getKamus(kata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kata),
      ),
      body: Container(
        child: FutureBuilder<KamusModels>(
          future: _kamusModels,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.data.total,
                  itemBuilder: (context, index) {
                    var words = snapshot.data!.data.resultLists[index];
                    return Container(
                      margin: EdgeInsets.all(50),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              words.kata,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(words.arti[0])
                          ],
                        ),
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
