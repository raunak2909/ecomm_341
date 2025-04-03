import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/ui/screens/login_screen.dart';
import 'package:shopping_application/ui/screens/register/register_bloc.dart';
import 'package:shopping_application/ui/screens/register/register_event.dart';
import 'package:shopping_application/ui/screens/register/register_state.dart';
import 'package:shopping_application/ui/widgets/custom_button.dart';
import 'package:shopping_application/ui/widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  bool isPasswordVisible = false;

  GlobalKey<FormState> mKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: mKey,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Please register your account to sign in',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextfield(
                  validate: (value){
                    if(value!.isEmpty){
                      return "Name cannot be empty.";
                    } else {
                      return null;
                    }
                  },
                  labelText: 'Name',
                  controller: _nameController,
                  placeholder: 'Enter your full name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  validate: (value){

                    var emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                    if(value!.isEmpty){
                      return 'Email cannot be empty.';
                    } else if(!emailRegex.hasMatch(value)){
                      return "Invalid Email Address.";
                    } else{
                      return null;
                    }
                  },
                  controller: _emailController,
                  labelText: 'Email',
                  placeholder: 'Enter email address',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Phone no cannot be empty.';
                    } else if(value.length!=10){
                      return "Invalid Phone No.";
                    } else{
                      return null;
                    }
                  },
                  controller: _phoneNoController,
                  labelText: 'Phone No',
                  placeholder: 'Enter phone no',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextfield(
                  validate: (value){
                    if(value!.isEmpty){
                      return 'Password cannot be empty.';
                    } else if(value.length<6){
                      return 'Password should be at-least 6 characters long.';
                    } else{
                      return null;
                    }
                  },
                  isobscureText: !isPasswordVisible,
                  controller: _passwordController,
                  labelText: 'Password',
                  maximumLine: 1,
                  placeholder: 'Enter password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      isPasswordVisible = !isPasswordVisible;
                      setState(() {

                      });
                    },
                    icon: isPasswordVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocListener<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterLoadingState) {
                      isLoading = true;
                      setState(() {});
                    }

                    if (state is RegisterErrorState) {
                      isLoading = false;
                      setState(() {});

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${state.errorMsg}")));
                    }

                    if(state is RegisterLoadedState){
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("User Registered Successfully")));
                      Navigator.pop(context);
                    }
                  },
                  child: ElevatedButton(
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  width: 11,
                                ),
                                Text('Registering user..')
                              ],
                            )
                          : Text('Register'),
                      onPressed: () async {

                        if(mKey.currentState!.validate()) {
                          context.read<RegisterBloc>().add(RegisterUserEvent(
                              name: _nameController.text,
                              email: _emailController.text,
                              mobile_number: _phoneNoController.text,
                              password: _passwordController.text));
                        }
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrangeAccent),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
