import 'package:chikitsa/constants/color/colors.dart';
import 'package:chikitsa/signup_page/text_fields.dart';
import 'package:chikitsa/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  SignInScreen({super.key});

  final String validEmail = 'test@example.com';
  final String validPassword = '123456';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChikitsaColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Logo
                  const Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.medication_outlined,
                          color: ChikitsaColors.primaryColor,
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Adhicine',
                        style: TextStyle(
                          fontSize: 16,
                          color: ChikitsaColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email field
                  SignupTextFields(
                      emailController: emailController,
                      passwordController: passwordController),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: ChikitsaColors.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign In button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BottomPage(),
                        ));
                        // if (formkey.currentState!.validate()) {
                        //   if (emailController.text.trim() == validEmail &&
                        //       passwordController.text.trim() ==
                        //           validPassword) {

                        //   }
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ChikitsaColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // OR divider
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: ChikitsaColors.grey,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: ChikitsaColors.grey,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Google Sign In button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BottomPage(),
                        ));
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google__icon-r.png',
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Sign Up link
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New to Adhicine? ',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: ChikitsaColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
