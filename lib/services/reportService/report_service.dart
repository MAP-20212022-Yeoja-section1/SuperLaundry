abstract class ReportService {

  Future readOverallTotalOrders();
  Future readOverallCompletedOrders();
  Future readOverallRejectedOrders();
  Future readOverallWashOrders();
  Future readOverallWashDryOrders();
  Future readOverallWashDryFoldOrders();
  Future readOverallPickUpOrders();
  Future readOverallBothOrders();
  Future readOverall9kgOrders();
  Future readOverall14kgOrders();
  Future readOverall25kgOrders();
  Future readOverallTotalSales();

  Future readMonthlyTotalOrders(String month, String year);
  Future readMonthlyCompletedOrders(String month, String year);
  Future readMonthlyRejectedOrders(String month, String year);
  Future readMonthlyWashOrders(String month, String year);
  Future readMonthlyWashDryOrders(String month, String year);
  Future readMonthlyWashDryFoldOrders(String month, String year);
  Future readMonthlyPickUpOrders(String month, String year);
  Future readMonthlyBothOrders(String month, String year);
  Future readMonthly9kgOrders(String month, String year);
  Future readMonthly14kgOrders(String month, String year);
  Future readMonthly25kgOrders(String month, String year);
  Future readMonthlyTotalSales(String month, String year);

  Future readYearlyTotalOrders(String year);
  Future readYearlyCompletedOrders(String year);
  Future readYearlyRejectedOrders(String year);
  Future readYearlyWashOrders(String year);
  Future readYearlyWashDryOrders(String year);
  Future readYearlyWashDryFoldOrders(String year);
  Future readYearlyPickUpOrders(String year);
  Future readYearlyBothOrders(String year);
  Future readYearly9kgOrders(String year);
  Future readYearly14kgOrders(String year);
  Future readYearly25kgOrders(String year);
  Future readYearlyTotalSales(String year);
}