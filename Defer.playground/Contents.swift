import UIKit

//MARK: - Defer

/*
 A defer  statement is used for executing code just before transferring program control outside of the scope that the defer
 statement appears in.
 */


// 1.What's the output ?
var value = 0

func getTheValue() -> Int {
    
    defer {
        value += 1
    }
    
    return value
}

print(value)


// 2.What's the output ?

func printTheSteps() {
    
    print("step 1")
    
    defer {
        print("step 2")
    }
    
    print("step 3")
}

//printTheSteps()


// 3.What's the output ?

func printTheStepsWithManyDefers() {
    
    print("step 1")
    
    defer {
        print("step 2")
    }
    
    defer {
        print("step 4")
    }
    
    defer {
        print("step 5")
    }
    
    print("step 3")
}

//printTheStepsWithManyDefers()


// 4.What's the output ?

func printTheStepsWithNestedDefers() {
    
    print("step 1")
    
    defer {
        print("step 2")
    }
    
    defer {
        defer {
            print("Step 6")
        }
        print("step 4")
    }
    
    defer {
        print("step 5")
    }
    
    print("step 3")
}

printTheStepsWithNestedDefers()
