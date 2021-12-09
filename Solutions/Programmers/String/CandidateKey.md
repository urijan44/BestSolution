```swift
import Foundation

// 안쓰는키 삭제
extension String {
    var removeEmpty: String {
        self.replacingOccurrences(of: "-", with: "")
    }
}

func solution(_ relation:[[String]]) -> Int {    
    let relationCount = relation.count
    let keyCount = relation[0].count
    
    let keyArr = Array(0 ..< keyCount)
    let keyStrArr = keyArr.map { String($0) }
    
    var keys: [String] = []
    var key: [String] = []
    
    // DFS
    // 나올 수 있는 키들의 조합. 안쓰는 키는 -. 쓰는 키는 해당 index
    func makeKeys(level: Int) {
        if level == keyCount {
            let reducedKey = key.reduce("" , +)
            keys.append(reducedKey)           
            return
        }
        else {
            for str in ["-", keyStrArr[level]] {
                key.append(str)
                makeKeys(level: level + 1)
                key.removeLast()
            }
        }
    }
    
    makeKeys(level: 0)

    // 사용한 키가 적은것부터 탐색하기 위한 정렬과정
    let sortedKeys = keys.sorted {
        $0.filter { $0 == "-" }.count > $1.filter { $0 == "-" }.count
    }    
    
    var candidateKeys: [String] = []
    
    for key in sortedKeys {
        var checkValue: [String] = []                 
        let keyArr = Array(String(key))
        let keyIntArr = keyArr.filter { $0 != "-" }.map { Int(String($0))! }
        // 안쓰는 카테고리를 제외한 키를 이용해 분류가 되는지 확인
        for values in relation {
            var value = ""
            for idx in keyIntArr {            
                value += values[idx]                        
            }                
            if checkValue.contains(value) == false {
                checkValue.append(value)
            }
        }        
        // Uniqueness 확인
        if checkValue.count == relationCount {
            var isAnswer = true
            for candidateKey in candidateKeys {
                // string contains로 했다가 실패
                // "123".contains("13") == false
                // Set으로 변경
                let newkeyArr = Set(key.removeEmpty)
                let candiKeyArr = Set(candidateKey.removeEmpty)
                
                // Minimality 확인
                if candiKeyArr.isSubset(of: newkeyArr) {
                    isAnswer = false
                    break
                }
            }
            // 후보키 Array에 넣는다.            
            if isAnswer {
                candidateKeys.append(key)
            }
        }        
    }
    
    // 답은 후보키 Array의 개수
    return candidateKeys.count
}
```