import UIKit

// MARK: - Let Vs Var
// MARK: - Static Vs Class


/*
 let
    -> is immutable variable
    -> high performance than var because the compiler knows how much space allocate for it
*/

// 1.Which line The compiler will complaint

/*
 struct AppDeveloper {
     var technology: String
     let videos: Int // will complait
     
//     init(technology: String, videos: Int) {
//         self.technology = technology
//         self.videos = videos
//
//     }
 }
 
 let app1 = AppDeveloper(technology: "ios", videos: 1)
 app1.technology = "Flutter"
 app1.videos = 10 // will complaint
 
 var app2 = AppDeveloper(technology: "jos", videos: 1)
 app2.technology = "Android"
 app2.videos = 5

 */


// 2.What's the difference between static and class keyword?

class Network {
    
    class func postRequest() {
        
    }
    
    static func getRequest() {
        
    }
}


 /*
 
  both are same in case accessing without instance
  
  so the difference between them is
  
  static -> can not overriden (Static disptach)
  
  class -> can be overriden (Dynamic dispatch)
  
 */



class Test {
    
    static var num: Int = 5
    var count: Int
    
    
    init(count: Int) {
        self.count = count
    }
    
    func printNumber() {
        print(count + Self.num)
    }
}

Test.num = 10

let test = Test(count: 10)
test.printNumber()

