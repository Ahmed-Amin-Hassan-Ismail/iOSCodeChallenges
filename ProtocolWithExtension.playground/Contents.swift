import UIKit

//MARK: - Protocol


// What's Protocol ?
// is an interface that contains the definition somes of attributes and methods not implemention like (blue print)
// syntax
protocol SomeProtocol {
    var name: String { get }
    func getMyName(name: String)
}

//--------------------------------------------------------------------------------------------------------------

// What's a Delegate Patter ?
// it allows one object to do some work on behave of another object
// some scenario
// consider you have two screens A and B , on Screen A you can display the name of the entered by user's on sceond screen
// and screen B has textField which help the user to enter his name

class A: UIViewController {
    
    @IBOutlet weak var showMyName: UILabel!
    
    
    @IBAction func goToScreenB(_ sender: UIButton) {
        let screenB = B()
        screenB.delegate = self
        present(screenB, animated: true)
    }
}

class B: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var delegate: ScreenADelegate?
}

// Answer

protocol ScreenADelegate: AnyObject {
    func getUsersName(name: String)
}

extension A: ScreenADelegate {
    func getUsersName(name: String) {
        self.showMyName.text = name
    }
    
    
}

extension B {
   
    func goToPreviousScreen() {
        dismiss(animated: true, completion: {
            self.delegate?.getUsersName(name: self.nameTextField.text!)
        })
    }
}


//--------------------------------------------------------------------------------------------------------------

// How you declare some methods inside protocol as an optional

// Approach 1
@objc protocol ObjectiveCProtocol {
    @objc optional func getError()
}

class TestingClass: ObjectiveCProtocol {
    // here you can stub the get error protocol or not as Optional
}

// Approach 2
protocol ViewControllerDelegate {
    func getError()
}

extension ViewControllerDelegate {
    func getError() {
       print("Error")
    }
}


//--------------------------------------------------------------------------------------------------------------


// Protocol Composition
// means add some of protocol to a single protocol
// is used to combine multiple protocol to a single one

protocol ViewControllerDataDelegate {
    func getMyName() -> String
}

protocol ViewControllerErrorDelegate {
    func getError() -> String
}

// so instead of confirming more protocols you can create one protocol and implmenet it

protocol ViewControllerDelegate2: ViewControllerDataDelegate, ViewControllerErrorDelegate {
    
}

class ViewController: ViewControllerDelegate2 {
    func getError() -> String {
        return ""
    }
    
    func getMyName() -> String {
        return "Ahmed Amin"
    }
}

//--------------------------------------------------------------------------------------------------------------

// Associated Type
// using to make the porotocol as Generic Protocol

protocol Calculate {
    associatedtype Number
    
    func add(num1: Number, num2: Number) -> Number
}

class Calculator: Calculate {
    
    typealias Number = Int
    
    func add(num1: Number, num2: Number) -> Number {
        return num1 + num2
    }
}


//--------------------------------------------------------------------------------------------------------------
 /*
   
  What's the difference between
  1. Protocol Delegate
  2. Notification Center
  
  
  Answer:
  protocol Delegate :
  1. is basically one to one (one object to one object)
  2. using with reference type
  
  
  Notification Center :
  1. is basically one to many (one object is firing the notification and many objects are subscribing or observing the notification will listening the notification and implement the object)
  2. using with value and reference type
  
  */

//--------------------------------------------------------------------------------------------------------------

struct Teacher: School {
    func doSomething() {
        
    }
}

class Student: School {
    func doSomething() {
        
    }
}

protocol School {
    func doSomething()
}

// and you can use the protocol as a type for both struct and class .


