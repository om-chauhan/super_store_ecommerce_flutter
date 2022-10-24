import 'package:super_store/imports.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;

  const CustomTextField({Key? key, required this.labelText, this.hintText, this.controller, this.prefixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.lato(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
            size: 25,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          hintText: hintText,
          enabledBorder: border(),
          border: border(),
          focusedErrorBorder: border(),
          focusedBorder: border(),
        ),
      ),
    );
  }

  border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 0.5),
    );
  }
}
