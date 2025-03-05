import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/classes/recommandation.dart';
import 'package:untitled1/views/AddView.dart';
import 'Setting.dart';

import 'Chat.dart';
import 'Detailview.dart';
import '../classes/camps.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectedIndex = 0;
  final List<camps> ls = camps.getcamps();
  List<recomdation> rc = recomdation.getrec();
  DraggableScrollableController scrolcrtl=DraggableScrollableController();
  double barpos=220;
  double titleocp=1;
  bool btn=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrolcrtl.addListener(()
    {
      setState(() {
        barpos = (230 - (scrolcrtl.size - 0.6) * 1000);
        barpos=barpos.clamp(20, 220);
        titleocp = 1 - ((scrolcrtl.size - 0.6) / 0.2);
        titleocp=titleocp.clamp(0, 1);
        btn=scrolcrtl.size==0.6;
        print(barpos);
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    scrolcrtl.dispose();
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                height: 370,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/camping.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: titleocp,
                    duration: Duration(microseconds: 0),
                    child:Text(
                      'Hello, Orely',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),textAlign: TextAlign.center,
                    ),)),
              AnimatedPositioned(
                  top: barpos,
                  left: 20,
                  right: 20,
                  duration: Duration(microseconds: 0),
                  child: SearchBar(
                    hintText: 'Search Camp',
                    leading: const Icon(Icons.search),
                    trailing: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list),
                      ),
                    ],
                    elevation: const WidgetStatePropertyAll(1.0),
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: const WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  )),
              DraggableScrollableSheet(
                controller: scrolcrtl,
                initialChildSize: 0.6,
                minChildSize: 0.6,
                maxChildSize: 0.87,
                builder: (context, scrollController) {
                  return ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF8F8),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: const Color.fromARGB(255, 191, 204, 142),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Nearby Camp',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Turn on your location service',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(height: 4),
                                      FilledButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.location_on),
                                        label: const Text('Turn on location'),
                                        style: FilledButton.styleFrom(
                                          backgroundColor: const Color(0xFF3E501F),
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ls.length,
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(width: 40),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                          AssetImage(ls[index].path),
                                        ),
                                        const SizedBox(height: 9),
                                        Text(
                                          ls[index].name,
                                          style: const TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 8, bottom: 15, top: 10),
                                child: Text(
                                  'Recommendation',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: rc.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: ()=>click(index),
                                    child: Card(
                                      color: Colors.white,
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                              width:double.infinity,
                                              height: 200,
                                              child: Image.asset(rc[index].path,fit: BoxFit.cover,height:MediaQuery.of(context).size.height/4
                                        ,width:double.infinity,)),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 10, 20, 10),
                                            child: Row(
                                              children: [
                                                // Date Column
                                                Column(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xff89AC46)
                                                            .withOpacity(0.7),
                                                      ),
                                                      child: Text(
                                                        rc[index].day,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      rc[index].month,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 20),
                                                // Details Column
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      rc[index].title,
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      rc[index].location,
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(top: 30),
          child: NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;

                switch (index) {
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    break;
                  case 3:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
                    break;
                  case 4:
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
                    break;
                }
              });
            },
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.photo_album_outlined),
                label: 'Gallery',
                selectedIcon: Icon(Icons.photo_album),
              ),
              FloatingActionButton(
                backgroundColor: Color(0xff677E32),
                shape: const CircleBorder(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Addview()));
                },
                child: const Icon(Icons.add),
              ),
              const NavigationDestination(
                icon: Icon(Icons.chat_outlined),
                label: 'Chat',
              ),
              const NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          ),

      ),
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(seconds: 20),
        child:btn ? FloatingActionButton.extended(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.black,
          label: Row(
            children:  [
              Text(
                'Map',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(width: 4),
              Icon(
                Icons.map,
                color: Colors.white,
              ),
            ],
          ),
        )
            :FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.black,
          child:
          Icon(
            Icons.map,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  click(int index){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailview(p: rc[index])));
  }
}