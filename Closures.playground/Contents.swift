import UIKit

// MARK: - Closures


/*
 Closures are self-contained blocks of functionality that can be passed around and used in your code.
 
 Swift Closure Declaration
 
 { (parameters) -> returnType in
        // statiments
 }
 
 Here,
 
 parameters - any value passed to closure
 returnType - specifies the type of value returned by the closure in (optional) - used to separate parameters/returnType from closure body
 
 */


// 1.How to declare a simple closure ?

let message = {
    print("Hello World")
}

// 2.How to decalre a closure with parameter ?

let sayMessageToSomeone = { (name: String) in
    print("Good Morning \(name)")
}

sayMessageToSomeone("Ahmed")

// 3.How to declare a closure with parameter and return value ?

let sumTwoNumber = {(num1: Int, num2: Int) -> Int in
    return num1 + num2
}

print(sumTwoNumber(1,2))


// 4.Closure as a function parameter

func sayNoon(actions: () -> Void) {   }

// 5.What's the output ?

var name: String = "Ahmed"

let newClosure = { [name] in
    print("I Love \(name)")
}

name = "Amin"
newClosure()

/*
 output: I Love Ahmed
 
 Answer: because of the caputure list in the closure it means create copy of name so once you change the name the closure won't effect because it's already declared with variable
*/

// 6.what's the output ?

func execute() -> (Int) -> Int {
    
    var input = 0
    
    return { output in
        input = input + output
        return input
    }
}

let object = execute()

let a = object(5)   // input = 5
let b = object(10) // input = 15
let c = object(15) // input = 30

print (c)

/*
 output : will be 30
 Answer : because we are calling the return value not the function itself ( execute() ) so the input won't change from previous on
 */


