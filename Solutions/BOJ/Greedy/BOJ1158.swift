
func boj1158() {
  let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
  let (n, k) = (input[0], input[1])

  var arr: [Int] = .init(1...n)
  var count = k - 1

  var result = "<"

  while arr.count > 0 {
    count = count >= arr.count ? count % arr.count : count

    result.write("\(arr.remove(at: count)), ")
    count += (k - 1)
  }

  result.removeLast(2)
  result.write(">")
  print(result)
}

boj1158()
