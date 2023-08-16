import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../dio/api_provider.dart';
import '../dio/model/storiesModel.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  SuccessStoriesModel? successStories;
  bool loading = true;

  getData() async {
    successStories = await ApiProvider().getStories();
    setState(() {
      loading = false;
    });
  }

  void initState() {
    super.initState();
    ApiProvider().getStories();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=600"),
            ),
            SizedBox(
              width: 21,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            )
          ],
        ),
        actions: [
          CircleAvatar(
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  size: 16,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    size: 16,
                  )),
            ),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.search),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Search"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 100,
                      child: ListView.separated(
                        itemBuilder: (context, index) => buildChatItem(
                            successStory: successStories!.model![index],
                            index: index),
                        itemCount: successStories!.model!.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 8,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => messengerChatItem(
                          successStory: successStories!.model![index],
                          index: index),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: successStories!.model!.length,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

Widget buildChatItem({required Model successStory, required int index}) {
  return Container(
    width: 64,
    child: Column(
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(successStory.image!),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 2, end: 2),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.green,
            ),
          )
        ]),
        SizedBox(
          height: 10,
        ),
        Text(
          successStory.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget messengerChatItem({required Model successStory, required int index}) {
  return Row(children: [
    Stack(alignment: Alignment.bottomRight, children: [
      CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=600"),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(bottom: 2, end: 2),
        child: CircleAvatar(
          radius: 5,
          backgroundColor: Colors.green,
        ),
      )
    ]),
    const SizedBox(
      width: 5,
    ),
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 250,
        child: Text(
          successStory.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Row(
        children: [
          Container(
            width: 20,
            child: Text(
              successStory.id!,
            ),
          ),
          const SizedBox(
            width: 60,
          ),
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text("12:00 am"),
        ],
      )
    ])
  ]);
}
