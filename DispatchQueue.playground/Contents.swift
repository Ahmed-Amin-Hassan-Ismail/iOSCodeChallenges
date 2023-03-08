import UIKit

//MARK: - DispatchQueue

/*
Here will explore the difference between
 1. Dispatch Queue in Async
 2. Dispatch Queue in Sync
*/


/*
 
 syntax

DispatchQueue.main.async {
    
the block is executed on background thread which means paraller with main thread "in the last"
}

DispatchQueue.main.sync {
 
 the block is executed in main thread " UI Thread "
 
 it's crashed -> because you are blocked the main thread and created deadlock scenario
}
*/

// What's the output?
func viewDidLoad() {
    print("Step 1")
    
    DispatchQueue.main.async {
        print("Step 2")
    }
    
    print("Step 3")
}

//viewDidLoad()

// What's the output ?
func viewWillAppear() {
    print("Step 1")
    
    DispatchQueue.main.async {
        print("Step 2")
        DispatchQueue.main.async {
            print("Step 3")
        }
        print("Step 4")
    }
    
    print("Step 5")
}

//viewWillAppear()

// What's the output ?
func viewDidAppear() {
    
    print("Step 1")
    
    DispatchQueue.main.async {
        print("Step 2")
        
        DispatchQueue.global().sync {
            print("Step 3")
        }
        
        print("Step 4")
    }
    
    print("Step 5")
}
viewDidAppear()
