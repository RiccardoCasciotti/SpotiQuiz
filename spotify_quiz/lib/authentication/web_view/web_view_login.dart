import 'dart:convert' show Encoding, base64, json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import '../../login/bloc/login_bloc.dart';

// Import for Android features.
// Import for iOS features.

// ignore: camel_case_types
class WebViewLogin extends StatelessWidget {
  const WebViewLogin({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const WebViewLogin());
  }

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();


    String redirectUri = 'http://spotify_quiz-api.com';


    String scopes = "user-read-private user-read-email user-follow-read";

    final clientId = dotenv.env['SPOTIFY_CLIENT_ID'];
    final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
    // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
    final url1 = Uri.parse('https://accounts.spotify.com/authorize?' +
        "show_dialog=true&response_type=code&client_id=$clientId&scope=$scopes&redirect_uri=$redirectUri");

    
    var params = const PlatformWebViewControllerCreationParams();
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color.fromARGB(255, 255, 255, 255))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) async {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest req) async {
          var requestUri = req.url;
        
          
          if( requestUri.contains("error=access_denied")){
  
          context.read<AuthenticationBloc>().add( AuthenticationLogoutRequested());
          Navigator.pop(context);
          
          return NavigationDecision.prevent;
          
          }

          else if( requestUri.contains("http://spotify_quiz-api.com/?code=" )){
            var code = requestUri.split("code=")[1];
            print("CODE REQUESTED");
            final response = await http.post(
            Uri.parse("https://accounts.spotify.com/api/token"),
            headers: {
              "Authorization":
                  'Basic ${base64.encode(utf8.encode("$clientId:$clientSecret"))}',
              "content-type": "application/x-www-form-urlencoded"
            },
            encoding: Encoding.getByName('utf-8'),
            body: {
              "code": code,
              "redirect_uri": redirectUri,
              "grant_type": "authorization_code"
            },
          );

            print("CODE REQUESTED AFTER");
           


          final bodyJson = json.decode(response.body);

          if (response.statusCode == 200) {
            //utilities.access_token = bodyJson["access_token"];
            var data = await userRepository.apiGetUser(
                '${bodyJson["access_token"]}', '${bodyJson["refresh_token"]}');
            print("USER ACQUIRED");
            context.read<AuthenticationBloc>().user = data;

        
            context.read<LoginBloc>().add(const LoginSubmitted());
            //controller.clearCache();
            Navigator.pop(context);
          
           }
           else{
            Navigator.pop(context);
           }
            return NavigationDecision.prevent;
          }
          else if(redirectUri != "http://spotify_quiz-api.com"){
            
            return NavigationDecision.prevent;
          }
          
         return NavigationDecision.navigate;
           
        },
      ))
      ..loadRequest(url1);
    return WebViewWidget(controller: controller);
  }
}
