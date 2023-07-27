package utils;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class KakaoLogoutUtil {

    public static void kakaoLogout(String kakaoAccessToken) {
        String logoutUrl = "https://kapi.kakao.com/v1/user/logout";

        try {
            URL url = new URL(logoutUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + kakaoAccessToken);

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                // 카카오 로그아웃에 성공한 경우
                System.out.println("카카오 계정과 함께 로그아웃 성공");
            } else {
                // 카카오 로그아웃에 실패한 경우
                System.out.println("카카오 계정과 함께 로그아웃 실패");
            }
        } catch (IOException e) {
            e.printStackTrace();
            // 예외 발생 시, 예외 메시지 출력
            System.out.println("카카오 API 연동 중 오류가 발생했습니다.");
        }
    }
}