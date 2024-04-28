List<ServiceModel> serviceModelList = [
  ServiceModel(title: 'Cleaning', icPath: "assets/images/svg/ic_clining.svg"),
  ServiceModel(title: 'Repairing', icPath: "assets/images/svg/ic_setting.svg"),
  ServiceModel(title: 'Painting', icPath: "assets/images/svg/ic_painting.svg"),
  ServiceModel(title: 'Washing', icPath: "assets/images/svg/ic_washing.svg"),
  ServiceModel(title: 'Plumbing', icPath: "assets/images/svg/ic_plumbing.svg"),
  ServiceModel(
      title: 'All service', icPath: "assets/images/svg/all_service.svg"),
];

class ServiceModel {
  final String icPath, title;
  ServiceModel({required this.title, required this.icPath});
}
