import 'package:api_task/control/cubit/get_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product_Screen extends StatefulWidget {
  Product_Screen();

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading:    Icon(
        //       Icons.search,
              
        //     ),
        title:    Icon(
              Icons.search,
            ),
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Icon(Icons.card_travel_rounded),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
                Text("Category")
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Plates",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Center(
                      child: Text("Sort"),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: Center(
                      child: Text("Filter"),
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            BlocBuilder<GetDataCubit, GetDataState>(
              builder: (context, state) {
                return ListView.separated(

                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (contex, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                     width: MediaQuery.of(context).size.width,
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        GetDataCubit.get(context)
                                            .products[index]
                                            .image
                                            .toString()),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 160,
                                child: Text(
                                  GetDataCubit.get(context)
                                      .products[index]
                                      .title
                                      .toString(),
                                    
                                      
                                ),
                              ),
                                SizedBox(
                            height: 10,
                          ),
                              Text(
                                "\$ ${GetDataCubit.get(context).products[index].price}",
                                style: TextStyle(color: Colors.grey),
                              ),
                               SizedBox(
                            height: 10,
                          ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 130,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 255, 81, 0),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "ADD TO CART",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(Icons.favorite)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: GetDataCubit.get(context).products.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
