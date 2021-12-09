class WordNode {
  static var index: Int = 1

  var id: Int
  
  init() {
    self.id = Self.index
    Self.index += 1
  }
}


let initial = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}

func solution(_ msg:String) -> [Int] {
  var answer: [Int] = Array(repeating: 0, count: 100000)
  var writeIndex = 0
  var tries: [String: WordNode] = [:]
  for word in initial {
    let node = WordNode()
    tries.updateValue(node, forKey: word)
  }

  var startIndex = msg.startIndex
  var endIndex = msg.startIndex
  var stackWord = ""
  var done = false
  while endIndex < msg.endIndex, !done {
    let word = String(msg[startIndex...endIndex])
    
    if tries[word] != nil {
      stackWord = word
      endIndex = msg.index(after: endIndex)
      if endIndex >= msg.endIndex {
        answer[writeIndex] = tries[word]!.id
        writeIndex += 1
        done = true
      }
    } else {
      tries.updateValue(WordNode(), forKey: word)
      startIndex = msg.index(startIndex, offsetBy: stackWord.count)
      answer[writeIndex] = tries[stackWord]!.id
      writeIndex += 1
    }
  }
  
  return Array(answer[0..<writeIndex])
}


/*
 var alphabet = "A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z".filter {
 $0 != "," && $0 != " "
 }.map { String($0) }
 
 func solution(_ msg:String) -> [Int] {
 var result = [Int]()
 var inputMsg = msg
 var loopSwitch = false
 var index = 1
 while true {
 
 let word = String(inputMsg.prefix(index))
 if inputMsg.count == 1 {
 result.append(alphabet.firstIndex {
 $0 == word
 }! + 1)
 loopSwitch = true
 break
 
 }
 if alphabet.contains(word) {
 index += 1
 } else {
 alphabet.append(word)
 result.append(alphabet.firstIndex {
 $0 == String(inputMsg.prefix(index - 1))
 }! + 1)
 
 inputMsg.removeFirst(index - 1)
 index = 1
 }
 }
 
 return result
 }
 */
