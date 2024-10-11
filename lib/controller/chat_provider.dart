import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getChats(String userID) {
    return _firestore
        .collection("chats")
        .where('users', arrayContains: userID)
        .snapshots();
  }

  Stream<QuerySnapshot> searchUser(String query) {
    return _firestore
        .collection("users")
        .where('email', isGreaterThanOrEqualTo: query)
        .where('email', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots();
  }

  Future <void> sendMessage(String chatID, String message, String receiverId) async{
    final currentUser = _auth.currentUser;

  }
}
