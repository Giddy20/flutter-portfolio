
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gideon_aigbogun/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gideon Aigbogun',
        transitionDuration: Duration(milliseconds: 500),
        onInit: () {

        },
        home: HomePage(),
      ),
    );
  }

// main() async{
//   debugPrint("${_counter.toString()}sksankasnkkkksknsknaknskn");
// Timer.periodic(Duration(seconds: 1), (_) {
//   _incrementCounter();;
// debugPrint(_counter.toString());
// });
// }
}
