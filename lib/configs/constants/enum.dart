import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue("female")
  female,
  @JsonValue("male")
  male,
}

enum PeopleAmount { one, two, three, four }

enum CacheControllerKey { token, userId }

enum UserType { user1, user2 }

enum KeywordType { taste, cusine, foodType }

enum Meal { breakfast, lunch, dinner }

String peopleAmountToKorean(PeopleAmount peopleAmount) {
  switch (peopleAmount) {
    case PeopleAmount.one:
      return '1인';
    case PeopleAmount.two:
      return '2인';
    case PeopleAmount.three:
      return '3인';
    case PeopleAmount.four:
      return '4인';
    default:
      return '';
  }
}

String mealToEnglish(Meal meal) {
  switch (meal) {
    case Meal.breakfast:
      return 'breakfast';
    case Meal.lunch:
      return 'lunch';
    case Meal.dinner:
      return 'dinner';
    default:
      return '';
  }
}
