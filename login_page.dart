import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/components/my_button.dart';
import 'package:fooddeliveryservice/components/my_textfield.dart';
import 'package:fooddeliveryservice/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()?onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    //instance of auth service
    final _authService = AuthService();
    //try sign in
    try{
      await _authService.signInWithEmailPassword(
          emailController.text,
          passwordController.text,
      );
    }
    //display error
    catch(e){
      showDialog(
      context: context,
      builder: (context) => AlertDialog(
    title: Text(e.toString()),
      ),
     );
    }
  }
  //FORGOT PASSWORD
    void forgotPw(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text("User tapped forgot password"),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.food_bank_outlined,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),

              const SizedBox(height: 25),
            //slogan
            Text(
              "Food House",
              style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
              ),
                ),

              const SizedBox(height: 251),

              Text(
                "Delivering foods to your doorsteps",
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            //email
              MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
              ),
              const SizedBox(height: 10),

              MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
              ),
            const SizedBox(height: 10,),

              //button
              MyButton(
                text: "login",
                onTap: login,
              ),
              const SizedBox(height: 25),
              //not a member
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a Member?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                    ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Register Now",
                  style:  TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                      ),
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