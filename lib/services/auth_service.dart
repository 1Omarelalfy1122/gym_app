import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Stream to listen to authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Sign out of any existing Google Sign-In session
      await _googleSignIn.signOut();
      await _auth.signOut();

      // Begin interactive sign in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print('Google Sign In was cancelled by user');
        return null;
      }

      try {
        // Get auth details from Google user
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        if (googleAuth.accessToken == null || googleAuth.idToken == null) {
          throw FirebaseAuthException(
            code: 'invalid-credential',
            message: 'Missing Google Auth Access Token or ID Token',
          );
        }

        // Create credential for Firebase
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Attempt to sign in to Firebase
        final UserCredential userCredential = await _auth.signInWithCredential(
          credential,
        );

        if (userCredential.user == null) {
          throw FirebaseAuthException(
            code: 'user-not-found',
            message: 'No user data received from Firebase',
          );
        }

        print(
          'Successfully signed in with Google: ${userCredential.user?.email}',
        );
        return userCredential;
      } catch (error) {
        print('Error getting auth details: $error');
        await _googleSignIn.signOut();
        rethrow;
      }
    } catch (e) {
      print('Error in signInWithGoogle: $e');
      await _googleSignIn.signOut();
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  // Get current user
  User? get currentUser => _auth.currentUser;
}
