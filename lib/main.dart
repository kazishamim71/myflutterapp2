import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
   HomeActivity({Key? key}) : super(key: key);

  MySnackBar(message,context){

    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      drawer: Drawer(
       // backgroundColor: Colors.green,
        child: ListView(
          children: [
            DrawerHeader(
                child: UserAccountsDrawerHeader(

                  decoration: BoxDecoration(

                    color: Colors.greenAccent),
                    /*currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 100,
                    backgroundImage:  NetworkImage(
                        "https://pixlok.com/wp-content/uploads/2021/05/flutter-logo-768x768.jpg"),

                  ),*/
                  currentAccountPicture:

                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 115,
                      child: CircleAvatar(
                        backgroundColor: Colors.greenAccent[100],
                        radius: 110,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://pixlok.com/wp-content/uploads/2021/05/flutter-logo-768x768.jpg"), //NetworkImage
                          radius: 100,
                        ), //CircleAvatar
                      ), //CircleAvatar
                    ), //CircleAvatar


                  currentAccountPictureSize: Size(50,50),



                  //currentAccountPictureSize: Size(40,40),
                  accountName: Text('Kazi Shamim'),
                  accountEmail: Text('kazishamim.info@gmail.com') ,

                )   ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){MySnackBar("This is Home", context);},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),

            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),

            ),

          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.contact_phone),label: 'Contact'),
          ],
          onTap: (int index){
            if(index==0){
              MySnackBar("This is my home", context);

            }else if(index==1){
              MySnackBar("This is my profile", context);
            }else if(index==2){
              MySnackBar("This is my contact", context);
            }
          },
        ),
      body:
        SingleChildScrollView(
          child: Column(
              children: [
               /* Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.red,
                      style: BorderStyle.solid,
                      width: 5.0,
                    ),
                  ),
                  child: Text("This is Container one"),
                ),*/
                Container(
                  height:150,
                  width: 150,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 10,
                        color: Colors.green,
                      )

                  ),
                  //  child: Image.asset('assets/images/messi01.jpg'),
                  child: Image.network('https://upload.wikimedia.org/wikipedia/commons/4/40/Madhuri_Dixit_promoting_Total_Dhamaal_in_2019_%28cropped%29.jpg',fit: BoxFit.fill,),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Name',
                    ) ,
                    onChanged: (value){
                      //print(value);
                    },
                    onSubmitted: (value){
                      print(value);
                    },


                  ),

                ),


                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Phone',
                ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                   // print(nameController.text);
                   // print(phoneController.text);
                      if(nameController.text=="" || phoneController.text==""){
                       /* ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please check the fields')));*/
                        ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(content: Text('Please check the fields'), actions: [
                          IconButton(onPressed: (){
                           ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                          }, icon: Icon(Icons.cancel))
                        ]));
                      }else{
                      /*ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(nameController.text+" "+phoneController.text)));*/
                        ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(content: Text(nameController.text+" - "+phoneController.text), actions: [
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                          }, icon: Icon(Icons.cancel))

                        ]));
                    }
                      },
                    child: Text('Submit'),


                  )
                ),
              ],
          ),

        )

    );
  }
}





