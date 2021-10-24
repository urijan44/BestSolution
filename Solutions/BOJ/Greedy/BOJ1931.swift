//
//  그리디 알고리즘, 회의실 배정, BOJ1931.swift
//  https://www.acmicpc.net/problem/1931
//
//  Created by hoseung Lee on 2021/10/24.
//

fileprivate struct Schedule: Comparable {
  var startTime: Int = 0
  var endTime: Int = 0
  
  static func < (lhs: Schedule, rhs: Schedule) -> Bool {
    if lhs.endTime < rhs.endTime {
      return true
    } else if lhs.endTime == rhs.endTime {
      return lhs.startTime < rhs.startTime
    } else {
      return false
    }
  }
}

func boj1931() {
  let n = Int(readLine()!)!
  var schedules: [Schedule] = .init(repeating: Schedule(), count: n)
  
  for i in 0..<n {
    let information = readLine()!.split(separator: " ").map{Int(String($0))!}
    let schedule = Schedule(startTime: information[0], endTime: information[1])
    schedules[i] = schedule
  }
  
  schedules.sort()
  var maxSchduleCount = 0
  var readIndex = 0
  var currentSchedule = schedules[0]
  readIndex += 1
  maxSchduleCount += 1
  while schedules.count > readIndex {
    
    let fastCloseSchedule = schedules[readIndex]
    readIndex += 1
    
    if fastCloseSchedule.startTime >= currentSchedule.endTime {
      maxSchduleCount += 1
      currentSchedule = fastCloseSchedule
    }
  }
  print(maxSchduleCount)
  
}
