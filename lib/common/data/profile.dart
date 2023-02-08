import '../utils/stage.dart';
import '../utils/contact.dart';

final profileLinks = [
  const Contact(icon: "github-mark-48", data: "https://github.com/JeysonFlores"),
  const Contact(icon: "linkedin", data: "https://www.linkedin.com/in/jeyson-antonio-flores-deras-1511b4250/"),
  const Contact(icon: "twitter", data: "https://twitter.com/JeysonF92764691"),
];

final profileContact = [
  const Contact(icon: "calendar", data: "August 30, 2000"),
  const Contact(icon: "place", data: "Mazatlán, Sinaloa, México"),
  const Contact(icon: "email", data: "jeysonoknoztop@gmail.com"),
  const Contact(icon: "phone", data: "(+52) 694 108 2564"),
];

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
