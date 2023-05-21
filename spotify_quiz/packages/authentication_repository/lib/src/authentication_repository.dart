import 'dart:async';
import 'package:path_provider/path_provider.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    print("############################## USER AUTHENTICATED SUCCESSFULLY #############################################");
    // Here we insert the function which let's us login into spotify, if everything goes well the controller adds the auth state, otherwise we throw an error and don't add any event
    // We first check if the user is in the DB, if it is not we load the widget to login onto spotify
    _controller.add(AuthenticationStatus.authenticated);
                 

  
  }

  void logOut() async{
    
    final cacheDir = await getTemporaryDirectory();
    print("LOGOUTTTTTTTTTTTTTT");
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
     
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}