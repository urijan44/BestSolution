#include <string>
#include <vector>

using namespace std;

int solution(int m, int n, vector<vector<int>> puddles) {
    const int mod = 1000000007;
    int dp[n][m];
    for (int r = 0; r < n; r++) {
        for (int c = 0; c < m; c++) {
            dp[r][c] = 0;
        }
    }
    for (int i = 0; i < puddles.size(); i++) {
        dp[puddles[i][1] - 1][puddles[i][0] - 1] = -1;
    }
    
    dp[0][0] = 1;
    int dx[2] = {0, 1};
    int dy[2] = {1, 0};
    
    for (int row = 0; row < n; row++) {
        for (int col = 0; col < m; col++) {
            if (dp[row][col] == -1) { continue; }
            for (int index = 0; index < 2; index++) {
                int nx = row + dx[index];
                int ny = col + dy[index];
                if(nx >= n || ny >= m || (dp[nx][ny] == -1)) { continue; }
                dp[nx][ny] = (dp[row][col] + dp[nx][ny]) % mod;
            }
                
        }
    }
    return dp[n-1][m-1];
}