import 'package:flutter/material.dart';
import 'dialog_box.dart';

class CardDesign extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final String imageUrl;
  final String name;
  final int price;
  final String color;
  final String size;

  const CardDesign({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.color,
    required this.size,
    required this.name,
    required this.onChanged,
  });

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  int _counter = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged(widget.price);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AspectRatio(
        aspectRatio: 18 / 6,
        child: Container(
          //color: const Color(0xff000000),
          height: 114,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Image.asset(
                    widget.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Wrap(
                        children: [
                          const Text(
                            "Color: ",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          Text(
                            widget.color,
                            style: const TextStyle(fontSize: 11),
                          ),
                          const SizedBox(width: 13),
                          const Text(
                            "Size: ",
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          Text(
                            widget.size,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_counter != 1) {
                                _counter--;
                                widget.onChanged(-widget.price);
                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 9,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child:
                                  const Icon(Icons.remove, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "$_counter",
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              _counter++;
                              widget.onChanged(widget.price);
                              if (_counter == 5) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return PopUpDialogBox(widget: widget);
                                    });
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 9,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Icon(Icons.add, color: Colors.grey),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.more_vert, color: Colors.grey),
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "${_counter * widget.price}\$",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
