import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/theme/app_theme.dart';
import '../models/question_models.dart';
import '../utils/constants.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Define the data
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quizz PDF',
          style: kDisplayH1.copyWith(fontSize: 20.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF27354B),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.ligthGray,
      ),
      backgroundColor: AppTheme.ligthGray,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: kQuizzQuestion,
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppTheme.darkBlue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: kQuizzQuestion,
          ),
        ),
      ],
    );
  }

  Widget _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: InkWell(
        child: Container(
          height: 6.h,
          width: 80.h,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF27354B) : Colors.grey[500],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              answer.answerText,
              style: kDisplayArticleH1.copyWith(color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
      ),
    );
  }

  Widget _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return InkWell(
      onTap: () {
        if (isLastQuestion) {
          // Display score
          showDialog(
            context: context,
            builder: (_) => _showScoreDialog(),
          );
        } else {
          // Next question
          setState(() {
            selectedAnswer = null;
            currentQuestionIndex++;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:50.0),
        child: Container(
          height: 6.h,
          width: 80.h,
          decoration: BoxDecoration(
            color: const Color(0xFF27354B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              isLastQuestion ? "Submit" : "Next",
              style: kDisplayArticleH1.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showScoreDialog() {
    bool isPassed = false;

    if (score >= questionList.length * 0.6) {
      // Pass if 60%
      isPassed = true;
    }
    String title = isPassed ? "Passed" : "Failed";

    return AlertDialog(
      title: Text(
        "$title | Score is $score",
        style: TextStyle(
          color: isPassed ? Colors.green : Colors.redAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title =
                isPassed ? "Congratulations on completing the quiz!" : "lolo",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text("Restart"),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                selectedAnswer = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
