import 'package:flutter/material.dart';
import 'package:yoalabo/yoalabo/widgets/ps_form.dart';

class PSRegisterFormScreen extends StatelessWidget {
  const PSRegisterFormScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Crea un canto nuevo',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const PSForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

