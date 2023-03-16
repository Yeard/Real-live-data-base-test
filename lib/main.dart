import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_database_test/model/user.dart';
import 'package:live_database_test/wizerd/add_data.dart';
import './model/user.dart';

void main() => runApp(new MyApp());

String username = '';
String data2 = 'NO data';

List<User> allUser = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',
      home: new MyHomePage(),
      routes: {
        '/AddData': (context) => AddData(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getData() async {
    try {
      var url = 'https://onetiger.xyz/get.php';
      http.Response response = await http.get(Uri.parse(url));

      List<User> users = (json.decode(response.body) as List)
          .map((data) => User.fromJson(data))
          .toList();
      allUser = users;
    } catch (e) {
      print(e);
    }
  }
  //

  void selectCategory(BuildContext ctx) {
    Navigator.pushNamed(context, '/AddData');
  }
  //

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: allUser.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            child: Center(
                child: Text(
                    'Name: ${allUser[index].name}  Email:${allUser[index].email}  Mobile:${allUser[index].mobile}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).pushNamed('/AddData');
          //Navigator.pushNamed(context, '/AddData');
          selectCategory(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
