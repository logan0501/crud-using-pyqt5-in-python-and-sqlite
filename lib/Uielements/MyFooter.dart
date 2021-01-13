import 'package:flutter/material.dart';

import '../crud.dart';
class MyFooter extends StatefulWidget {
  @override
  _MyFooterState createState() => _MyFooterState();
}

class _MyFooterState extends State<MyFooter> {
  String name,email,question,answer="Done at backend part";
  CrudMethods crudMethods = CrudMethods();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final questioncontroller = TextEditingController();

  clearInputText(){
    namecontroller.clear();
    emailcontroller.clear();
    questioncontroller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return       Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Color(0xffD7E5FB),
          borderRadius: BorderRadius.vertical(top: Radius.circular(100))

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "JOIN OUR COMMUNITY"
              ,textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff277CFF),
                fontSize: 20,
              ),
            ),
          ),
          MyRow(name: name,text: "Name",controller:namecontroller,),
          MyRow(name: email,text: "Email",controller: emailcontroller,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex:1,
                  child: Text("Question",
                    style: TextStyle(
                      color: Colors.black,
                    ),),
                ),

                Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),

                    child: TextField(

                      maxLines: 5,
                      enabled: true,

                      onChanged: (val){
                        question=val;
                      },
                      style: TextStyle(
                        height: 1.5
                        ,
                      ),
                      controller: questioncontroller,
                      decoration: InputDecoration(

                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          RaisedButton(onPressed: (){
            Map<String,String> data = {
              "name":name,
              "email":email,
              "question":question,
              "answer":answer
            };
            crudMethods.putdata(data);
            clearInputText();
            setState(() {

            });
          },
            child: Text("SUBMIT"),
            color: Colors.blue,)
        ],

      ),

    );
  }
}

class MyRow extends StatefulWidget {
  String name,text;
  TextEditingController controller;
  MyRow({this.name,this.text,this.controller});
  @override
  _MyRowState createState() => _MyRowState();
}

class _MyRowState extends State<MyRow> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex:1,
            child: Text(widget.text,
              style: TextStyle(
                color: Colors.black,
              ),),
          ),

          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              child: TextField(
                controller: widget.controller,
                enabled: true,

                onChanged: (val){
                  widget.name=val;
                },
                style: TextStyle(
                  height: 1.5
                  ,
                ),
                decoration: InputDecoration(

                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)
                  ),

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
