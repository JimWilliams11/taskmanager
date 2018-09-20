//
//  Library.swift
//  Task Manager
//
//  Created by Jim Williams on 9/20/18.
//  Copyright © 2018 Visioncast Solutions. All rights reserved.
//

import Foundation


class Library {
    
    private var games = [
        Game(title: "Kirby Air Ride", rating: "E"),
        Game(title: "Far Cry 5", rating: "M"),
        Game(title: "Star Wars: The Force Unleashed", rating: "T"),
        Game(title: "Halo 5", rating: "M"),
        Game(title: "Guitar Hero", rating: "T"),
        Game(title: "Minecraft", rating: "E")
    ]
    
    private func checkUserAgeTheHardWay(is ratingAge: Int) -> Bool {
        var birthday: Date?
        
        print("Please enter your birthday mm/dd/yyyy:")
        repeat {
            let input = readLine()!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            if let date = dateFormatter.date(from: input) {
                birthday = date
            } else {
                print("Please enter a valid date.")
            }
        } while birthday == nil
        
        let calendar = Calendar(identifier: .gregorian)
        
        let birthdayWhenTheyTurnTheAge = calendar.date(byAdding: .year, value: ratingAge, to: birthday!)!
        
        if Date() >= birthdayWhenTheyTurnTheAge {
            print("Yep you're old enough")
        } else {
            print("You're not old enough")
        }
        
        return Date() >= birthdayWhenTheyTurnTheAge
    }
    
    private func checkUserAge(is ratingAge: Int) -> Bool {
        // get user input
        var userAge = Int(getInput())
        
        // validate that it's an int
        while userAge == nil {
            // user did not give us an age.
            print("Please enter a valid age:")
            userAge = Int(getInput())
        }
        
        // check if it's of the specified age.
        if userAge! < ratingAge {
            print("Sorry, you're not old enough.")
        }
        
        return userAge! >= ratingAge
    }
    
    private func getAgeForRating(rating: String) -> Int {
        if rating == "E" {
            return 0
        } else if rating == "T" {
            return 13
        } else if rating == "M" {
            return 18
        } else {
            return 0
        }
    }
    
    private func checkAdmin() -> Bool {
        print("Please enter the admin password:")
        
        let input = getInput()
        let password = "pass"
        
        if input == password {
            print("You're in.")
        } else {
            print("Sorry, that's not right :(")
        }
        
        return input == password
    }
    
    func addGame() {
        guard checkAdmin() else { return }
        
        print("Please enter a title:")
        
        // get title from user
        let title = getInput()
        
        print("Please enter a rating: (E/T/M)")
        var rating = getInput().uppercased()
        
        while !["E", "T", "M"].contains(rating) {
            print("Please enter a valid rating E, T, or M.")
            rating = getInput().uppercased()
        }
        
        // create a new game
        let game = Game(title: title, rating: rating)
        
        // append game to games array
        games.append(game)
        
        print("Successfully added \(title) rated \(rating) to the database.")
    }
    
    func removeGame() {
        guard checkAdmin() else { return }
        
        // display all games to user with indicies
        print("Games Available to Remove")
        
        for (index, game) in games.enumerated() {
            print("\(index). \(game.title) - Available? \(game.checkedIn)")
        }
        
        print("Please enter the index of the game you'd like to remove:")
        
        // get index of game to remove from user
        let index = getIndex(arrayCount: games.count)
        
        // remove the game from the array
        let game = games.remove(at: index)
        
        print("Successfully removed \(game.title)")
    }
    
    func checkOut() {
        // list available games to check out
        print("Available Games to Check Out")
        
        let availableGames = getAvailableGames()
        
        for (index, game) in availableGames.enumerated() {
            print("\(index). \(game.title)")
        }
        
        print("Please enter index of game to check out:")
        
        // get index of game to check out from user
        let index = getIndex(arrayCount: availableGames.count)
        let game = availableGames[index]
        
        // check if user is old enough
        let ageForRating = getAgeForRating(rating: game.rating)
        
        if ageForRating > 0 {
            print("Please enter your age:")
            guard checkUserAgeTheHardWay(is: ageForRating) else { return }
        }
        
        // calculate due date for game
        let today = Date()
        
        // Calendar Way
        let calendar = Calendar(identifier: .gregorian)
        let due = calendar.date(byAdding: .day, value: 14, to: today)
        
        // set dueDate and checkedIn
        game.dueDate = due
        game.checkedIn = false
        
        // print out duedate for user
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        print("Successfully checked out \(game.title). Due \(dateFormatter.string(from: game.dueDate!)).")
    }
    
    func checkIn() {
        // list available games to check out
        print("Games Currently Checked Out")
        
        let unavailableGames = getUnavailableGames()
        
        for (index, game) in unavailableGames.enumerated() {
            print("\(index). \(game.title)")
        }
        
        print("Please enter index of game to check in:")
        
        // get index of game to check out from user
        let index = getIndex(arrayCount: unavailableGames.count)
        let game = unavailableGames[index]
        
        // set dueDate and checkedIn
        game.dueDate = nil
        game.checkedIn = true
        
        print("Successfully checked in \(game.title).")
    }
    
    func listAvailableGames() {
        print("All Available Games")
        
        for game in getAvailableGames() {
            print("\(game.title) - Rated \(game.rating)")
        }
    }
    
    func listUnavailableGames() {
        print("All Unavailable Games")
        
        for game in getUnavailableGames() {
            print("\(game.title) Rated \(game.rating)")
        }
    }
    
    private func getAvailableGames() -> [Game] {
        var availableGames = [Game]()
        
        for game in games {
            if game.checkedIn {
                availableGames.append(game)
            }
        }
        
        return availableGames
    }
    
    private func getUnavailableGames() -> [Game] {
        var unavailableGames = [Game]()
        
        for game in games {
            if !game.checkedIn {
                unavailableGames.append(game)
            }
        }
        
        return unavailableGames
    }
}
