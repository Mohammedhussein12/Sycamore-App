import 'package:flutter/material.dart';

class CheckYourInboxScreen extends StatelessWidget {
  const CheckYourInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios,
          color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              'assets/images/check_your_inbox.png',
              fit: BoxFit.fill,
              height: 180,
              width: 180,
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffAAD3C5),
                    const Color(0xff40A39C).withOpacity(0.6),
                  ],
                ),
              ),
              height: 310,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'check your inbox',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: const Color(0xff030303).withOpacity(0.75),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'we have sent to you a reset password',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: const Color(0xfff5f5f5).withAlpha(500),
                    ),
                  ),
                  Center(
                    child: Text(
                      'link on your registered',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: const Color(0xfff5f5f5).withAlpha(500),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'email address',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: const Color(0xfff5f5f5).withAlpha(500),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF).withOpacity(0.75),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: const Center(
                        child: Text(
                          'go to mail',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
