import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Me Profile',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text(
                  'New Data',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: (){
                      return Navigator.pop(context);
                    },
                    child: const Text(
                      'New'
                    ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
