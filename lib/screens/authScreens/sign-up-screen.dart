import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/Utils/Utils.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';
import 'package:tuberculosis_prediction/screens/authScreens/login-screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = true,
      isConfirmPasswordVisible = true,
      isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.redAccent,
            appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
            body: Form(
              key: key,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 40),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      elevation: 10,
                      child: SizedBox(
                        // height: MediaQuery.of(context).size.height * .3,
                        width: MediaQuery.of(context).size.width * .8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 40),
                            WidgetUtils.textFormField('Email', 'Email', (v) {
                              if (!Utils.isValidEmail(v!)) {
                                return 'Enter valid email address';
                              }
                              return null;
                            }, emailController,
                                prefixIcon: const Icon(Icons.account_circle),
                                isLoginForm: true),
                            WidgetUtils.textFormField(
                              'Password',
                              'Password',
                              (v) {
                                if (v!.isEmpty) {
                                  return 'Enter password';
                                } else if (v.length < 5) {
                                  return 'Password must be 5 characters long';
                                }
                                return null;
                              },
                              passwordController,
                              isLoginForm: true,
                              obscure: isPasswordVisible,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                  icon: isPasswordVisible
                                      ? const Icon(Icons.visibility_sharp)
                                      : const Icon(Icons.visibility_off)),
                              prefixIcon:
                                  const Icon(CupertinoIcons.lock_circle_fill),
                            ),
                            WidgetUtils.textFormField(
                              'Confirm Password',
                              'Confirm Password',
                              (v) {
                                if (v!.isEmpty) {
                                  return 'Enter Confirm password';
                                } else if (passwordController.text != v) {
                                  return 'Password does not match';
                                }
                                return null;
                              },
                              confirmPasswordController,
                              isLoginForm: true,
                              obscure: isConfirmPasswordVisible,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isConfirmPasswordVisible =
                                          !isConfirmPasswordVisible;
                                    });
                                  },
                                  icon: isConfirmPasswordVisible
                                      ? const Icon(Icons.visibility_sharp)
                                      : const Icon(Icons.visibility_off)),
                              prefixIcon:
                                  const Icon(CupertinoIcons.lock_circle_fill),
                            ),
                            const SizedBox(height: 20),
                            isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : WidgetUtils.styledButton(
                                    'Sign Up', () => validateAndCreate()),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  validateAndCreate() async {
    if (key.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: confirmPasswordController.text.trim());
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Account has been created successful, Please login now.'),
        ));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (Route<dynamic> route) => false);
      } on FirebaseAuthException catch (e) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!),
        ));
      }
    }
  }
}
