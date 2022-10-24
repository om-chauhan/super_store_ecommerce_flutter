import 'package:super_store/imports.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              TextBuilder(text: 'Create Account', fontSize: 30.0, fontWeight: FontWeight.bold),
              const SizedBox(height: 20.0),
              CustomTextField(labelText: 'Full Name', hintText: 'John Doe', prefixIcon: Icons.person),
              const SizedBox(height: 20.0),
              CustomTextField(labelText: 'Email', hintText: 'example@example.com', prefixIcon: Icons.email),
              const SizedBox(height: 20.0),
              CustomTextField(labelText: 'Password', hintText: 'Password', prefixIcon: Icons.lock),
              const SizedBox(height: 20.0),
              CustomTextField(labelText: 'Confirm Password', hintText: 'Confirm Password', prefixIcon: Icons.lock),
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
                    text: 'Sign Up',
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
                    text: "Have have an account? ",
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: TextBuilder(
                      text: 'Sign In',
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
}
