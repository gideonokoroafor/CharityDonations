import 'package:card_swiper/card_swiper.dart';
import 'package:charity_donations/model/charity_donations_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final snap;
  // final snapLen;
  const PostCard({
    super.key,
    this.snap,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  CharityDonationsModel model = CharityDonationsModel();
  int len = 0;

  getlen() {
    // ignore: unused_local_variable
    for (var element in widget.snap['url']) {
      len++;
    }
    return len;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://thumbs.dreamstime.com/b/sunrise-canal-park-duluth-mn-76481949.jpg'),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.snap['fullname'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: ['Delete', 'Bookmarks']
                                        .map((e) => InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                            ))
                                        .toList()),
                              ));
                    },
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
          ),
          // Image section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Swiper(
                itemCount: getlen(),
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.snap['url'][index],
                    fit: BoxFit.cover,
                  );
                },
                // scrollDirection: Axis.vertical,
                loop: false,
                pagination:
                    const SwiperPagination(alignment: Alignment.bottomCenter),
              ),
            ),
          ),

          // bookmarks section
          // Row(
          //   children: [],
          // )

          // ITEM DESCRIPTION
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      widget.snap['category'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 0),
                    child: RichText(
                        text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: widget.snap['itemName'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: '   '),
                          TextSpan(
                              text: widget.snap['description'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal)),
                        ])),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMd()
                          .format(widget.snap['datePublished'].toDate()),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
