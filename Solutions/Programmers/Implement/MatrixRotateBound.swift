import Foundation

fileprivate func makeMatrix(_ rows: Int, _ columns: Int) -> [[Int]] {
  var matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)
  for row in 0..<rows {
    for col in 0..<columns {
      matrix[row][col] = row * columns + col + 1
    }
  }
  return matrix
}


fileprivate func rotate(_ matrix: inout [[Int]], _ left: Int, _ top: Int, _ right: Int, _ bottom: Int) -> Int {
  var x = left
  var y = top
  var minimumNumber = 888888888
  var pNumber = matrix[y + 1][x]
  var cNumber = -1
  
  var forward = true
  var down = true
  var up = false
  var done = false
  while !done {
    minimumNumber = min(minimumNumber, matrix[y][x])
    cNumber = matrix[y][x]
    matrix[y][x] = pNumber
    pNumber = cNumber
    
    if forward {
      if x < right {
        x += 1
        continue
      } else {
        forward = false
      }
    }
    
    if !forward && down {
      if y < bottom {
        y += 1
        continue
      } else {
        down = false
      }
    }
    
    if x > left && !down && !up {
      x -= 1
      continue
    } else if !forward && !down {
      up = true
    }
    
    if up && y > top + 1{
      y -= 1
    } else {
      done = true
    }
  }
  return minimumNumber
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
  var answer: [Int] = []
  
  var matrix = makeMatrix(rows, columns)
  
  for query in queries {
    answer.append(rotate(&matrix, query[1] - 1, query[0] - 1, query[3] - 1, query[2] - 1))
  }
  return answer
}

print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
print(solution(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]))
print(solution(100, 97, [[1,1,100,97]]))
print(solution(2, 2, [[1,1,2,2]]))
