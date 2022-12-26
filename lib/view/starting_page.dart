import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:yeniumut/view/auth/log_in.dart';

// ignore: must_be_immutable
class StartingPage extends StatelessWidget {
  StartingPage({Key? key}) : super(key: key);
  late String userName, password;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ),
                ),
                child: const Text(
                  'Giriş Yap ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
        //elevation: 0,
        backgroundColor: Colors.greenAccent,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  //border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(150)),
              child: Image.asset(
                'assets/icon.png',
                height: 70,
                width: 70,
                fit: BoxFit.fitHeight,
              ),
            ),
            const Text('Yeni Umut'),
          ],
        ),

        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/tunel.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SlideInLeft(
                child: const Text(
                  'Yeni bir umut olabilmek umuduyla...',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      height: 2,
                      letterSpacing: 2,
                      color: Colors.green),
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              SlideInRight(
                child: const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Türkiye\'de özellikle 18 yaş altı bireylerde artan suç oranları ve işledikleri suçtan dolayı hüküm giyerek hapishaneye gitmelerine rağmen ıslah olmamaları hem bu bireyler açısından hemde toplum açısından büyük bir tehlike arzetmektedir.Bu tehlikeyi fark eden Yeni Umut ekibi bu soruna bir çözüm olması ümidiyle Yeni Umut projesini hayata geçirmiştir.Amacımız hüküm giymiş 18 yaş altı bireylerin verilerini inceleyerek onları tekrar topluma kazandırmaktır.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
