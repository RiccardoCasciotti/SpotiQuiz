import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_quiz/login/login.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }
}

class LoginPageState extends State<LoginPage>
    {
var _isExpanded = false;
  

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = const AssetImage("assets/images/logo2.png");
    return Scaffold(
      body: Center(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Container(
                height: 230,
                width: 230,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(3.0),
                child: Image(image: logo),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: AnimatedLoginButton(),
            ),
            Padding(padding:EdgeInsets.all(5),
            child: OutlinedButton(
              onPressed:(){setState(() {
                    _isExpanded = !_isExpanded;
                  });},
                child:Text(
      AppLocalizations.of(context)!.noaccount,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    ),
        

              
              ),),
      Container(
        child: Column(children: [
            AnimatedContainer(
              height: _isExpanded ? 90 : 0,
            
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
   
      color: Colors.white,
   
    borderRadius: BorderRadius.all(Radius.circular(8))
  ),
            child: 
            Padding(
              padding: EdgeInsets.all(10),
              child:
                Text(
     AppLocalizations.of(context)!.noaccountText,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    ),
             
            ),
            ),
        ]
          
        )
      ),
          ]
        ),
      ),
    );
  }
}
