import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login',
      home: //ForgotPasswordPage(),
          LoginPage(),
      //SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Let's Make background image
          Positioned.fill(
            child: Image.network(
                'https://images.unsplash.com/photo-1492288991661-058aa541ff43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8ODJ8MTU1NDUwfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
                fit: BoxFit.cover,
                color: Colors.black54,
                colorBlendMode: BlendMode.darken),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {}),
          ),
          Positioned.fill(
            top: 80,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 45, color: Colors.white),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Enter your Details to log in',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white70),
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: IconButton(
                        color: Colors.orange,
                        icon: emailController.text.isEmpty
                            ? const SizedBox(
                                width: 0,
                              )
                            : const Icon(Icons.close),
                        onPressed: () {
                          emailController.clear();
                        }),
                    hintStyle: const TextStyle(color: Colors.white60),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  style: const TextStyle(color: Colors.white70),
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        color: Colors.white70,
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        }),
                    hintStyle: const TextStyle(color: Colors.white60),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage());
                      Navigator.push(context, route);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                buildButton('LOGIN', Colors.orange, loginButtonPressed),
                const SizedBox(height: 100),
                // Expanded(child: Container()),
                const Text(
                  'Or create an account using social media',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                buildButton('facebook', Colors.blue, facebookButtonPrssed),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => const SignUpPage());
                          Navigator.push(context, route);
                        })
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void loginButtonPressed() {}

  void facebookButtonPrssed() {}

  Widget buildButton(String buttonName, Color color, Function buttonPressed) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Text(
          buttonName,
        ),
      ),
    );
  }
}

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Fogot Password'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Image.network(
              'https://images.unsplash.com/photo-1524330685423-3e1966445abe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTl8MTU1NDUwfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black54),
        ),
        Positioned.fill(
          top: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Center(
                child: Text(
                  'Forgot Your Password?',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Enter your email address below to get a password  recovery link',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white70),
                cursorColor: Colors.orange,
                decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: IconButton(
                      color: Colors.orange,
                      icon: emailController.text.isEmpty
                          ? const SizedBox(
                              width: 0,
                            )
                          : const Icon(Icons.close),
                      onPressed: () {
                        emailController.clear();
                      }),
                  hintStyle: const TextStyle(color: Colors.white60),
                  fillColor: Colors.white.withOpacity(0.20),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Colors.white30),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              buildButton('Sent', Colors.orange, () {}),
            ]),
          ),
        )
      ]),
    );
  }

  Widget buildButton(String buttonName, Color color, Function buttonPressed) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Text(
          buttonName,
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isconfirmPasswordVisible = true;
  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Image.network(
              'https://images.unsplash.com/photo-1494919498949-c358a885b181?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NDh8MTU1NDUwfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken),
        ),
        Positioned.fill(
          top: 50,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the details below to create your account',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white70),
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    suffixIcon: IconButton(
                        color: Colors.orange,
                        icon: nameController.text.isEmpty
                            ? const SizedBox(
                                width: 0,
                              )
                            : const Icon(Icons.close),
                        onPressed: () {
                          nameController.clear();
                        }),
                    hintStyle: const TextStyle(color: Colors.white60),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white70),
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: IconButton(
                        color: Colors.orange,
                        icon: emailController.text.isEmpty
                            ? const SizedBox(
                                width: 0,
                              )
                            : const Icon(Icons.close),
                        onPressed: () {
                          emailController.clear();
                        }),
                    hintStyle: const TextStyle(color: Colors.white60),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: isPasswordVisible,
                  style: const TextStyle(color: Colors.white70),
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        color: Colors.white70,
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        }),
                    hintStyle: const TextStyle(color: Colors.white60),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: isconfirmPasswordVisible,
                  style: const TextStyle(color: Colors.white70),
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                        color: Colors.white70,
                        icon: Icon(isconfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isconfirmPasswordVisible =
                                !isconfirmPasswordVisible;
                          });
                        }),
                    hintStyle: const TextStyle(color: Colors.white60),
                    fillColor: Colors.white.withOpacity(0.20),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white30),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                buildButton('SignUp', Colors.orange, () {}),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Alredy have an account?",
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                        child: const Text('Log In'),
                        onPressed: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => const LoginPage());
                          Navigator.push(context, route);
                        })
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget buildButton(String buttonName, Color color, Function buttonPressed) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: buttonPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        child: Text(
          buttonName,
        ),
      ),
    );
  }
}
