package utils;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class HosUtils {
	public static void setCurrentURLtoSession(HttpServletRequest  request, HttpSession session) {
	    String currentURL = request.getRequestURL().toString();
	    String queryString = request.getQueryString();
		if (queryString != null && !queryString.isEmpty()) {
		    currentURL += "?" + queryString;
		}
		System.out.println("현재 URL" + currentURL);
		session.setAttribute("preUrl", currentURL);
	}
	
	public static String passOperationTime(String time) {
		System.out.println(time);
		String resultTime = "";
		String[] times = time.split(",");
		resultTime = times[0] + ":00 ~ " +  (Integer.parseInt(times[1]) +1) + ":00 까지";
		System.out.println(resultTime);

		return resultTime;
	}
	public static String[] getStringList_seperByDelim(String s, String delim){
		String[] list;
		list = s.split(delim);
		System.out.println(list);
		return list;
	}
	public static String getColorFromAscii(String s) {
		String resultColor = "rgb(";
		if(s.length() == 1) {
			resultColor += "0, 0, 0)";
		}
		else if(s.length() == 2){
			int first = ((int)s.charAt(0))%255;
			int second = ((int)s.charAt(1))%255;
			resultColor += first +", " + second +", " + "0)";
		}
		else {
			int first = ((int)s.charAt(0))%255;
			int second = ((int)s.charAt(1))%255;
			int third = ((int)s.charAt(2))%255;
			resultColor += first +", " + second +", " + third + ")";
		}
		
		return resultColor;
	}
	
	public static double getUclidienDistance(double a1, double a2, double b1, double b2) {
		double dX = a1 - b1;
		double dY = a2 - b2;
        return Math.sqrt(dX * dX + dY * dY);
	}
}