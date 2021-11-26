import "package:flutter/material.dart";

class sanket extends StatelessWidget {
  final List<String> plantName = [
    "Vegetable Plants",
    "Fruit Plants",
    "Flowering Plant",
    "Ornamental plants",
    "Medicinal Plants",
    "Agricultural Plant"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your Plant"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView.builder(
              itemCount: plantName.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),

                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 50,
                    shadowColor: Colors.green,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("${plantName[index]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  //  );
                );
              }),
        ),
      ),
    );
  }
}
