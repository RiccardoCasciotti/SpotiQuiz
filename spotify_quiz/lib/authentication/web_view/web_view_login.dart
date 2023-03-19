import 'dart:convert' show Encoding, base64, utf8;
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/spotify.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// ignore: camel_case_types
class WebViewLogin extends StatelessWidget {

static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => WebViewLogin());
  }

  @override
  Widget build(BuildContext context) {
    final WebViewController webViewController = WebViewController();

    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      final WebKitWebViewController webKitController =
          webViewController.platform as WebKitWebViewController;
    } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
      final AndroidWebViewController androidController =
          webViewController.platform as AndroidWebViewController;
    }

    final credentials = SpotifyApiCredentials(
        dotenv.env['SPOTIFY_CLIENT_ID'], dotenv.env['SPOTIFY_CLIENT_SECRET']);

    final grant = SpotifyApi.authorizationCodeGrant(credentials);

// The URI to redirect to after the user grants or denies permission. It must
// be in your Spotify application's Redirect URI whitelist. This URI can
// either be a web address pointing to an authorization server or a fabricated
// URI that allows the client device to function as an authorization server.
    final redirectUri = 'http://spotify_quiz-api.com';

// See https://developer.spotify.com/documentation/general/guides/scopes/
// for a complete list of these Spotify authorization permissions. If no
// scopes are specified, only public Spotify information will be available.
    final scopes = 'user-read-email';

    final client_id = dotenv.env['SPOTIFY_CLIENT_ID'];
    final client_secret = dotenv.env['SPOTIFY_CLIENT_SECRET'];
    // ignore: prefer_interpolation_to_compose_strings
    final url1 = Uri.parse('https://accounts.spotify.com/authorize?' +
        "response_type=code&client_id=${client_id}&scope=${scopes}&redirect_uri=${redirectUri}");

    print(url1);
   

    WebViewController controller = webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color.fromRGBO(255, 255, 255, 1))
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
                  'Basic ${base64.encode(utf8.encode("${client_id}:${client_secret}"))}',
              "content-type": "application/x-www-form-urlencoded"
            },
            encoding: Encoding.getByName('utf-8'),
            body: {
              "code": "${code}",
              "redirect_uri": "${redirectUri}",
              "grant_type": "authorization_code"
            },
          );

        
          print("RESPONSE BODY:  ${response.body}");
          print(response.headers);

          print("STATUS CODE: ${response.statusCode}");
          if( response.statusCode == 200)
            Navigator.pop(context);
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
