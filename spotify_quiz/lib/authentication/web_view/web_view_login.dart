import 'dart:convert' show Encoding, base64, json, utf8;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

// The URI to redirect to after the user grants or denies permission. It must
// be in your Spotify application's Redirect URI whitelist. This URI can
// either be a web address pointing to an authorization server or a fabricated
// URI that allows the client device to function as an authorization server.
    String redirectUri = 'http://spotify_quiz-api.com';

// See https://developer.spotify.com/documentation/general/guides/scopes/
// for a complete list of these Spotify authorization permissions. If no
// scopes are specified, only public Spotify information will be available.
    String scopes = "user-read-private user-read-email user-follow-read";

    final clientId = dotenv.env['SPOTIFY_CLIENT_ID'];
    final clientSecret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
    // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
    final url1 = Uri.parse('https://accounts.spotify.com/authorize?' +
        "show_dialog=true&response_type=code&client_id=$clientId&scope=$scopes&redirect_uri=$redirectUri");

    debugPrint(url1.toString());
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
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest res) async {
          var responseUri = res.url;
          debugPrint(responseUri);
          final code = responseUri.substring(
            responseUri.indexOf("code") + 5,
          );
          debugPrint(code);
          Uri url = Uri.parse("https://accounts.spotify.com/api/token");

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

          debugPrint("RESPONSE BODY:  ${response.body}");
          //print(response.headers);

          debugPrint("STATUS CODE: ${response.statusCode}");
          final bodyJson = json.decode(response.body);



          if (response.statusCode == 200) {
            
            var data = await userRepository.apiGetUser(
                '${bodyJson["access_token"]}', '${bodyJson["refresh_token"]}');
            // ignore: use_build_context_synchronously
            context.read<AuthenticationBloc>().user = data;
            // ignore: use_build_context_synchronously
            context.read<LoginBloc>().add(const LoginSubmitted());
            //controller.clearCache();
            Navigator.pop(context);

            debugPrint(
                "1 #####################################################################");
          }

          if (!responseUri.contains(redirectUri)) {
            debugPrint(responseUri);
            return NavigationDecision.navigate;
          }
          return NavigationDecision.prevent;
        },
      ))
      ..loadRequest(url1);
    return WebViewWidget(controller: controller);
  }
}
