//
//  Menu.swift
//  Task Manager
//
//  Created by Jim Williams on 9/12/18.
//  Copyright © 2018 Visioncast Solutions. All rights reserved.
//

import Foundation


//The program should display a menu listing all possible actions the user can take.
//
//        The User should be able to
//              - create new tasks (in the menu)
//              - see a list of all tasks (Completed and Uncompleted).
//              - see a list of only uncompleted tasks.
//              - see a list of only completed tasks.
//              - mark a task as complete.
//              - mark a completed task as incomplete.
//              - delete a task.
//              - exit the program.
//
//The program should include error handling to account for incorrect user input in all areas where user input is required.



// Below is the Menu class in which the progam menu is displayed and the user is to enter a selection.

class Menu {
    var shouldQuit = false
    
    let library = Library()
    
    func go() {  
        
        printMenu()
        
        repeat {
            
            var input = getInput()
            
            while validateInput(input) == false {
                print("Invalid input")
                
                printMenu()
                
                input = getInput()
            }
            
            handleInput(input)
            
        } while !shouldQuit
    }
    
    func printMenu() {
        print("""

            Menu
            1 Add Task
            2 Delete Task
            3 List All Tasks
            4 List Uncompleted Tasks
            5 List Completed Tasks
            6 Mark Task Complete
            7 Mark Task Incomplete
            8 Quit Program
            
            """)
    }
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
            library.addGame()
        case "2":
            library.removeGame()
        case "3":
            library.listAvailableGames()
        case "4":
            library.checkOut()
        case "5":
            library.checkIn()
        case "6":
            library.listUnavailableGames()
        case "7", "help":
            printMenu()
        case "8":
            quit()
        default:
            break
        }
    }
    
    func quit() {
        shouldQuit = true
        print("Thanks for using the video game library")
    }
}







