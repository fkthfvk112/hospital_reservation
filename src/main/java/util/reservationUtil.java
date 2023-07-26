package util;

import java.util.List;

import component.dto.ReservationDto;

public class reservationUtil {

	public static boolean isNull(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 한자리 숫자를 두 자리로 만들어주는 함수
	public static String maketwo(String msg) {
		return msg.trim().length() <2? "0"+msg.trim() : msg.trim() ;
	}
	
	// 제목이 길 경우 ...으로 처리
	public static String dot3(String msg) {
		String str = "";
		
		if(msg.length() >= 10) {
			str = msg.trim().substring(0,10)+"..."; // 강사님은 ... 추가 아랫줄에 쓰심
		} else {
			str = msg.trim();
		}
		
		return str;
	}
	
	// 날짜별로 테이블을 생성하기 위한 함수
		public static String makeTable(int year, int month, int day, List<ReservationDto> list) {
			String str = "";
			
			// 2023 7 5 (외부에서 들어올 때 이런 형식으로 들어옴) ->20230709로 만들어줄거임 <- 202307051015 <-rdate
			String dates = (year + "") +"-"+ maketwo(month+"") +"-"+ maketwo(day+""); // two 매개변수로 String형이라 +""해서 문자열로 바꿔서 넣어줌
			
			str += "<table>";
			
			for(ReservationDto dto : list) {

				if(dto.getWdate().substring(0,10).equals(dates)) {
					str += "<tr>";
					str += "	<td style='padding:0px'>";
					// str += "		<a href='reservationdetail.do?reservationId="+dto.getId() + "'>"; // 상세 일정볼 땐 일정 고유값 seq 가져가면 일정 정보를 띄울 수 있음
																									  // a는 링크? 페이지 이동됨?
					str += "		<a href='myreservation.do?year="+year+"&month="+month+"&reservationId="+dto.getId() + "'>"; 
					str += "			<font style='font-size:10px; color:blue;'> ";
					str += 					dot3(dto.getDescription());
					str += "			</font>";	
					str += "		</a>";	
					str += "	</td>";
					str += "<tr>";
				}
			}
			str += "</table>";
			
			return str;
		}
		
		// 일별 일정을 모두 볼 수 있는 bbsdaylist.jsp 이동되도록 하는 (날짜 표시)함수
		public static String daylist(int year,int month,int day) {
			String str = "";
			
			str += String.format("&nbsp;<a style='color:black'><b> ", 
								   									 year, month, day);
			str += String.format("%2d", day);
			str += "</b></a>";
			
			return str;
		}
}
