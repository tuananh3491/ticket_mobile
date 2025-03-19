import 'package:flutter/material.dart';
import 'package:ticket_system/common/widgets/button/basic_app_button.dart';
import 'package:ticket_system/core/configs/assets/app_images.dart';
import 'package:ticket_system/core/configs/theme/app_color.dart';
import 'package:ticket_system/presentation/Staff/pages/staff_dashboard.dart';
import 'package:ticket_system/presentation/user/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  dynamic isObscured;
  final TextEditingController _username = TextEditingController();

  void initState() {
    super.initState();
    isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(AppImages.topPattern),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  _loginText(context),
                  const SizedBox(
                    height: 15,
                  ),
                  _usernameField(context),
                  const SizedBox(
                    height: 15,
                  ),
                  _passwordField(context),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: Text(
                        "Recovery password",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BasicAppButton(
                    onPressed: () {
                      if(_username.text=="1"){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => StaffDashboardPage(),
                        ),
                      );
                    } else{
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => HomePage(),
                        ),
                      );
                    }
                      
                    },
                    height: 50,
                    title: "Login",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _loginText(BuildContext context) {
    return Text(
      'Login',
      style: TextStyle(
        color: AppColors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _usernameField(BuildContext context) {
    return TextField(
      controller: _username,
      decoration: const InputDecoration(hintText: "Username")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      // controller: _password,
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: IconButton(
          padding: const EdgeInsets.all(20),
          icon: Icon(isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isObscured = !isObscured; // Đảo trạng thái
            });
          },
        ),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
