import 'package:flutter/material.dart';
import 'package:shopping_application/ui/screens/home_screen.dart';
import 'package:shopping_application/ui/screens/registration_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(15), child: SingleChildScrollView(
        child: Column(
          children: [
            // Image.asset(Assets.login_screen_image, height: 170,),
            const Align(alignment: Alignment.topLeft, child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),)),
            const SizedBox(height: 8,),
            const Align(alignment: Alignment.topLeft, child: Text('Please sign in your account to get started!', style: TextStyle(color: Colors.grey, fontSize: 16),)),
            const SizedBox(height: 15,),
            CustomTextfield(controller: _emailController, labelText: 'Email', inputType: TextInputType.emailAddress,),
            const SizedBox(height: 10,),
            CustomTextfield(controller: _passwordController, labelText: 'Password', placeholder: 'Enter password', suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off),),),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: TextButton(onPressed: (){}, child: Text('Forgot password')),
            // ),
            const SizedBox(height: 15,),
            CustomButton(title: 'Sign In', onClick: () async {
              // bool check = await db.authenticateUser(email: _emailController.text, password: _passwordController.text);
              // if(check){
              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully log in!!")));
              //   Navigator.pushReplacementNamed(context, AppRoutes.BOTTOM_NAVIGATION_BAR);
              // } else{
              //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid credentials, Please Log in again")));
              // }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?", style: TextStyle(fontSize: 16),),
                TextButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));}, child: const Text('Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),)
              ],
            )
          ],
        ),
      ),),
    );
  }
}
