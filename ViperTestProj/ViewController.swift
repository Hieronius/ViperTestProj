//
//  ViewController.swift
//  ViperTestProj
//
//  Created by Арсентий Халимовский on 16.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var array = [3, 9, 1, 25, 2, 100, 5]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(mergeSort1(array))
    }
    
    func mergeSort2(_ initialArray: [Int]) -> [Int] {
        
        guard initialArray.count > 1 else { return initialArray }
        
        let midIndex = initialArray.count / 2
        
        let leftArray = mergeSort2(Array(initialArray[0..<midIndex]))
        let rightArray = mergeSort2(Array(initialArray[midIndex...initialArray.count-1]))
        
        return merge2(leftArray, rightArray)
    }

    func merge2(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [Int] = []
        
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            
            var leftElement = leftArray[leftIndex]
            var rightElement = rightArray[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
                
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightElement += 1
                
            } else if leftElement == rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < leftArray.count {
            orderedArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightArray.count {
            orderedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
        return orderedArray
    }


}

