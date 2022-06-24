import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:superlaundry/services/reportService/report_service.dart';

class ReportServiceWithFirestore extends ReportService {
  
  @override
  Future readOverallTotalOrders() => 
    FirebaseFirestore.instance
    .collection('orders')
    .get()
    .then((value) => value.size);

  @override
  Future readOverallCompletedOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallRejectedOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderStatus', isEqualTo: "REJECTED")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallWashDryFoldOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash, dry & fold")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallWashDryOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash & dry")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallWashOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash only")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallBothOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('deliveryMethod', isEqualTo: "Both")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallPickUpOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('deliveryMethod', isEqualTo: "Pickup")
    .get()
    .then((value) => value.size);

  @override
  Future readOverall14kgOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "14")
    .get()
    .then((value) => value.size);

  @override
  Future readOverall25kgOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "25")
    .get()
    .then((value) => value.size);

  @override
  Future readOverall9kgOrders() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "9")
    .get()
    .then((value) => value.size);

  @override
  Future readOverallTotalSales() =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .get()
    .then((querySnapshot) {
        dynamic sum = 0;
        querySnapshot.docs.forEach((result) {         
            sum = sum + result.data()['totalPrice'];
        });
        return sum.toStringAsFixed(2);
      },
    );

  @override
  Future readMonthly14kgOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "14")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthly25kgOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "25")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthly9kgOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "9")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyBothOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('deliveryMethod', isEqualTo: "Both")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyCompletedOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyPickUpOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('deliveryMethod', isEqualTo: "Pickup")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyRejectedOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderStatus', isEqualTo: "REJECTED")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyTotalOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyTotalSales(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .get()
    .then((querySnapshot) {
        
        var word;
        dynamic sum = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                sum = sum + result.data()['totalPrice'];
              }
            }
        });
        return sum.toStringAsFixed(2);
      },
    );

  @override
  Future readMonthlyWashDryFoldOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash, dry & fold")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyWashDryOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash & dry")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readMonthlyWashOrders(String month, String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash only")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              if(word[0]==month){
                count = count + 1;
              }
            }
        });
        return count;
      },
    );

  @override
  Future readYearly14kgOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "14")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearly25kgOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "25")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearly9kgOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('weight', isEqualTo: "9")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyBothOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('deliveryMethod', isEqualTo: "Both")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyCompletedOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyPickUpOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('deliveryMethod', isEqualTo: "Pickup")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyRejectedOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderStatus', isEqualTo: "REJECTED")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyTotalOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyTotalSales(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .get()
    .then((querySnapshot) {
        
        var word;
        dynamic sum = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                sum = sum + result.data()['totalPrice'];
              
            }
        });
        return sum.toStringAsFixed(2);
      },
    );

  @override
  Future readYearlyWashDryFoldOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash, dry & fold")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyWashDryOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash & dry")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );

  @override
  Future readYearlyWashOrders(String year) =>
    FirebaseFirestore.instance
    .collection('orders')
    .where('orderCompletion', isEqualTo: "COMPLETED")
    .where('cleanMethod', isEqualTo: "Wash only")
    .get()
    .then((querySnapshot) {
        
        var word;
        var count = 0;
        querySnapshot.docs.forEach((result) {         
            word = result.data()['date'].split(" ");
            if(word[2]==year){
              
                count = count + 1;
              
            }
        });
        return count;
      },
    );
   
}