import 'package:flutter/material.dart';
import 'package:flutter_slivers_demo/sliver_header.dart';

class SliversDemo extends StatefulWidget {
  @override
  _SliversDemoState createState() => _SliversDemoState();
}

class _SliversDemoState extends State<SliversDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _name = ['tester'];

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        }

        return null;
      },
      onSaved: (String value) {
        setState(() {
          _name.add(value);
        });
      },
    );
  }

  Widget _buildFixedList(Color color, String _text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          _text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    print(_name.toString());

    return Scaffold(
      backgroundColor: Color(0xFFEDF2F8),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Flutter Slivers Demo',style:
            TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            backgroundColor: Color(0xFFEDF2F8),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&"
                      "ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&"
                      "fit=crop&w=500&q=60",
                  fit: BoxFit.cover),
            ),
          ),
          SliverHeader(Colors.red, "SliverPersistentHeader 1"),
          SliverHeader(Colors.blue, "SliverPersistentHeader 2"),
          SliverHeader(Colors.purple, "SliverPersistentHeader 3"),
          SliverFixedExtentList(
            itemExtent: 70,
            delegate: SliverChildListDelegate([
              _buildFixedList(Colors.cyan, "Cyan"),
              _buildFixedList(Colors.green, "Green"),
              _buildFixedList(Colors.orange, "Orange"),
              _buildFixedList(Colors.amberAccent, "AmberAccent"),
              _buildFixedList(Colors.blueGrey, "Blue Grey"),
                         ]),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Add Name', style: TextStyle(fontSize: 22)),
                      _buildName(),
                      SizedBox(height: 16),
                      RaisedButton(
                        child: Text('Submit'),
                        onPressed: _submit,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10,
                childAspectRatio: 1.5
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.all(8),
                color: _randomColor(index),
                child: Center(
                  child: Text(
                    _name[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
                childCount: _name.length
            ),
          )
        ],
      ),
    );
  }
}

Color _randomColor(int index) {
  if (index % 4 == 0) {
    return Colors.blue;
  } else if (index % 4 == 1) {
    return Colors.orange;
  }else if(index % 4 == 2){
    return Colors.cyan;
  }
  return Colors.red;
}