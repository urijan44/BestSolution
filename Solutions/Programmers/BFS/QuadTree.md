# 쿼드 압축 후 개수 세기
---
```swift
import Foundation

func solution(_ arr:[[Int]]) -> [Int] {    
    // 사각범위
    var row = arr.count
    let col = arr[0].count
    
    // 0개수와 1개수
    var zeroCount = 0
    var oneCount = 0
    
    // 사각범위 -> 4개로 나누어진 사각범위로 깊이탐색
    func dfs(level: [[Int]], div: Int) {
        // 사각범위 수가 모두 같은지 체크
        let result = checkRect(level: level)
        // 모두 같은 수가 아닌 경우는 result = -1
        // result가 0 또는 1인 경우 정답카운트를 올리고 깊이탐색을 그만한다.
        if result == 0 {            
            zeroCount += 1            
            return
        }
        else if result == 1 {            
            oneCount += 1            
            return
        }
        else {            
            // 사각범위 내부 4개의 사각범위중 첫번째 범위
            let initialRow = [level[0][0], level[0][0] + div - 1]
            let initialCol = [level[1][0], level[1][0] + div - 1]
            
            // 첫번째 범위를 통해 모든 4개의 범위를 구함
            let leftUpper = [initialRow, initialCol]
            let leftBottom = [initialRow, initialCol.map { $0 + div } ]
            let rightUpper = [initialRow.map { $0 + div }, initialCol]
            let rightBottom = [initialRow.map { $0 + div }, initialCol.map { $0 + div }]
            
            // 내부 4개 범위에 대해서 다시 깊이 탐색
            for next in [leftUpper, leftBottom, rightUpper, rightBottom] {                
                dfs(level: next, div: div / 2)               
            }
        }
    }
    
    // 사각범위 안의 수가 모두 같은지 체크.    
    func checkRect(level: [[Int]]) -> Int {        
        let minRow = level[0][0]
        let maxRow = level[0][1]
        let minCol = level[1][0]
        let maxCol = level[1][1]
        // 사각범위의 첫번째 숫자
        var result = arr[minRow - 1][minCol - 1]
        
        for r in minRow - 1 ... maxRow - 1 {
            for c in minCol - 1 ... maxCol - 1 {
                // 첫번째 숫자와 다른 숫자가 발견되면 -1을 반환
                if result != arr[r][c] {
                    result = -1
                    break
                }
            }
        }                
        // 다른 숫자가 있지 않다면 공통된 숫자 반환
        return result
    }
    
    // 깊이 탐색 실행 및 정답 리턴
    dfs(level: [[1, row], [1, col]], div: row / 2)    
    return [zeroCount, oneCount]
}
```