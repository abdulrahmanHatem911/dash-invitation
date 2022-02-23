import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';

Widget buildeItem(model) => Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10.0,
        start: 10.0,
        end: 10.0,
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: HexColor('b4f1f1'),
            ),
            child: Row(
              children: [
                const SizedBox(width: 5.0),
                Container(
                  width: 80.0,
                  height: 80.0,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: HexColor('ecfffb'),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assest/image/duck.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(
                        child: Text(
                          'دعوة حضور ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'عزيز/ ${model['receiver']} \n سأسعد برؤيتك يوم ${model['date']} \n في مدينة ${model['location']} \n مع تحياتي, ${model['sender']}',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              String messageShare =
                  'عزيز/ ${model['receiver']} \n سأسعد برؤيتك يوم ${model['date']} \n في مدينة ${model['location']} \n مع تحياتي, ${model['sender']}';
              Share.share(messageShare);
            },
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
        ],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
// the alert for image picker
void navigatorFrom(context) => Navigator.pop(context);
// for image
