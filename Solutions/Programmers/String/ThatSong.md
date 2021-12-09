```swift

// 곡 정보 구조체
struct MusicInfo {
    var playTime: Int
    var songName: String
    var melody: [Character]
}

// 올림음 변환
func replaceSharp(_ string: String) -> String {
    // C#: Y, D#: U, F#: I, G#: O, A#: P
    let replaced = string.replacingOccurrences(of: "C#", with: "Y")
                        .replacingOccurrences(of: "D#", with: "U")
                        .replacingOccurrences(of: "F#", with: "I")
                        .replacingOccurrences(of: "G#", with: "O")
                        .replacingOccurrences(of: "A#", with: "P")
    return replaced    
}

func solution(_ m:String, _ musicinfos:[String]) -> String {

    var answer = MusicInfo(playTime: 0, songName: "(None)", melody: [])
    let questionMelody = replaceSharp(m)
    
    // 곡 정보를 [MusicInfo]로 변경
    let infos: [MusicInfo] = musicinfos.compactMap {
        let elements = $0.components(separatedBy: ",")
        
        let startTimeElements = elements[0].components(separatedBy: ":")
        let startTime = Int(startTimeElements[0])! * 60 + Int(startTimeElements[1])!
        let endTimeTimeElements = elements[1].components(separatedBy: ":")
        let endTime = Int(endTimeTimeElements[0])! * 60 + Int(endTimeTimeElements[1])!
        let playTime = endTime - startTime
        
        let songName = elements[2]
        let melody = Array(replaceSharp(elements[3]))
        
        return MusicInfo(playTime: playTime, songName: songName, melody: melody)
    }
    

    
    infos.forEach {
        var totalMelody = ""
        // 곡의 길이에 따른 전체 멜로디 완성
        for i in 0 ..< $0.playTime {            
            totalMelody.append($0.melody[i % $0.melody.count]) 
        }        
        // 문제 조건에 따른 정답찾기
        if totalMelody.contains(questionMelody), answer.playTime < $0.playTime {            
            answer = $0
        }
    }
    
    return answer.songName
}
```