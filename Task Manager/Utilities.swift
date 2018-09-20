//
//  Utilities.swift
//  Task Manager
//
//  Created by Jim Williams on 9/20/18.
//  Copyright © 2018 Visioncast Solutions. All rights reserved.
//

import Foundation


func validateInput(_ input: String) -> Bool {
    if input == "help" {
        return true
    }
    
    let menuOptions = Array(1...8)
    
    guard let number = Int(input) else { return false }
    
    return menuOptions.contains(number)
}

func getInput() -> String {
    var input: String? = nil
    
    repeat {
        let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if line != "" {
            input = line
        } else {
            print("Invalid input")
        }
    } while input == nil
    
    return input!
}

func getIndex(arrayCount: Int) -> Int {
    var index: Int? = nil
    
    // do stuff to make index not nil.
    repeat {
        let input = Int(readLine()!)
        
        if input == nil {
            // input was not an Int.
            print("Please enter a valid index.")
            continue
        }
        
        // input is a number... but is it valid?
        if input! < 0 || input! >= arrayCount {
            print("Please enter a valid index.")
            continue
        }
        
        // input is a valid index!
        index = input
    } while index == nil
    
    return index!
}
