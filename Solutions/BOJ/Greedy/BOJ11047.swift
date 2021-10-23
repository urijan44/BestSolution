//
//  그리디 알고리즘, 동전 0, BOJ11047.swift
//  https://www.acmicpc.net/problem/11047
//
//  Created by hoseung Lee on 2021/10/23.
//


func boj11047() {
  let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
  var currencyKinds: [Int] = .init(repeating: 0, count: nk[0])
  
  for i in (0..<nk[0]).reversed() {
    currencyKinds[i] = Int(readLine()!)!
  }
  
  var targetMoney = nk[1]
  var bestPath = 0
  for coin in currencyKinds where targetMoney > 0 {
    bestPath += targetMoney / coin
    targetMoney %= coin
  }
  
  print(bestPath)
}

boj11047()