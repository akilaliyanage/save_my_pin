class Service {
  final String name;
  final String image;
  final String routePath;

  const Service({
    required this.image,
    required this.name,
    required this.routePath,
  });
}

const List<Service> appServices = [
  Service(
      image:
          "https://images.unsplash.com/photo-1619972898592-5de4b1c68025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80",
      name: "Secure Notes",
      routePath: "/secureNotesHome"),
  Service(
      image:
          "https://thumbs.dreamstime.com/b/data-protection-cyber-security-privacy-business-internet-technology-concept-97070175.jpg",
      name: "Secure Pin",
      routePath: "/secureNotesHome"),
  Service(
      image:
          "https://t3.ftcdn.net/jpg/02/22/85/00/360_F_222850000_8nml6uLzmekcXvWxUSUCHZtZ7n8NWMCV.jpg",
      name: "Secure Cards",
      routePath: "/secureNotesHome"),
];