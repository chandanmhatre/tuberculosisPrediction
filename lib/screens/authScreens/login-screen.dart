import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuberculosis_prediction/Utils/Utils.dart';
import 'package:tuberculosis_prediction/Utils/Widget-utils.dart';
import 'package:tuberculosis_prediction/screens/authScreens/sign-up-screen.dart';
import 'package:tuberculosis_prediction/screens/home-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true, isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.redAccent,
            body: Form(
              key: key,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Sign In',
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
                            const SizedBox(height: 20),
                            isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : WidgetUtils.styledButton(
                                    'Login', () => validateAndCreate()),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account? "),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpScreen()));
                                  },
                                  child: const Text("Sign Up",
                                      style: TextStyle(color: Colors.blue)),
                                ),
                              ],
                            ),
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
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
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
