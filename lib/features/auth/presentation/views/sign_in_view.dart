import 'package:flutter/material.dart';
import 'package:marketi_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'sign-in';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   leading: CircleAvatar(
      //
      //     child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      //   ),
      // ),
      body:SignInViewBody() ,
    );
  }
}
