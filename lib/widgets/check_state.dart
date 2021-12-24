import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckState extends StatelessWidget {
  final dynamic provider;
  final Widget child;

  const CheckState({Key? key, required this.provider, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (provider.state == ResultState.loading) {
      return const CircularProgressIndicator();
    } else if (provider.state == ResultState.noData) {
      return child;
    } else if (provider.state == ResultState.hasData) {
      return child;
    }
    return const Center(child: Text("Ups, something went wrong!"));
  }
}
