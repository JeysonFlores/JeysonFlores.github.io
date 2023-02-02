import '../utils/stage.dart';

final profileContact = {
  "calendar": "August 30, 2000",
  "place": "Mazatlán, Sinaloa, México",
  "email": "jeysonoknoztop@gmail.com",
  "phone": "(+52) 694 108 2564",
};

const List<Stage> profileEducation = [
  Stage(title: "IT Technician", institution: "CONALEP", date: "2015-2018"),
  Stage(
      title: "Systems Engineer",
      institution: "Universidad Autónoma de Sinaloa",
      date: "2018-2022")
];

const List<Stage> profileCerts = [
  Stage(title: "IT Specialist in Python", institution: "Pearson", date: "2022"),
  Stage(title: "IT Specialist in Java", institution: "Pearson", date: "2022"),
];

const List<Stage> profileExperience = [
  Stage(
    title: "Fullstack Developer",
    institution: "Deras Inmobiliaria",
    date: "2020-2022",
    description: ["Use Python and SQL", "Linux server administration", "etc"],
  ),
  Stage(
    title: "Backend Developer",
    institution: "EnvíoClick",
    date: "2022-",
    description: [
      "AWS Lambdas",
      "Python and SQL",
      "NoSQL (Redis and DynamoDB)"
    ],
  )
];
