import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

// All providers don't extends OAuthProvider because their credential don't require all the parameters
// We convert if possible to OAuthProvider to transmit scope and custom parameters
AuthProvider convertToOAuthProvider(AuthProvider authProvider) {
  if (authProvider is MicrosoftAuthProvider) {
    final oAuthProvider = OAuthProvider(authProvider.providerId);
    oAuthProvider.setScopes(authProvider.scopes);
    oAuthProvider.setCustomParameters(authProvider.parameters);
    return oAuthProvider;
  }

  if (authProvider is GithubAuthProvider) {
    final oAuthProvider = OAuthProvider(authProvider.providerId);
    oAuthProvider.setScopes(authProvider.scopes);
    oAuthProvider.setCustomParameters(authProvider.parameters);
    return oAuthProvider;
  }

  if (authProvider is AppleAuthProvider) {
    final oAuthProvider = OAuthProvider(authProvider.providerId);
    oAuthProvider.setScopes(authProvider.scopes);
    oAuthProvider.setCustomParameters(authProvider.parameters);
    return oAuthProvider;
  }

  return authProvider;
}
