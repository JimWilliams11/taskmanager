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
//              - create new tasks
//              - see a list of all tasks (Completed and Uncompleted).
//              - see a list of only uncompleted tasks.
//              - see a list of only completed tasks.
//              - mark a task as complete.
//              - mark a completed task as incomplete.
//              - delete a task.
//              - exit the program.
//
//The program should include error handling to account for incorrect user input in all areas where user input is required.


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

