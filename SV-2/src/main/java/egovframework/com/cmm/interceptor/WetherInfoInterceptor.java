package egovframework.com.cmm.interceptor;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.smartVillage.common.vo.WeatherInfo;

/**
 * 인증여부 체크 인터셉터
 * @author 공통서비스 개발팀 서준식
 * @since 2011.07.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.07.01  서준식          최초 생성
 *  2011.09.07  서준식          인증이 필요없는 URL을 패스하는 로직 추가
 *  </pre>
 */


public class WetherInfoInterceptor extends HandlerInterceptorAdapter {
	
	private ObjectMapper objectMapper = new ObjectMapper();

	/**
	 * 세션에 계정정보(LoginVO)가 있는지 여부로 인증 여부를 체크한다.
	 * 계정정보(LoginVO)가 없다면, 로그인 페이지로 이동한다.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
        return true;
	}
	
//	@Override
//	public void postHandle(HttpServletRequest request,
//			HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		WeatherInfo weatherInfo = new WeatherInfo();
//		Date nowDate = new Date();
//		
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
//		SimpleDateFormat hourFormat = new SimpleDateFormat("HH");
//
//		String nowDateStr = dateFormat.format(nowDate);
//		String nowHourStr = hourFormat.format(nowDate);
//		int beforeHour = Integer.parseInt(nowHourStr)-1;
//		String beforeTimeStr = beforeHour < 10 ?"0"+beforeHour : ""+beforeHour;
//	
//		String weatherApiUrl = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?pageNo=1&numOfRows=1000&dataType=json&nx=95&ny=74";
//		String dustApiUrl = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=%EB%AA%85%EC%A7%80%EB%8F%99&dataTerm=DAILY&ver=1.3&pageNo=1&numOfRows=1&returnType=json";
//		
//		String SG_APIM = "bI7VVvskaOdKJGMej%2F2zJzaxEyiCeGn8kLEidNAxHV7%2FRLiWMCAIlqMY08bwU1MqnakQ4ulEirojxHU800l%2BMA%3D%3D";
//		InputStream in = null;
//		try {
//			in = new URL(weatherApiUrl + "&serviceKey=" + SG_APIM + "&base_date=" + nowDateStr + "&base_time=" + beforeTimeStr+"30").openStream();
//			BufferedReader rd = new BufferedReader(new InputStreamReader(in, Charset.forName("UTF-8")));
//			StringBuilder sb = new StringBuilder();
//			int cp;
//			while ((cp = rd.read()) != -1) {
//				sb.append((char) cp);
//			}
//			String jsonText = sb.toString();
////			System.out.println(jsonText);
////			System.out.println();
//			JSONParser parser = new JSONParser();
//			JSONObject json = (JSONObject) parser.parse(jsonText);
//			JSONObject res = (JSONObject) json.get("response");
//			JSONObject body = (JSONObject) res.get("body");
//			JSONObject items = (JSONObject) body.get("items");
//			List<JSONObject> item = (List<JSONObject>) items.get("item");
//			for(JSONObject jsonItems : item) {
//				if(jsonItems.get("fcstTime").equals(nowHourStr + "00")) {
//					if(jsonItems.get("category").equals("T1H")) {
//						modelAndView.addObject("tmp", jsonItems.get("fcstValue").toString());
//					} else if(jsonItems.get("category").equals("SKY")) {
//						modelAndView.addObject("sky", jsonItems.get("fcstValue").toString());
//					} else if(jsonItems.get("category").equals("PTY")) {
//						modelAndView.addObject("pty", jsonItems.get("fcstValue").toString());
//					}
//				}
//			}
//		} catch (RuntimeException ex) {
//			throw ex;
//		} catch (Exception ex) {
//			throw ex;
//		} finally {
//			if (in != null)
//				in.close();
//		}
//		
//		try {
//			in = new URL(dustApiUrl + "&serviceKey=" + SG_APIM).openStream();
//			BufferedReader rd = new BufferedReader(new InputStreamReader(in, Charset.forName("UTF-8")));
//			StringBuilder sb = new StringBuilder();
//			int cp;
//			while ((cp = rd.read()) != -1) {
//				sb.append((char) cp);
//			}
//			String jsonText = sb.toString();
//			System.out.println(jsonText);
//			JSONParser parser = new JSONParser();
//			JSONObject json = (JSONObject) parser.parse(jsonText);
//			JSONObject res = (JSONObject) json.get("response");
//			JSONObject body = (JSONObject) res.get("body");
//			List<JSONObject> items = (List<JSONObject>) body.get("items");
//			for(JSONObject jsonItems : items) {
//				modelAndView.addObject("pm10", jsonItems.get("pm10Grade1h").toString());
//				modelAndView.addObject("pm25", jsonItems.get("pm25Grade1h").toString());
//			}
//		} catch (RuntimeException ex) {
//			throw ex;
//		} catch (Exception ex) {
//			throw ex;
//		} finally {
//			if (in != null)
//				in.close();
//		}
//	}
 
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion :: Request inside afterCompletion");
 
	}	

}
