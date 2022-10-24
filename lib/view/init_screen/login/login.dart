import 'package:super_store/imports.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppName(),
              const SizedBox(height: 30.0),
              TextBuilder(
                text: 'Login',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10.0),
              TextBuilder(
                text: 'Please sign in to continue.',
                fontSize: 15.0,
                color: Colors.black,
              ),
              const SizedBox(height: 20.0),
              CustomTextField(labelText: 'Email', hintText: 'example@example.com', prefixIcon: Icons.email),
              const SizedBox(height: 20.0),
              CustomTextField(labelText: 'Password', hintText: 'Password', prefixIcon: Icons.lock),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: TextBuilder(
                    text: 'Forgot Password',
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Center(
                child: MaterialButton(
                  height: 55.0,
                  color: Colors.black,
                  minWidth: 250,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Home()), (route) => false);
                  },
                  child: TextBuilder(
                    text: 'Login',
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBuilder(
                    text: "Don't have an account? ",
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: TextBuilder(
                      text: 'Sign Up',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
