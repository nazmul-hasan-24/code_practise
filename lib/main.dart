
import 'package:code_practise/images_link.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      theme: ThemeData(useMaterial3: true),
      title: "Assignment 06",
      home:  Mypage(),
    );
  }
}

class Mypage extends StatelessWidget {
   Mypage({super.key});
var MyImages =[
  {'img': 'https://th.bing.com/th/id/OIP.mLg2psW5bI6LnmK9HB-byQHaE6?w=186&h=123&c=7&r=0&o=5&pid=1.7', 'title':'Food 1'},
  {'img': 'https://th.bing.com/th/id/OIP.R6Y1yAxnp-z9WLbjv0ph-AHaE8?w=186&h=124&c=7&r=0&o=5&pid=1.7', 'title':'Food 2'},
  {'img': 'https://th.bing.com/th/id/OIP.IMGeVOG6qy0eIcmQGqw59QHaFj?w=186&h=140&c=7&r=0&o=5&pid=1.7', 'title':'Food 3'},
  {'img': 'https://th.bing.com/th/id/OIP._WSnlfLNcen_XnyaF-u01QHaHa?w=186&h=186&c=7&r=0&o=5&pid=1.7', 'title':'Food 4'},
  {'img': 'https://th.bing.com/th/id/OIP.EWK6RjAG94XnZ0E0qGaeqQHaGq?w=186&h=168&c=7&r=0&o=5&pid=1.7', 'title':'Food 5'},
  {'img': 'https://th.bing.com/th/id/OIP.kvz5Y6YrKcXmHQLoP1-ExgHaE8?w=186&h=124&c=7&r=0&o=5&pid=1.7', 'title':'Food 6'},
];
mySnackBar(context, msg){
  return ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(msg)));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Photo Gallery'),
        centerTitle: true,
       elevation: 15,
      ),
     body:    SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome to my photo Gallery!"),
                const SizedBox( height: 10,),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Search for Photo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                    )
                  ),
                ),
                const SizedBox(height: 15,),
                GridView.builder(
                
                  shrinkWrap: true,
                    itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    crossAxisCount: 3), 
                  itemBuilder: (context , int index ){
                  return  GestureDetector(
                      onTap: (){
                       mySnackBar(context, MyImages[index]['title']);
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Image.network(MyImages[index]['img']!,
                            height: 80, width: 80,),
                            const SizedBox(height: 10,),
                            Text('Food  $index', style: const TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                      );
                  })
              ],
            ),
            ),
             ListTile(
              
              leading: CircleAvatar(child: Image.network(pic1)),
              title: const Text('Photo '),
              subtitle: const Text("Description for photo 1"),
            ),
             ListTile(
              leading: CircleAvatar(child: Image.network(pic2)),
              title: const Text('Photo 2'),
              subtitle: const Text("Description for photo 2"),
            ),
             ListTile(
              
              leading: CircleAvatar(child: Image.network(pic3),
              backgroundColor: Colors.black,
             ),
              title: const Text('Photo 3'),
              subtitle: const Text("Description for photo 3"),
             )
        ],
      ),
     ),
     floatingActionButton: FloatingActionButton(onPressed: () {
        const mySnackBar =SnackBar(content: Text(
                          'Uploaded Successfully'),
                          backgroundColor: Color.fromARGB(255, 78, 245, 164),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
     },
     child: const Icon(Icons.upload),),
     );
     }
}