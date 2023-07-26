package utils;

import java.util.ArrayList;
import java.util.List;

public class HosUtils {
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

}
