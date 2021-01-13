import 'package:faq/Uielements/Header.dart';
import 'package:faq/Uielements/MyFooter.dart';
import 'package:flutter/material.dart';
import 'crud.dart';
class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  CrudMethods crudMethods = CrudMethods();
  Stream snapshot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    crudMethods.getData().then((result){
      setState(() {
        snapshot = result;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        child: Column(

          children: [
            MyHeader(),
            Container(
              child: Flexible(
                child: ListView(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: snapshot!=null?StreamBuilder(
                            stream: snapshot,
                            builder: (context,snap){
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snap.data.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context,index){
                                  return snap.data!=null? ExpansionTile(

                                    title: Text(snap.data.docs[index].data()['question'],) ,
                                    expandedAlignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          child: Text(snap.data.docs[index].data()['answer'],))
                                    ],
                                  ):Container(
                                      alignment: Alignment.center,
                                      child: CircularProgressIndicator());
                                },
                              );
                            })
                            :CircularProgressIndicator()
                    )
                  ],
                ),
              ),
            ),
            MyFooter(),
          ],
        ),
      ),
    );
  }
}

