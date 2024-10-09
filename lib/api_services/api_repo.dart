import '../datamodule/cancel.dart';
import '../datamodule/create_job.dart';
import '../datamodule/get_status.dart';
import 'api_provider.dart';
import 'dart:io' show File, Platform;
import 'package:hussainbikewebapp/utils/api_constants.dart' as _apiconstants;

ApiProvider _provider = ApiProvider();

Future<CreateJobModule> createJobEntries(var body) async {
  final response = await _provider.post(_apiconstants.postJob, body);
  return CreateJobModule.fromJson(response);
}

Future<CreateJobModule> updateJobEntries(var body, String id) async {
  final response = await _provider.update(_apiconstants.jobEdit + id, body);
  return CreateJobModule.fromJson(response);
}

Future<Map<String, dynamic>> updateJobEntries1(var body, String id) async {
  Map<String, dynamic> response =
      await _provider.update(_apiconstants.jobEdit + id, body);
  return response;
}

Future<JobResponseCancel> jobCancel(var body) async {
  final response = await _provider.post(_apiconstants.cancelJob, body);
  return JobResponseCancel.fromJson(response);
}

Future<JobsResponse> getOngoing() async {
  final response = await _provider.get(_apiconstants.getOngoing);
  return JobsResponse.fromJson(response);
}

Future<JobsResponse> getCancelled() async {
  final response = await _provider.get(_apiconstants.cancelledJob);
  return JobsResponse.fromJson(response);
}

// Future<InflowOutflow> getTotalInflowOutflow(var body) async {
//   final response =
//       await _provider.post(_apiconstants.getProjectTotalInflowApi, body);
//   return InflowOutflow.fromJson(response);
// }

// Future<Map<String, dynamic>> dateWiseEntries(var body) async {
//   Map<String, dynamic> response =
//       await _provider.post(_apiconstants.dateWiseApi, body);
//   return response;
// }
//
// Future<ProjectDetailsList> getEntriesDetails(var id, String limit) async {
//   final response = await _provider
//       .get(_apiconstants.entryApi + "/" + id + "?" + "limit=" + limit);
//   return ProjectDetailsList.fromJson(response);
// }
//
// Future<CreateAccounts> createNewAccount(var body) async {
//   final response =
//       await _provider.postRetrieveToken(_apiconstants.createAccountApi, body);
//   return CreateAccounts.fromJson(response);
// }
//
// Future<CreateAccounts> createWorkerNewAccount(var body) async {
//   final response =
//       await _provider.post(_apiconstants.createWorkerAccountApi, body);
//   return CreateAccounts.fromJson(response);
// }
//
// Future<UpdateWorkerResponse> updateWorkerNewAccount(
//     var body, String? id) async {
//   final response = await _provider.update(
//       _apiconstants.createWorkerAccountApi + "/" + id!, body);
//   return UpdateWorkerResponse.fromJson(response);
// }
//
// Future<DeleteResponse> deleteWorker(String? id) async {
//   final response =
//       await _provider.delete(_apiconstants.createWorkerAccountApi + "/" + id!);
//   return DeleteResponse.fromJson(response);
// }
//
// Future<DeleteResponse> deleteInflowOutflow(String? id) async {
//   final response = await _provider.delete(_apiconstants.entryApi + "/" + id!);
//   return DeleteResponse.fromJson(response);
// }
//
// Future<ProjectDetailList> getProjectDetail() async {
//   final response = await _provider.get(_apiconstants.getProjectDetailsApi);
//   return ProjectDetailList.fromJson(response);
// }
//
// Future<ProjectDetailList> getProjectDetail1(String? id) async {
//   final response =
//       await _provider.get(_apiconstants.getProjectDetailsApi + '/' + id!);
//   return ProjectDetailList.fromJson(response);
// }

// Future<ItemLister> getCategoriesDetail() async {
//   final response = await _provider.get(_apiconstants.postCategoryApi);
//   return ItemLister.fromJson(response);
// }
//
// Future<WorkerDetailsList> getWorkerDetail() async {
//   final response = await _provider.get(_apiconstants.getWorkerDetails);
//   return WorkerDetailsList.fromJson(response);
// }
//
// Future<WorkerList> getWorkerNewDetail() async {
//   final response = await _provider.get(_apiconstants.getWorkerNewDetails);
//   return WorkerList.fromJson(response);
// }
//
// Future<DeleteResponse> deleteWorkerNewDetail() async {
//   final response = await _provider.get(_apiconstants.getWorkerNewDetails);
//   return DeleteResponse.fromJson(response);
// }
//
// Future<CreateProjects> createProject(var body) async {
//   final response = await _provider.post(_apiconstants.createProjectApi, body);
//   return CreateProjects.fromJson(response);
// }
//
// // put the data
// Future<UpdateResponse> updateProjects(String? id, var body) async {
//   final response =
//       await _provider.update(_apiconstants.createProjectApi + "/" + id!, body);
//   return UpdateResponse.fromJson(response);
// }
//
// // delete api
// Future<DeleteResponse> delete(String? id) async {
//   final response =
//       await _provider.delete(_apiconstants.createProjectApi + "/" + id!);
//   return DeleteResponse.fromJson(response);
// }
//
// Future<NewCategory> createCategory(var body) async {
//   final response = await _provider.post(_apiconstants.postCategoryApi, body);
//   return NewCategory.fromJson(response);
// }
//
// Future<UpdateCategoryResponse> updateCategory(var body, String? id) async {
//   final response =
//       await _provider.update(_apiconstants.postCategoryApi + '/' + id!, body);
//   return UpdateCategoryResponse.fromJson(response);
// }
//
// Future<DeleteResponse> deleteCategory(String? id) async {
//   final response =
//       await _provider.delete(_apiconstants.postCategoryApi + "/" + id!);
//   return DeleteResponse.fromJson(response);
// }
//
// Future<NewCategory> createVendor(var body) async {
//   final response = await _provider.post(_apiconstants.postVendorApi, body);
//   return NewCategory.fromJson(response);
// }
//
// Future<UpdateVendorResponse> updateVendor(var body, String? id) async {
//   final response =
//       await _provider.update(_apiconstants.postVendorApi + '/' + id!, body);
//   return UpdateVendorResponse.fromJson(response);
// }
//
// Future<DeleteResponse> vendorDelete(String? id) async {
//   final response =
//       await _provider.delete(_apiconstants.postVendorApi + "/" + id!);
//   return DeleteResponse.fromJson(response);
// }
