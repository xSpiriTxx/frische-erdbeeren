//
//  Model.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 23.12.21.
//

import Foundation


public class RaceModel {
    var data: F1Data!
    
    func parseData(data: Data){
        do {
            self.data = try JSONDecoder().decode(F1Data.self, from: data)
        } catch {
          print(error)
        }
    }
}


 struct F1Data: Codable {
     let mrData: MRData

     enum CodingKeys: String, CodingKey {
         case mrData = "MRData"
     }
 }

 struct MRData: Codable {
     let xmlns: String
     let series: String
     let url: String
     let limit, offset, total: String
     let raceTable: RaceTable

     enum CodingKeys: String, CodingKey {
         case xmlns, series, url, limit, offset, total
         case raceTable = "RaceTable"
     }
 }

 struct RaceTable: Codable {
     let races: [Race]

     enum CodingKeys: String, CodingKey {
         case races = "Races"
     }
 }


struct Race: Codable {
    let season, round, url, raceName, date: String
    let circuits: Circuit
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName, date
        case circuits = "Circuit"
        case results = "Results"
    }
}

struct Result: Codable {
    let number, position, positionText: String
    let points, grid, laps, status: String
    let driver: Driver
    let constructor: Constructor
    let time: Time?
    let fastestLap: FastestLap?
    
    enum CodingKeys: String, CodingKey {
        case number, position, positionText, points, grid, laps, status
        case driver = "Driver"
        case constructor = "Constructor"
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

struct Time: Codable {
    let millis: String
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case millis
        case time
    }
}

struct FastestLap: Codable {
    let rank, lap: String
    let time: FastestTime
    let averageSpeed: AverageSpeed
    
    enum CodingKeys: String, CodingKey {
        case rank, lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

struct AverageSpeed: Codable {
    let units, speed: String
    
    enum CodingKeys: String, CodingKey {
        case units, speed
    }
}

struct FastestTime: Codable {
    let time: String
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
    }
}

struct Circuit: Codable {
    let circuitId, url, circuitName:String
    let location: Location
    
    enum CodingKeys: String, CodingKey{
        case circuitId, url, circuitName
        case location = "Location"
    }
}

struct Location: Codable {
    let lat, long, locality, country: String
    
    enum CodingKeys: String, CodingKey{
        case lat, long, locality, country
    }
}

 struct Constructor: Codable {
     let constructorId: String
     let url: String
     let name: String
     let nationality: String
     
     enum CodingKeys: String, CodingKey {
         case constructorId, url, name, nationality
     }
 }

 struct Driver: Codable {
     let driverId: String
     let url: String
     let givenName, familyName, dateOfBirth, nationality: String
    
     enum CodingKeys: String, CodingKey {
         case driverId, url, givenName, familyName, dateOfBirth, nationality
     }
 }

 
 
