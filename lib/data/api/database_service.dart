import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  late CollectionReference _ref;
  late DocumentReference _userRef;
  late CollectionReference _cartRef;
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

    _cartRef = _userRef
        .collection('cart')
        .withConverter<CartItem>(
        fromFirestore: (snapshot, _) => CartItem.fromJson(snapshot.data()!),
        toFirestore: (item, _) => item.toJson());

    print("user = ${user?.uid}");
  }

  /* Item DB */

  Stream<List<Item>> getStreamData() {
    return _ref.orderBy('name').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Item.fromFirebase(doc)).toList());
  }

  Future<QuerySnapshot> getData(){
    return _ref.get();
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

  /* Image DB */

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

  /* Cart DB */

  Stream<List<CartItem>> getCart() {
    return _cartRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => CartItem.fromFirebase(doc)).toList());
  }

  Future<QuerySnapshot> getCartData(){
    return _cartRef.get();
  }

  Future<void> addCart(Item item) async {
    DocumentSnapshot? doc = await _cartRef.doc(item.id).get();

    CartItem cartItem;
    if (!doc.exists){
      cartItem = CartItem(item: item, quantity: 1, total: item.sellingPrice);
    } else {
      final quantity = CartItem.fromFirebase(doc).quantity;
      cartItem = CartItem(item: item, quantity: quantity + 1, total: item.sellingPrice);
    }
    return _cartRef.doc(item.id).set(cartItem);
  }

  Future<void> updateCart(String id, CartItem item, bool isPlus) async {
    CartItem cartItem;
    if (isPlus) {
      cartItem = CartItem(item: item.item, quantity: item.quantity + 1, total: item.item.sellingPrice);
    } else {
      if (item.quantity > 1){
        cartItem = CartItem(item: item.item, quantity: item.quantity - 1, total: item.item.sellingPrice);
      } else {
        return await deleteCart(id);
      }
    }
    return _cartRef.doc(id).update(cartItem.toJson());
  }

  Future<void> deleteCart(String id) {
    return _cartRef.doc(id).delete();
  }
}
