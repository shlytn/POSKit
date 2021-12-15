import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  late CollectionReference _ref;
  User? user = FirebaseAuth.instance.currentUser;

  DatabaseService() {
    _ref = _db
        .collection('users')
        .doc(user!.uid)
        .collection('items')
        .withConverter<Item>(
            fromFirestore: (snapshot, _) => Item.fromJson(snapshot.data()!),
            toFirestore: (item, _) => item.toJson());
  }

  Stream<List<Item>> getData() {
    return _ref.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromFirebase(doc)).toList());
  }

  Future<DocumentSnapshot> getDataById(String id) {
    return _ref.doc(id).get();
  }

  Future<DocumentReference> addData(Item item) {
    return _ref.add(item);
  }

  Future<void> updateData(String id, Item item) {
    return _ref.doc(id).set(item);
  }

  Future<void> deleteData(String id) {
    return _ref.doc(id).delete();
  }

  Future<String> uploadImage(File image) async {
    String filename = basename(image.path);

    Reference ref = FirebaseStorage.instance.ref().child(filename);
    UploadTask task = ref.putFile(image);
    TaskSnapshot snapshot = task.snapshot;

    return await snapshot.ref.getDownloadURL();
  }
}
