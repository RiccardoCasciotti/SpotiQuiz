import 'dart:async';
import 'dart:ui';
import 'package:spotify/spotify.dart';
//import 'package:user_repository/src/models/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';


class UserRepository {
  User? _user;

  Future<User?> fetchUser() async {
    if (_user != null) return _user;
    return _user;
  }

//   Future<Object?> spotifyLogin() async {

//     final WebViewController webViewController = WebViewController();

// if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//   final WebKitWebViewController webKitController =
//       webViewController.platform as WebKitWebViewController;
// } else if (WebViewPlatform.instance is AndroidWebViewPlatform) {
//   final AndroidWebViewController androidController =
//       webViewController.platform as AndroidWebViewController;
// }

//   WebViewController controller = webViewController
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   ..setBackgroundColor(const Color(0x00000000))
//   ..setNavigationDelegate(
//     NavigationDelegate(
//       onProgress: (int progress) {
//         // Update loading bar.
//       },
//       onPageStarted: (String url) {},
//       onPageFinished: (String url) {},
//       onWebResourceError: (WebResourceError error) {},
//       onNavigationRequest: (NavigationRequest request) {
//         if (request.url.startsWith('https://www.youtube.com/')) {
//           return NavigationDecision.prevent;
//         }
//         return NavigationDecision.navigate;
//       },
//     ),
//   )
//   ..loadRequest(Uri.parse('https://flutter.dev'));


//     final credentials = SpotifyApiCredentials(
//         dotenv.env['SPOTIFY_CLIENT_ID'], dotenv.env['SPOTIFY_CLIENT_SECRET']);

//     final grant = SpotifyApi.authorizationCodeGrant(credentials);

// // The URI to redirect to after the user grants or denies permission. It must
// // be in your Spotify application's Redirect URI whitelist. This URI can
// // either be a web address pointing to an authorization server or a fabricated
// // URI that allows the client device to function as an authorization server.
//     final redirectUri = 'https://google.com';

// // See https://developer.spotify.com/documentation/general/guides/scopes/
// // for a complete list of these Spotify authorization permissions. If no
// // scopes are specified, only public Spotify information will be available.
//     final scopes = ['user-read-email', 'user-library-read'];

//     final authUri = grant.getAuthorizationUrl(
//       Uri.parse(redirectUri),
//       scopes: scopes, // scopes are optional
//     );

// // `redirect` is an imaginary function that redirects the resource owner's
// // browser to the `authUri` on the authorization server. Once the resource
// // owner has authorized, they'll be redirected to the `redirectUri` with an
// // authorization code. The exact implementation varies across platforms.
//     //await redirect(authUri);

// // `listen` is another imaginary function that listens for a request to
// // `redirectUri` after the user grants or denies permission. Again, the
// // exact implementation varies across platforms.
//     //final responseUri = await listen(redirectUri);

//     //final spotify = SpotifyApi.fromAuthCodeGrant(grant, responseUri);
//   }
}
