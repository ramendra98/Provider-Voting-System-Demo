import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/VotinProvider.dart';

class HomePage extends StatelessWidget {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Heyyy RAm');
    final dataProvide = Provider.of<VotingProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: name,
                  ),
                ),
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: MaterialButton(
                    onPressed: () {
                      if (name.text.isNotEmpty) {
                        dataProvide.addItem(name.text);
                      }
                    },
                    child: Text('Add'),
                  ),
                ),
                Consumer<VotingProvider>(
                  builder: (_, data, __) => Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: dataProvide.getData.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5.0,
                            child: ListTile(
                              onTap: () {
                                dataProvide.incrementVots(index);
                              },
                              title: Text('${data.getData[index]['title']}'),
                              trailing: CircleAvatar(
                                child: Text('${data.getData[index]['votes']}'),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
