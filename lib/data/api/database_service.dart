import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  late CollectionReference _ref;
  late DocumentReference _userRef;
  User? user = FirebaseAuth.instance.currentUser;

  DatabaseService() {
    _userRef = _db
        .collection('users')
        .doc(user!.uid);

    _ref = _userRef
        .collection('items')
        .withConverter<Item>(
            fromFirestore: (snapshot, _) => Item.fromJson(snapshot.data()!),
            toFirestore: (item, _) => item.toJson());
  }

  Stream<List<Item>> getData() {
    return _ref.orderBy('name').snapshots().map((snapshot) =>
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

  Future<String> uploadImage(File image, bool isItem) async {
    String filename = basename(image.path);

    Reference ref = FirebaseStorage.instance.ref(user!.uid);
    if (isItem) {
      ref = ref.child('items').child(filename);
    } else {
      ref = ref.child('profile_image.jpg');
    }
    ref.putFile(image);

    return await ref.getDownloadURL();
  }
  
  Future<void> setUserProfile(String? imageUrl) async {
    final data = {
      "profile_image": imageUrl,
    };
    
    return await _userRef.set(data);
  }
  
  Stream<DocumentSnapshot> getUserProfile(){
    return _userRef.snapshots();
  }
}
