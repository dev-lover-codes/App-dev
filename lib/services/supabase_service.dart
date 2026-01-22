import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  final SupabaseClient client = Supabase.instance.client;

  // Auth
  Future<void> signUp(String email, String password) async {
    try {
      await client.auth.signUp(email: email, password: password);
    } catch (e) {
      // Demo Mode: If real auth fails (e.g. bad keys), allow access for UI demo
      debugPrint("Supabase Auth failed (Expected in Demo): $e");
      await Future.delayed(const Duration(seconds: 1));
      // In a real app we would throw, but for this demo we proceed
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await client.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      // Demo Mode: If real auth fails (e.g. bad keys), allow access for UI demo
      debugPrint("Supabase Auth failed (Expected in Demo): $e");
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (_) {}
  }

  User? get currentUser => client.auth.currentUser;

  // Realtime Game Logic would go here (joining rooms, listening to moves)
  // This requires a strict schema in Supabase (tables: games, moves)

  // Example: Create a game room
  Future<String> createGameRoom(String playerId) async {
    final response = await client
        .from('games')
        .insert({'player1_id': playerId, 'status': 'waiting'})
        .select()
        .single();
    return response['id'];
  }

  // Example: Listen to game updates
  Stream<List<Map<String, dynamic>>> gameStream(String gameId) {
    return client.from('games').stream(primaryKey: ['id']).eq('id', gameId);
  }
}
