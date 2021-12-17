### 아이디어
- 문자열이 "1"이 될 때 까지 반복 -> while문 사용
- filter를 이용해서 0을 제거하기
- 제거한 0의 갯수는 변환 전과 후의 길이(count)를 비교해서 올려주기

### 답안
```swift
import Foundation

func solution(_ s:String) -> [Int] {
    
    
    var s = s
    var converCount = 0
    var removedZeroCount = 0
    
    // 1. s의 모든 0을 제거
    func removeZero(_ s: String) -> String {
        let newS = s.filter{$0 != "0"}
        // 삭제한 0의 갯수
        removedZeroCount += s.count - newS.count
        return newS
    }
    
    // 2. s의 길이를 c라고 하면 c를 2진법으로 표현한 문자열로 바꾸기
    func convertBinary(_ s: String) -> String {
        let binary: String = String(s.count, radix: 2)
        converCount += 1 
        return binary
    }
    
    while s != "1" {
        s = removeZero(s)
        s = convertBinary(s)
    }
    
    return [converCount,removedZeroCount]
  
}
```
