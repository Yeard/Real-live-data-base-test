import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatelessWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = new TextEditingController();
    TextEditingController email = new TextEditingController();
    TextEditingController mobile = new TextEditingController();

    Future<String> senddata() async {
      final response = await http
          .post(Uri.parse("https://onetiger.xyz/insertdata.php"), body: {
        "name": name.text,
        "email": email.text,
        "mobile": mobile.text,
      });
      return response.body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Username",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                Text(
                  "Mobile",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: mobile,
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                RaisedButton(
                  child: Text("Register"),
                  onPressed: () {
                    senddata();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).pushNamed('/AddData');
          //Navigator.pushNamed(context, '/AddData');
          Navigator.pushReplacementNamed(context, '/');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
