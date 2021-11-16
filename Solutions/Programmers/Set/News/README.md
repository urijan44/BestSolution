# 뉴스 클러스터링

## 풀이
```swift
import Foundation

func makeMultiSet(_ str: String) -> [String] {    
    let lower = str.lowercased()
    var multiSet: [String] = []
    
    let arr = Array(lower)
    let count = arr.count
    
    for (left, right) in zip(arr[0 ..< count - 1], arr[1 ..< count]) {
        if left.isLetter, right.isLetter {
            multiSet.append(String(left) + String(right))
        }
    }
    return multiSet
}

func solution(_ str1:String, _ str2:String) -> Int {    
    let multiSet1 = makeMultiSet(str1)
    var multiSet2 = makeMultiSet(str2)
    
    var intersectionCount: Double = 0
    var jaccard: Double = 1
    var answer: Int {
        Int(jaccard * 65536)
    }    
        
    if multiSet1.count == 0, multiSet2.count == 0 {
        return answer
    }
    
    for str in multiSet1 {
        if multiSet2.contains(str) {
            multiSet2.remove(at: multiSet2.firstIndex(of:str)!)
            intersectionCount += 1
        }
    }
    
    jaccard = intersectionCount / Double(multiSet1.count + multiSet2.count)
    
    return answer
}
```

## 해설
### makeMultiSet 함수 : 다중집합 만들어주는 함수  
1. 파라미터로 들어온 문자열을 lowercased후 Array를 만든다.
2. Array의 처음을 제거한 것과 끝을 제거한 것을 zip으로 연결하고 튜플의 모든 값이 문자인 경우 합친다.
3. 합친 것을 multiSet에 append한다.
4. 다중집합이 완성되면 multiSet을 return한다.

### solution 함수 : 정답제출 함수
1. 문제로 들어온 문자열 2개를 makeMultiSet을 이용해 다중집합으로 만든다.
2. 하나의 다중집합을 for문으로 돌면서 문자열이 다른 다중집합에 포함되어있다면  
   교집합 개수(intersectionCount)를 하나 더한다.
3. 교집합 개수를 더한 후 다른 다중집합에서 그 문자열을 제거한다.
4. 합집합의 개수 = 집합1 count + 집합2 count. (3번 과정때문에 교집합 개수는 이미 빼놨다.)
5. jaccard 구하기
6. jarccard에 65536을 곱한 answer를 return한다.

