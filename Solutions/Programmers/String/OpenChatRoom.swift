import Foundation

func solution(_ recordList:[String]) -> [String] {
    let ACTION = 0
    let UID = 1 
    let NICKNAME = 2
	
    var nicknameDict: [String: String] = [:]
    
    var answerList : [String] = []
    
    for recordSet in recordList {
        let record = recordSet.components(separatedBy: " ")

        if record[ACTION] == "Enter" || record[ACTION] == "Change" {
            nicknameDict[record[UID]] = record[NICKNAME]
        }
    }
    
    for recordSet in recordList {
        let record = recordSet.components(separatedBy: " ")
        
        let userName = nicknameDict[record[UID]] ?? ""
        
        if record[ACTION] == "Enter" {
            answerList.append("\(userName)님이 들어왔습니다.")
        } else if record[ACTION] == "Leave" {
            answerList.append("\(userName)님이 나갔습니다.")
        }
    }
    
    return answerList
    
}
