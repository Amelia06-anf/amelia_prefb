import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Firestore extends StatelessWidget {
  const Firestore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CRUD'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('coba').doc().set({'nama': 'andini'});
                },
                child: const Text('CREATE'),
              ),
              OutlinedButton(
                onPressed: () async {
                  final result = await FirebaseFirestore.instance.collection('username').get();
                  debugPrint(result.toString());
                  debugPrint(result.toString());
                  debugPrint(result.docs.toString());
                  debugPrint(result.docs[0].toString());
                  debugPrint(result.docs[1].id.toString());
                  debugPrint(result.docs[1].data()['nama'].toString());
                },
                child: const Text('READ'),
              ),
              OutlinedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('username')
                      .doc('Q7P7Gu351nVEd0snw8hr')
                      .update({'nama': 'amelia'});
                },
                child: const Text('UPDATE'),
              ),
              OutlinedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('username').doc('Q7P7Gu351nVEd0snw8hr').delete();
                },
                child: const Text('DELETE'),
              ),
            ],
          ),
        ));
  }
}
