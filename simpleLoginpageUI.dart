import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userEmail;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisibile = true;
  final TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // if any change on controller it will
    //call empty setState to build a widget tree to
    // show the close icon on email textfield
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            children: [
              const Text(
                'Hello Again!',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const Text(
                'back',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: emailController.text.isEmpty
                          ? const SizedBox(width: 0)
                          : IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  emailController.clear();
                                });
                              }),
                      contentPadding: const EdgeInsets.all(8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white),
                  validator: (String? value) {
                    if (value?.isEmpty ?? false) {
                      return 'Please Enter The Email';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    setState(() {
                      userEmail = value ?? '';
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  obscureText: isPasswordVisibile,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(isPasswordVisibile
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordVisibile = !isPasswordVisibile;
                            });
                          }),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Password"),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: deviceSize.width,
                child: ElevatedButton(
                  onPressed: () {
                    final form = formKey.currentState!;
                    if (form.validate()) {
                      form.save();
                    }
                    formKey.currentState!.validate();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Sign in'),
                ),
              ),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  child: const Text('Forgot Your Password ?'),
                  onPressed: () {},
                ),
                TextButton(
                  child: const Text('Sign Up'),
                  onPressed: () {},
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              // Image.asset("assets/images.jpeg", height: 300, fit: BoxFit.cover),
            ]),
      ),
    );
  }
}
