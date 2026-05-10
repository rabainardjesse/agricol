import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      String error = e.toString();
      if (error.contains('user-not-found')) {
        return 'Aucun compte trouvé pour cet email.';
      } else if (error.contains('wrong-password')) {
        return 'Mot de passe incorrect.';
      } else if (error.contains('invalid-email')) {
        return 'Email invalide.';
      } else if (error.contains('invalid-credential')) {
        return 'Email ou mot de passe incorrect.';
      }
      return 'Erreur de connexion. Vérifie tes informations.';
    }
  }

  Future<String?> signup(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      String error = e.toString();
      if (error.contains('weak-password')) {
        return 'Le mot de passe est trop faible (min 6 caractères).';
      } else if (error.contains('email-already-in-use')) {
        return "Cet email est déjà utilisé.";
      } else if (error.contains('invalid-email')) {
        return 'Email invalide.';
      }
      return "Erreur d'inscription.";
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } catch (e) {
      return 'Erreur: ${e.toString()}';
    }
  }
}