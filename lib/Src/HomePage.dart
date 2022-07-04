import 'package:flutter/material.dart';

import 'ProfilePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String firstName ='';
  String lastName ='';
  String bodyTemp ='';
  var measure;

  void _submit(){
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text(
            'Your information has been submitted!',
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Full Name: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    firstName+' '+lastName
                  ),
                ),
                const SizedBox(height: 10,),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Body Temperature:",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("$bodyTemp ${measure == 1 ? "ºC" : "ºF"}"),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                    ),
                  ),
                  child: const Text(
                    'Go to profile',
                  ),
                  onPressed: ()async{
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return MyProfilePage();
                        }
                      )
                    ).then((_) => _formKey.currentState?.reset());
                },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(
                    'OK',
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                    _formKey.currentState?.reset();
                    setState((){
                    });
                  },
                ),
                //TextButton(
                //                   style: TextButton.styleFrom(
                //                     primary: Colors.white,
                //                     backgroundColor: Colors.blue,
                //                     shape: const RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.all(Radius.circular(10)),
                //                     ),
                //                   ),
                //                   child: const Text(
                //                     'OK',
                //                   ),
                //                   onPressed: (){
                //                     Navigator.of(context).pop();
                //                     FocusScope.of(context).unfocus();
                //                     _formKey.currentState?.reset();
                //                   },
                //                 ),
              ],
            )
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Form Flutter',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle_rounded,
              size: 32,
            ),
            tooltip: 'Profile',
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return MyProfilePage();
                  }
                )
              );
            },
          ),
        ],
      ),
     body: Padding(
       padding: const EdgeInsets.all(16),
       child: Column(
         children: <Widget>[
           const Align(
             alignment: Alignment.topLeft,
             child: Text(
               'Enter your data',
               style: TextStyle(
                 fontSize: 24
               ),
             ),
           ),
           const SizedBox(
             height: 20,
           ),
           Form(
             key: _formKey,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 TextFormField(
                   decoration: const InputDecoration(
                     labelText: 'First Name',
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(
                         Radius.circular(20)
                       ),
                       borderSide: BorderSide(
                         color: Colors.grey,
                         width: 0.0,
                       ),
                     ),
                     border: OutlineInputBorder(),
                   ),
                   onFieldSubmitted: (value){
                     setState((){
                       firstName = value.capitalize();
                     });
                   },
                   onChanged: (value){
                     setState((){
                       lastName = value.capitalize();
                     });
                   },
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 TextFormField(
                   decoration: const InputDecoration(
                     labelText: 'Body Temperature',
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(
                         color: Colors.grey,
                         width: 0.0,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                     ),
                     border: OutlineInputBorder(),
                   ),
                   keyboardType: TextInputType.number,
                   validator: (value){
                     if(value == null || value.isEmpty || value.contains(RegExp(r'^[a-zA-Z\-]'))){
                       return 'Use only numbers!';
                     }
                   },
                   onFieldSubmitted: (value){
                     setState((){
                       bodyTemp = value;
                     });
                   },
                   onChanged: (value){
                     setState((){
                       bodyTemp = value;
                     });
                   },
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 DropdownButtonFormField(
                   decoration: const InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                       borderSide: BorderSide(
                         color: Colors.grey,
                         width: 0.0,
                       ),
                     ),
                     border: OutlineInputBorder(),
                   ),
                   items: [
                     const DropdownMenuItem(
                       child: Text('ºC'),
                       value: 1,
                     ),
                     const DropdownMenuItem(
                       child: Text('ºF'),
                       value: 2,
                     ),
                   ],
                   hint: const Text(
                     'Select Item',
                   ),
                   onChanged: (value){
                     setState((){
                       measure = value;
                     });
                   },
                   onSaved: (value){
                     setState((){
                       measure = value;
                     });
                   },
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     minimumSize: const Size.fromHeight(60)
                   ),
                   onPressed: (){
                     if(_formKey.currentState!.validate()){
                       _submit();
                     }
                   },
                   child: const Text(
                     'Submit'
                   ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
    );
  }
}

extension StringExtenstion on String{
  String capitalize(){
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
