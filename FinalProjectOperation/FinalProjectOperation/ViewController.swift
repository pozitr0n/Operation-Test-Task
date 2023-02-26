//
//  ViewController.swift
//  FinalProjectOperation
//
//  Created by Raman Kozar on 25/02/2023.
//

import UIKit

class ViewController: UIViewController {

    let operationQueue = OperationQueue()
    var arrayOfNumbers: [Int] = []
    
    @IBOutlet weak var numOne: UILabel!
    @IBOutlet weak var numTwo: UILabel!
    @IBOutlet weak var numThree: UILabel!
    @IBOutlet weak var numFour: UILabel!
    @IBOutlet weak var numFive: UILabel!
    @IBOutlet weak var numSix: UILabel!
    @IBOutlet weak var numSeven: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addNumbersToArray(_ sender: Any) {
        
        arrayOfNumbers.removeAll()
        
        let operationaAdd1and2 = BlockOperation {
            
            self.arrayOfNumbers.append(1)
            self.arrayOfNumbers.append(2)
            
        }
        
        let operationaAdd3 = BlockOperation {
            self.arrayOfNumbers.append(3)
        }
        
        let operationaAdd4And5 = BlockOperation {
            
            self.arrayOfNumbers.append(4)
            self.arrayOfNumbers.append(5)
            
        }
        
        let operationaAdd6And7 = BlockOperation {
            
            self.arrayOfNumbers.append(6)
            self.arrayOfNumbers.append(7)
            
        }
        
        let printOperation = BlockOperation {
            
            for element in self.arrayOfNumbers {
                sleep(1)
                print(element)
            }
            
        }
    
        var tempArray: [BlockOperation] = []
        
        tempArray.append(operationaAdd1and2)
        tempArray.append(operationaAdd3)
        tempArray.append(operationaAdd4And5)
        tempArray.append(operationaAdd6And7)
        tempArray.append(printOperation)
        
        operationaAdd3.addDependency(operationaAdd1and2)
        operationaAdd4And5.addDependency(operationaAdd3)
        operationaAdd6And7.addDependency(operationaAdd4And5)
        printOperation.addDependency(operationaAdd6And7)
        
        operationQueue.addOperations(tempArray, waitUntilFinished: true)
        
        showAllTheNumbers()
        
    }
    
    func showAllTheNumbers() {
        
        OperationQueue.main.addOperation {
            
            self.numOne.text = String(self.arrayOfNumbers[0])
            self.numTwo.text = String(self.arrayOfNumbers[1])
            self.numThree.text = String(self.arrayOfNumbers[2])
            self.numFour.text = String(self.arrayOfNumbers[3])
            self.numFive.text = String(self.arrayOfNumbers[4])
            self.numSix.text = String(self.arrayOfNumbers[5])
            self.numSeven.text = String(self.arrayOfNumbers[6])
            
        }
        
    }
    
}

