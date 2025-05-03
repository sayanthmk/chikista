import 'package:chikitsa/constants/color/colors.dart';
import 'package:flutter/material.dart';

class SignupTextFields extends StatelessWidget {
  const SignupTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Colors.teal[300],
                  size: 20,
                ),
                hintText: 'Enter Your Email',
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: ChikitsaColors.primaryColor),
                ),
              ),
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Incorrect Email Address';
                }
                const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-z]{2,7}$';
                if (!RegExp(emailRegex).hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              }),

          const SizedBox(height: 20),
          // Password field
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.green[300],
                size: 20,
              ),
              suffixIcon: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.visibility_off_outlined,
                  color: ChikitsaColors.grey,
                  size: 20,
                ),
              ),
              hintText: 'Enter Password',
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ChikitsaColors.grey),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: ChikitsaColors.primaryColor),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null) {
                return "Password Don'T Match";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
