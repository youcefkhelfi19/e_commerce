import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
   final controller = Get.find<AuthController>();
   bool isSwitched = false;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                ),
                const Text('Username',style: const TextStyle(color: mainColor,fontSize: 25),),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('User Details',style: TextStyle(fontSize: 20),),

                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:appGrey,
                  ),
                  child: Column(
                    children:const [
                       CustomListTile(

                        title: 'Email address', subtitle: 'youcefkhe8@gmail.com',
                      ),
                       CustomListTile(
                        title: 'Phone number', subtitle: '068262326',
                      ),
                       CustomListTile(
                        title: 'Delivery Address', subtitle: 'road15,raselma,setif,algeria',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: const Text('Settings',style: TextStyle(fontSize: 20),)),
                const SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:appGrey,
                  ),
                  child: Column(
                    children: [


                      ListTile(
                        title: Text('Language'),
                        subtitle: Text('English'),
                        onTap: (){},
                        trailing: const Icon(Ionicons.caret_down_outline,color: mainColor,),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(),
                      ),
                      TappedListTile(
                        title: 'Dark mode',
                        onTap: (){},
                        icon: Switch(
                          value: true,
                          onChanged: (value) {

                              isSwitched = value;
                              print(isSwitched);

                          },
                          activeTrackColor:darkColor,
                          activeColor: mainColor,
                        ),

                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(),
                      ),
                      TappedListTile(
                        title: 'Logout',
                        onTap: (){},
                        icon: GetBuilder<AuthController>(
                          builder: (context) {
                            return GestureDetector(
                                onTap: (){
                                  controller.signOut();
                                },
                                child: const Icon(Ionicons.log_out_outline,color: mainColor,));
                          }
                        ),

                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GetBuilder<AuthController>(
                    builder: (context) {
                      return TextButton(
                        onPressed: (){
                          controller.getUserData('uid');
                        },
                        child: const Text('Delete my account',style:  TextStyle(color: Colors.red),),
                      );
                    }
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

class TappedListTile extends StatelessWidget {
  const TappedListTile({
    Key? key, required this.title, required this.onTap, required this.icon,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:  Text(title),
      trailing: icon
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key, required this.title, required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
