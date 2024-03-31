import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nvvm/resources/components/round_button.dart';
import 'package:getx_nvvm/utils/utils.dart';
import 'package:getx_nvvm/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  final loginViewModel = LoginViewModel();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snackBar("Email", 'Enter email');
                    }
                  },
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context,
                        loginViewModel.emailFocusNode.value,
                        loginViewModel.passwordFocusNode.value);
                  },
                  controller: loginViewModel.emailController.value,
                  focusNode: loginViewModel.emailFocusNode.value,
                  decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: const OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.snackBar("Password", 'Enter Password');
                    }
                  },
                  obscureText: true,
                  obscuringCharacter: '+',
                  // onFieldSubmitted: (value) {
                  //   Utils.fieldFocusChange(
                  //       context,
                  //       loginViewModel.emailFocusNode.value,
                  //       loginViewModel.passwordFocusNode.value);
                  // },
                  controller: loginViewModel.passwordController.value,
                  focusNode: loginViewModel.passwordFocusNode.value,
                  decoration: InputDecoration(
                      hintText: 'password_hint'.tr,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) ;
                    },
                    title: "login".tr)
              ],
            ),
          ),
        ));
  }
}
