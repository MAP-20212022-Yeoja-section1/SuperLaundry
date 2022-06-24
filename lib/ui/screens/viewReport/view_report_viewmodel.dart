import 'view_report.dart';

class ReportViewmodel extends Viewmodel {

  ReportService get _reportService => locator<ReportService>();

  Future readOverallTotalOrders(){
    return _reportService.readOverallTotalOrders();
  }

  Future readOverallCompletedOrders(){
    return _reportService.readOverallCompletedOrders();
  }

  Future readOverallRejectedOrders(){
    return _reportService.readOverallRejectedOrders();
  }

  Future readOverallWashOrders(){
    return _reportService.readOverallWashOrders();
  }

  Future readOverallWashDryOrders(){
    return _reportService.readOverallWashDryOrders();
  }

  Future readOverallWashDryFoldOrders(){
    return _reportService.readOverallWashDryFoldOrders();
  }

  Future readOverallPickUpOrders(){
    return _reportService.readOverallPickUpOrders();
  }
  
  Future readOverallBothOrders(){
    return _reportService.readOverallBothOrders();
  }

  Future readOverall9kgOrders(){
    return _reportService.readOverall9kgOrders();
  }

  Future readOverall14kgOrders(){
    return _reportService.readOverall14kgOrders();
  }

  Future readOverall25kgOrders(){
    return _reportService.readOverall25kgOrders();
  }

  Future readOverallTotalSales(){
    return _reportService.readOverallTotalSales();
  }

  Future readMonthlyTotalOrders(String month, String year){
    return _reportService.readMonthlyTotalOrders(month, year);
  }

  Future readMonthlyCompletedOrders(String month, String year){
    return _reportService.readMonthlyCompletedOrders(month, year);
  }

  Future readMonthlyRejectedOrders(String month, String year){
    return _reportService.readMonthlyRejectedOrders(month, year);
  }

  Future readMonthlyWashOrders(String month, String year){
    return _reportService.readMonthlyWashOrders(month, year);
  }

  Future readMonthlyWashDryOrders(String month, String year){
    return _reportService.readMonthlyWashDryOrders(month, year);
  }

  Future readMonthlyWashDryFoldOrders(String month, String year){
    return _reportService.readMonthlyWashDryFoldOrders(month, year);
  }

  Future readMonthlyPickUpOrders(String month, String year){
    return _reportService.readMonthlyPickUpOrders(month, year);
  }
  
  Future readMonthlyBothOrders(String month, String year){
    return _reportService.readMonthlyBothOrders(month, year);
  }

  Future readMonthly9kgOrders(String month, String year){
    return _reportService.readMonthly9kgOrders(month, year);
  }

  Future readMonthly14kgOrders(String month, String year){
    return _reportService.readMonthly14kgOrders(month, year);
  }

  Future readMonthly25kgOrders(String month, String year){
    return _reportService.readMonthly25kgOrders(month, year);
  }

  Future readMonthlyTotalSales(String month, String year){
    return _reportService.readMonthlyTotalSales(month, year);
  }

  Future readYearlyTotalOrders(String year){
    return _reportService.readYearlyTotalOrders(year);
  }

  Future readYearlyCompletedOrders(String year){
    return _reportService.readYearlyCompletedOrders(year);
  }

  Future readYearlyRejectedOrders(String year){
    return _reportService.readYearlyRejectedOrders(year);
  }

  Future readYearlyWashOrders(String year){
    return _reportService.readYearlyWashOrders(year);
  }

  Future readYearlyWashDryOrders(String year){
    return _reportService.readYearlyWashDryOrders(year);
  }

  Future readYearlyWashDryFoldOrders(String year){
    return _reportService.readYearlyWashDryFoldOrders(year);
  }

  Future readYearlyPickUpOrders(String year){
    return _reportService.readYearlyPickUpOrders(year);
  }
  
  Future readYearlyBothOrders(String year){
    return _reportService.readYearlyBothOrders(year);
  }

  Future readYearly9kgOrders(String year){
    return _reportService.readYearly9kgOrders(year);
  }

  Future readYearly14kgOrders(String year){
    return _reportService.readYearly14kgOrders(year);
  }

  Future readYearly25kgOrders(String year){
    return _reportService.readYearly25kgOrders(year);
  }

  Future readYearlyTotalSales(String year){
    return _reportService.readYearlyTotalSales(year);
  }
}