import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen' ;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Whatsapp'),
            backgroundColor: Colors.teal,
            centerTitle: false,
            bottom: const TabBar(
                tabs: [
                  Tab(
                    child:Icon(Icons.camera_alt) ,
                  ),

                  Tab(
                    child:Text('Chats') ,
                  ),

                  Tab(
                    child:Text('Status'),
                  ),

                  Tab(
                    child:Text('Calls'),
                  ),



                ]),
            actions: [
              Icon(Icons.search),
              SizedBox(width: 10),

              PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (context,) =>[
                    PopupMenuItem(child: Text('New Group')),
                    PopupMenuItem(child: Text('Settings')),
                    PopupMenuItem(child: Text('Logout')),
                  ],

              ),
              //Icon(Icons.more_vert),
              SizedBox(width: 10),

            ],
          ),
          body: TabBarView(
            children: [
              Text('Camera'),
              ListView.builder(
                itemCount: 10,
                  itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('John Wick'),
                    subtitle: Text('Where is My Dog'),
                    trailing: Text('1 : 12 PM'),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://images3.alphacoders.com/801/801817.jpg'),
                    ),
                    

                  );


                  }),

              //Text('Status'),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // My Status
                    return ListTile(
                      leading: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              'https://images3.alphacoders.com/801/801817.jpg',
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: const Text('My Status'),
                      subtitle: const Text('Tap to add status update'),
                    );
                  } else {
                    // Other Contacts' Statuses
                    return ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/75.jpg',
                          ),
                        ),
                      ),
                      title: Text('Anas  ${index}'),
                      subtitle: Text('${index + 1}:00 PM'),
                    );
                  }
                },
              ),



              // Text('Calls'),
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('John Wick'),
                      subtitle: Text(index / 2 == 0 ? 'Online' : 'Offline'),
                      trailing: Icon(index / 2 == 0 ? Icons.call : Icons.videocam),

                      //trailing: Text('1 : 12 PM'),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('https://images3.alphacoders.com/801/801817.jpg'),
                      ),


                    );


                  }),
            ],
          ),
        ));
  }
}
