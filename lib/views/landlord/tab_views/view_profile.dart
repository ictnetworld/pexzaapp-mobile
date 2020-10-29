import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pexza/view_model/landlord_vm/lnld_signin_vm.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LandLordViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LandLordSignInViewModel>.withConsumer(
      viewModelBuilder: () => LandLordSignInViewModel(),
      onModelReady: (model) => model.getUser(),
      builder: (context, model, _) => model.user.firstName == null
          ? Center(
              child: SpinKitChasingDots(
                color: Color(0xff2079A5),
                size: 50,
              ),
            )
          : Container(
              // color: Colors.white,
              child: ListView(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 0.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(model.user.photo),
                              radius: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: ListTile(
                        title: Text(model.user.fullName),
                        subtitle: Text('Fullname'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: ListTile(
                        title: Text(model.user.email),
                        subtitle: Text('Email'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: ListTile(
                        title: Text(model.user.gender),
                        subtitle: Text('Gender'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: ListTile(
                        title: Text(model.user.userType),
                        subtitle: Text('Status'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: ListTile(
                        title: Text(model.user.age),
                        subtitle: Text('Age'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: ListTile(
                        title: Text(model.user.phone),
                        subtitle: Text('Phone Number'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => model.landlordOut(),
                    child: model.busy == true
                        ? Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.red),
                            ),
                        )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Logout",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ImageIcon(
                                AssetImage("images/logout.png"),
                                color: Colors.red,
                              ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
    );
  }
}
