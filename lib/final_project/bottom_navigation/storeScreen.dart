import 'package:flutter/material.dart';

class storeScreen extends StatelessWidget {
  const storeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: content(),
    );
  }

  Widget content() {
    //create data
    List<String> itemPath = [
      'https://firebasestorage.googleapis.com/v0/b/itiproject-25f76.appspot.com/o/shoe1.jpeg?alt=media&token=ea5ec770-1beb-4c6a-a0be-c34ff23f7737',
      'https://firebasestorage.googleapis.com/v0/b/itiproject-25f76.appspot.com/o/shoe2.jpeg?alt=media&token=65f2b358-5b0a-4084-ab2f-c0c628b51ec9',
      'https://firebasestorage.googleapis.com/v0/b/itiproject-25f76.appspot.com/o/shoe3.jpeg?alt=media&token=5172dd4e-0322-4ba5-a002-d38ee4535a3d',
      'https://firebasestorage.googleapis.com/v0/b/itiproject-25f76.appspot.com/o/shoe4.jpeg?alt=media&token=ebcf0cb8-f454-420b-b794-0a50d20f0e7c',
      'https://firebasestorage.googleapis.com/v0/b/itiproject-25f76.appspot.com/o/shoe5.jpeg?alt=media&token=a2ccc9f4-4cad-4846-b42a-b805af51a7c5',
    ];
    List<String> itemPrice = [
      "\$200",
      "\$250",
      "\$300",
      "\$400",
      "\$150",
    ];
    List<String> itemName = [
      " Adidas XI",
      " Under Amour",
      " Adidas X",
      " Nike II",
      " Puma"
    ];
    List<bool> isFavourite = [true, true, false, false, false];

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "All",
                      style: TextStyle(
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Shoes"),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Clothes"),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Watches")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable ListView scrolling
                  itemBuilder: (context, index) {
                    return item(context, itemPath[index], itemName[index],
                        itemPrice[index], isFavourite[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(BuildContext context, String itemPath, String itemName,
      String itemPrice, bool isFavourite) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/item'),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Hero(
          tag: itemName,
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              color: const Color(0xfFE9EBEA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        // Use Image.network to display network images
                        image: NetworkImage(itemPath),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      itemPrice,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.favorite,
                    color: isFavourite ? Colors.red : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
