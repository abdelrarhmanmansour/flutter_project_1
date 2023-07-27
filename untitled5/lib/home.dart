import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  final String email ;
  final String pass ;

  Home({required this.email, required this.pass,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // const Result({Key? key}) : super(key: key);
  trysheard ({required String e,required String p}) async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', e);
    await prefs.setString('pass',p);



    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final String? email = prefs.getString('email');
    final String? pass = prefs.getString('pass');

    print(email);
    print(pass);



  }

  @override

  void initState(){
    super.initState();
    trysheard(e:widget.email,p: widget.pass );


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Print",
          style: TextStyle(fontSize: 22),
        ),

        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 12,),
            const SizedBox(height: 12,),
            Text("Email :${widget.email}",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey

              ),),
            const SizedBox(height: 12,),
            Text(" Pass: ${widget.pass}",
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.grey
              ),),

          ],


        ),
      ),

    );
  }
}
