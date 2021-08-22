class NotificationModel {
  final int id;
  final bool isOffCampus;
  final String title;
  final String body;
  final String link;
  final String date;
  final String eligibiltyCandidates;

  NotificationModel(this.id, this.isOffCampus, this.title, this.body, this.date,
      this.eligibiltyCandidates,
      [this.link]);

  static List<NotificationModel> fetchAll() {
    return [
      NotificationModel(
          0,
          false,
          'Long-term Intern offer from CodeTantra',
          'CodeTantra is offering 12 months internship with 9000 Stipend per month.  Students of any department can register for the internship. Give your details to your respective class CRs by today evening 5 PM. For more details find the attachment below.',
          '07/04/2021',
          'E3'),
      NotificationModel(
          1,
          false,
          'Intern :Ramersoft ',
          'Students who are interested in RAMERSOFT coding challenge are informed to fill the form by 31/09/2020 9:00 AM without fail.',
          '31/09/2020',
          'E3',
          'https://docs.google.com/forms/d/e/1FAIpQLSfP1J2eLbXLXdWBpkZvOUIK1LO8D45OHCSceVjZysutvY9jvQ/viewform?vc=0&c=0&w=1&flr=0'),
      NotificationModel(
          2,
          false,
          'Software developer intern at MeeBuddy',
          'MeeBuddy Pvt Ltd is hiring interns for the role of Software Developer. If you are interested please go through the internship notification attached below and fill the form by 12 PM, 22/05/2021 if you are interested.Link:',
          '21/05/2021',
          'E3',
          ' https://forms.gle/21gczyTb5Z8H9Yvh7'),
      NotificationModel(
          3,
          false,
          'NLP Internship at IIIT Hyderabad',
          'Students those who are in interested in developing a career in NLP can register for the internship. Based on your performance in the remote intern you will be qualified for the summer internship at IIIT Hyderabad.',
          '11/01/2021',
          'E3'),
      NotificationModel(
          4,
          false,
          'Associate Software Product Developer intern at Tribhuja Technologies Pvt Ltd',
          'This is to bring to your notice that Tribhuja Technologies Pvt Ltd is hiring Interns for the role of Associate Software Product Developer. If you are interested please go through the internship notification attached and fill the form accordingly before 5:00 pm 25/05/2021.',
          '24/05/2021',
          'E3',
          'https://forms.office.com/r/11NaHYGsJX'),
      NotificationModel(
          5,
          true,
          'MINDTREE OFF CAMPUS DRIVE',
          'CSE/IT and Circuital | 2021 Batch | 4LPA | Last date - May 24th',
          '15/5/2021',
          'CSE/IT',
          'mindtree.com/careers/campus-careers'),
      NotificationModel(
          6,
          true,
          'Accenture Hiring Associate Software Engineer & Software Engineer',
          null,
          '15/5/2021',
          null,
          'indiacampus.accenture.com/register/accenture/vspdhc/apply/?event=3004'),
      NotificationModel(
          7,
          true,
          'Lowe\'s India - Hiring Codeathon ',
          ' Off Campus Placement | BE 2022 Batch\n💻 Profile - Associate Engineer/Data Analyst\n📆Date - 12-13 Jun | Any Time\n🧐Test Format - 10 MCQ & 2 Coding Qns',
          '26/5/2021',
          null,
          'assessment.hackerearth.com/challenges/hiring/lowes-india-hiring-codeathon'),
      NotificationModel(
          8,
          true,
          'PERSISTENT OFF CAMPUS DRIVE',
          '2019/2020/2021 Batch | 4.5LPA | FEMALE CANDIDATES',
          '27/5/2021',
          null,
          'myamcat.com/jobRegistrationForm?id=Persistent_Women_2021-22'),
      NotificationModel(
          9,
          true,
          'Cognizant Off Campus Drive',
          ' 2019,2020 Batch | 6.3LPA,8LPA,12LPA | Last Date-29th May',
          '16/5/2021',
          null,
          'cognizantee.tekstac.com/CognizantDigitalXperienceDesignOffCampusRecruitment'),
    ];
  }
}
