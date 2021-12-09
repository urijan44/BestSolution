```swift
func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {    
    var myBoard = board.map { Array($0) }    
    let rowLimit = myBoard.count
    let colLimit = myBoard[0].count
    
    // 2X2를 찾았는지 마킹하는 Array
    var emptyCheck = [[Bool]](repeating: [Bool](repeating: false, count: colLimit), count: rowLimit)
    
    var check = emptyCheck
    var changedPoint: [[Int]] = []
    var answer = 0
    
    // 2X2 블록을 마킹하는 함수
    func markRect(point: [Int]) {
        let row = point[0]
        let col = point[1]
        let char = myBoard[row][col]
        
        var count = 0
        
        // 현재 포인트부터 2X2 블록
        let nextPoints = [[row, col], [row, col + 1], [row + 1, col], [row + 1, col + 1]]
        
        // 같은 문자 개수 세기
        for next in nextPoints {            
            let nextRow = next[0]
            let nextCol = next[1]
            
            if nextRow < rowLimit && nextCol < colLimit {
                if myBoard[nextRow][nextCol] == "0" || myBoard[nextRow][nextCol] != char {
                    break
                }                
                else if {
                    count += 1
                }
            }
            else {
                break        
            }
        }
        
        // 같은 문자 개수가 4개라면 체크
        if count == 4 {
            for next in nextPoints {
                let nextRow = next[0]
                let nextCol = next[1]
                let checkPoint = check[nextRow][nextCol]
                
                if checkPoint == false {
                    answer += 1
                    check[nextRow][nextCol] = true       
                    changedPoint.append([nextRow, nextCol])
                }                
            }            
        }
    }
    
    // 4블록 찾기 함수. 마킹 -> 빈곳채우기 -> 마킹된 블록이 없을때까지 재귀 반복
    func findRect() {        
        // initialize
        check = emptyCheck
        changedPoint = []
        
        // marking        
        for row in 0 ..< rowLimit {
           for col in 0 ..< colLimit {
                markRect(point: [row, col])
            }
        }
        
            
        // moving
        for point in changedPoint {
            let row = point[0]
            let col = point[1]
            var curr = row
            
            while curr >= 0 {
                if curr - 1 >= 0 {                
                    myBoard[curr][point[1]] = myBoard[curr - 1][point[1]]                    
                }
                else {
                    myBoard[curr][point[1]] = "0"
                }
                curr -= 1
            }
        }
        
        // recursive
        if check != emptyCheck {
            findRect()
        }        
    }
    
    findRect()
    return answer
}
```