import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'AddData.dart';
import 'BottomSheet.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('groceryplus');
  final fromKeyEdit = GlobalKey<FormState>();

  Future<void> delete(String id) async {
    await _reference.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => AddData(
                        referance: _reference,
                      )));
            }),
        body: StreamBuilder(
          stream: _reference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot docSnap = snapshot.data!.docs[index];
                  return ListTile(
                    title: Text(docSnap['title']),
                    subtitle: Text(docSnap['description']),
                    leading: IconButton(
                      onPressed: () {
                        delete(docSnap.id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            enableDrag: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25))),
                            context: context,
                            builder: (context) => MyBottomSheet(
                                referance: _reference,
                                docSnap: docSnap,
                                formKey: fromKeyEdit),
                          );
                        },
                        icon: const Icon(Icons.edit)),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
