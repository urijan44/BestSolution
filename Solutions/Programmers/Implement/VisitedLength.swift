//
//  VisitedLength.swift
//  testCase
//
//  Created by hoseung Lee on 2022/01/12.
//

import Foundation

func solution(_ dirs: String) -> Int {
  var currentCoordX = 5
  var currentCoordY = 5
  var roadMap = Set<String>()
  var preRoadMap = "(\(currentCoordX), \(currentCoordY))"
  
  func appendRoad() {
    if !roadMap.contains("(\(currentCoordX), \(currentCoordY)) : \(preRoadMap)") {
      roadMap.insert("\(preRoadMap) : (\(currentCoordX), \(currentCoordY))")
    }
    preRoadMap = "(\(currentCoordX), \(currentCoordY))"
  }
  
  
  for i in dirs {
    switch i {
      case "U":
        if currentCoordY != 0 {
          currentCoordY -= 1
          appendRoad()
        }
      case "D":
        if currentCoordY != 10{
          currentCoordY += 1
          appendRoad()
        }
      case "L":
        if currentCoordX != 0 {
          currentCoordX -= 1
          appendRoad()
        }
      case "R":
        if currentCoordX != 10 {
          currentCoordX += 1
          appendRoad()
        }
      default:
        fatalError()
    }
  }
  return roadMap.count
}

