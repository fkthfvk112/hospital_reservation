package utils;

import java.security.MessageDigest;

public class sha256 {
	// 비밀번호 해시화 (SHA-256 사용)
	public static String sha256(String pw) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hash = md.digest(pw.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			return "";
		}
	}
}
/*
 * 로그인할떄 preUrl을 받고 그걸 스트링으로 받고 겟어트리뷰트로 그 위치로 사용자를 이동시키고 파기
 */