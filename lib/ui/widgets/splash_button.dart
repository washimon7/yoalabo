import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({ Key? key, required this.navigationTo }) : super(key: key);

  final Function navigationTo;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
          // onPressed: navigateToHome,
          onPressed: () => navigationTo(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Explorar',
              ),
              Icon(Icons.arrow_right)
            ],
          ) 
        ),
      ),
    );
  }
}