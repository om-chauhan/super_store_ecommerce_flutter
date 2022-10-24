import 'package:super_store/imports.dart';
import 'dart:developer' as dev;

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    dev.log('Splash Init');
    Future.delayed(Duration(seconds: 2)).then((value) => getData());
  }

  getData() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Login()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextBuilder(
              text: 'SUPER',
              color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
              fontSize: 30.0,
            ),
            TextBuilder(
              text: 'STORE',
              color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
              fontSize: 30.0,
            ),
          ],
        ),
      ),
    ));
  }
}
