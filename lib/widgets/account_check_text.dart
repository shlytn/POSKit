import 'package:flutter/material.dart';

class AccountCheckText extends StatelessWidget {
  final bool isLogin;
  final Function onClick;

  const AccountCheckText({
    Key? key,
    required this.isLogin,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(isLogin ? "Don't have an Account? " : "Already have an Account?"),
      GestureDetector(
        onTap: () => onClick(),
        child: Text(
          isLogin ? "Sign Up" : "Log In",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      )
    ]);
  }
}
