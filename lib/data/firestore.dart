// import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names, avoid_print, prefer_const_constructors, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/notes_model.dart';
import 'package:uuid/uuid.dart';

class FirestoreDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser(String email) async {
    try {
      await _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> addNote(String subtitle, String title, int image) async {
    try {
      var uuid = Uuid().v4();
      DateTime data = new DateTime.now();
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': uuid,
        'subtitle': subtitle,
        'isDon': false,
        'image': image,
        'time': '${data.hour}:${data.minute}',
        'title': title,
      });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notesList = snapshot.data!.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(
          data['id'],
          data['subtitle'],
          data['time'],
          data['image'],
          data['title'],
          data['isDon'],
        );
      }).toList();
      return notesList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<QuerySnapshot> stream(bool isDone) {
    return _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('notes')
      .where('isDon', isEqualTo: isDone)
      .snapshots();
  }

  Future<bool> isdone(String uuid, bool isDon) async {
    try {
      await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .doc(uuid)
        .update({'isDon': isDon});
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> updateNote(String uuid, int image, String title, String subtitle) async {
    try {
      DateTime data = new DateTime.now();
      await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .doc(uuid)
        .update({
          'time': '${data.hour}:${data.minute}',
          'subtitle': subtitle,
          'title': title,
          'image': image,
        });
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<bool> deleteNote(String uuid) async {
    try {
      await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .doc(uuid)
        .delete();
      return true;
    } catch (e) {
      print(e);
      return true;
    }
  }
}
