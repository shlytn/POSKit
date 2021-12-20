import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:dicoding_capstone_pos/widgets/empty_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckState extends StatelessWidget {
  final dynamic provider;
  final Widget child;

  const CheckState({Key? key, required this.provider, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Consumer<type>(builder: (context, provider, _) {
      if (provider.state == ResultState.loading) {
        return const CircularProgressIndicator();
      } else if (provider.state == ResultState.noData) {
        return const Center(child: EmptyWidget());
      } else if (provider.state == ResultState.hasData) {
        return child;
      }
      return const Center(child: Text("Ups, something went wrong!"));
    // });
  }

}