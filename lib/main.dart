import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mountdate/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Osman Heybel Aylık',
      home: MyHomePage(title: 'Osman Heybel Aylık Sütleri'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List users = [];
  late bool loading = true;

  final url = Uri.parse(
      "https://script.googleusercontent.com/macros/echo?user_content_key=aeYX8NKpIHUIa60JHpPnRuliFBCA5BlW1tr1Tg3Bj69yzihfIw3bPWjY2UDKGpfnzx9DDgSmSaCnOPvfeb3ADjH92ys4gMDFm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnMysObf_WhhiJ2bDlEq_GMdWMcgXFbIL5O28qAXoraCzgcgsGElyKqNghFUQglubvC1IxuiWfxr63jnXxhsE5WebKYRSSTCV5tz9Jw9Md8uu&lib=Mdc1SQqMgTEq9NC0MmHrIozfife_5M1tH");

  Future readData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        users = result['user'];
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Divider(),
              Card(
                color: Colors.blueGrey,
                child: ListTile(
                  subtitle: Text(
                    users[index]['zamanDamgasi'],
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Center(
                    child: Text(
                      users[index]['sttoplayici'],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  trailing: Text(
                    users[index]['miktar'].toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );;
        },
      ),
    );
  }
}
