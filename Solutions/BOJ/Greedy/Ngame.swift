func n() {
    print(solution(2, 4, 2, 1))
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    // 2 <= n <= 16 진법
    // 0 < t <= 1000 글자의 갯수
    // 2 <= m <= 100 참가인원
    // 1 <= p <= m 튜브의 순서
    
    var turn = 1 // 첫번쨰 턴부터 시작
    var num = 0
    var tubeCount = 0
    var result: String = ""
    
    while tubeCount < t { // 말한 횟수가 원하는 글자의 개수보다 작을떄 까지
        
        let radix = String(num, radix: n) // num에 대한 n진수 계산
        
        for i in radix { // radix를 뽑은 상태에서 돌기 때문에 totalGameCount를 넘지 않았는지 확인 해줘야 한다.
            if turn == p && tubeCount < t {
                result += "\(i)".uppercased()
                tubeCount += 1
            }
            
            if turn == m { // 참가인원 수 만큼 돌았을때 1바퀴
                turn = 0
            }
            
            turn += 1 // 턴 증가
        }
        
        num += 1 // 수 증가
    }
    
    return result
}
