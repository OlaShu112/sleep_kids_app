import 'package:flutter/material.dart';
import 'package:sleep_kids_app/core/models/education_model.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  _EducationScreenState createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen>
    with TickerProviderStateMixin {
  List<Education> educationList = [];
  int? expandedIndex;

  @override
  void initState() {
    super.initState();
    _getEducation();
  }

  void _getEducation() {
    setState(() {
      educationList = Education.getEducation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sleep Education")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: educationList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final education = educationList[index];
          bool isExpanded = expandedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? null : index;
              });
            },
            child: AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isExpanded ? Colors.teal[300] : Colors.teal[100],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      education.courseName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRect(
                      child: AnimatedSize(
                        duration: const Duration(milliseconds:250),
                        curve: Curves.easeInOut,
                        child: Text(
                          education.context,
                          maxLines: isExpanded ? null : 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    if (isExpanded)
                      const Center(
                        child: Icon(
                          Icons.expand_less,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
