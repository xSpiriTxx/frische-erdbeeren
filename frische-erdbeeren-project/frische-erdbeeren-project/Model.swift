//
//  Model.swift
//  frische-erdbeeren-project
//
//  Created by Matthias Gassner on 23.12.21.
//

import Foundation

class Entry {
    var season = "";
    var round = "";
    var raceName = "";
    var date = "";
    var time = "";
    var circuit = "";
    var locality = "";
    var country = "";
    
}

public class RaceModel {
    var persons = [Entry()]
    
    
}

/*
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
     let standingsTable: StandingsTable

     enum CodingKeys: String, CodingKey {
         case xmlns, series, url, limit, offset, total
         case standingsTable = "StandingsTable"
     }
 }

 struct StandingsTable: Codable {
     let season: String
     let standingsLists: [StandingsList]

     enum CodingKeys: String, CodingKey {
         case season
         case standingsLists = "StandingsLists"
     }
 }

 struct StandingsList: Codable {
     let season, round: String
     let driverStandings: [DriverStanding]

     enum CodingKeys: String, CodingKey {
         case season, round
         case driverStandings = "DriverStandings"
     }
 }

 struct DriverStanding: Codable {
     let position, positionText, points, wins: String
     let driver: Driver
     let constructors: [Constructor]

     enum CodingKeys: String, CodingKey {
         case position, positionText, points, wins
         case driver = "Driver"
         case constructors = "Constructors"
     }
 }

 struct Constructor: Codable {
     let constructorId: String
     let url: String
     let name: String
     let nationality: String
 }

 struct Driver: Codable {
     let driverId: String
     let url: String
     let givenName, familyName, dateOfBirth, nationality: String
 }

 do {
   let f1Data = try JSONDecoder().decode(F1Data.self, from: jsonData)

   let season = f1Data.mrData.standingsTable.season
   let firstDriver = f1Data.mrData.standingsTable.standingsLists[0].driverStandings[0].driver.driverId
 } catch {
   print(error)
 }
 */
