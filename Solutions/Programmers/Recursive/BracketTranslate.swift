extension String {
  var isBalancedParentheses: Bool {
    var validCount = 0
    for bracket in self {
      validCount += bracket == "(" ? 1 : -1
    }
    return validCount == 0
  }
  
  var isValidParentheses: Bool {
    var storage = ""
    for bracket in self {
      switch bracket {
      case "(":
        storage.append(bracket)
      default:
        if storage.popLast() == nil {
          return false
        }
      }
    }
    return true
  }
}

func careBracket(_ brackets: String) -> String {
  for endIndex in brackets.indices {

    let target = String(brackets[brackets.startIndex...endIndex])
    if target.isBalancedParentheses {
      var u = target
      let v = String(brackets[brackets.index(endIndex, offsetBy: 1)..<brackets.endIndex])
      if target.isValidParentheses {
        return u + careBracket(v)
      } else {
        
        let care = "(" + careBracket(v) + ")"
        
        u.removeFirst()
        u.removeLast()
        return care + u.map{ return $0 == "(" ? ")" : "(" }.joined()
      }
    }
  }
  return brackets
}
  
func solution(_ p:String) -> String {
  guard !p.isEmpty else { return "" }
  guard !p.isValidParentheses else { return p }
  return careBracket(p)
}

