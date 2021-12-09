```swift
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var table: [String : [Int]] = [:]
    var answer: [Int] = []
    
    for infoElem in info {
        let infoStr = infoElem.components(separatedBy: " ")
        
        // 나올 수 있는 모든 경우의 키로 Dictionary 정리
        for lan in ["-", infoStr[0]] {
            for group in ["-", infoStr[1]] {
                for career in ["-", infoStr[2]] {
                    for food in ["-", infoStr[3]] {
                        
                        let key = "\(lan)\(group)\(career)\(food)"
                        let score = Int(infoStr[4])!
                        
                        if table[key] != nil {                                                        
                            table[key]?.append(score)
                        }
                        else {
                            table[key] = [score]
                        }
                    }
                }
            }
        }        
    }
    
    // Binary Search를 위한 정렬
    for t in table {
        let sorted = t.value.sorted(by: <)
        table[t.key] = sorted
    }
    
    for q in query {
        let components = q.components(separatedBy: " ")
        let lan = components[0]
        let group = components[2]
        let career = components[4]
        let food = components[6]
        let score = Int(components[7])!
        
        let key = "\(lan)\(group)\(career)\(food)"
        var mid = 0
        
        // 중복값이 있을 수 있는 Binary Search 방식
        if let row = table[key] {                
            var left = 0
            var right = row.count - 1
            
            while (right >= left) {
                mid = (right + left) / 2            
                if row[mid] < score {
                    left = mid + 1
                }
                else {
                    right = mid - 1
                }
            }        
            answer.append(row.count - left)                        
        }
        else {
            answer.append(mid)
        }
    }
    
    return answer
}
```