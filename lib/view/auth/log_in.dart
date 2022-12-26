import 'dart:js';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yeniumut/companents/custom_button.dart';
import 'package:yeniumut/companents/custom_text_form_field.dart';
import 'package:yeniumut/view/home_page.dart';
import 'package:yeniumut/viewModel/login_controller.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (ctrl) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          elevation: 0,
          title: const Text('Giriş Yap'),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade100,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/tunel.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ElasticIn(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50)),
                child: Opacity(
                  opacity: 1,
                  child: ctrl.isLoading == false
                      ? Form(
                          key: ctrl.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElasticInDown(
                                child: const Text(
                                  'Yeni Umut',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SlideInLeft(
                                child: CustomTextFormField(
                                  initValue: 'yeniumut@gmail.com',
                                  hintText: 'Kullanıcı adınız',
                                  onSaved: (value) {
                                    ctrl.email = value!;
                                  },
                                ),
                              ),
                              SlideInRight(
                                child: CustomTextFormField(
                                  initValue: 'password',
                                  hintText: 'Şifreniz',
                                  obsucureText: true,
                                  onSaved: (value) {
                                    ctrl.password = value!;
                                  },
                                ),
                              ),
                              ElasticInUp(
                                child: CustomButton(
                                  butonText: 'Giriş Yap',
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  onpressed: () {
                                    ctrl.formSubmit();
                                    /*
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                  (route) => false);
                              */
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : Lottie.asset('assets/lottie/loading.json'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void formSubmit(BuildContext context) async {}
}
