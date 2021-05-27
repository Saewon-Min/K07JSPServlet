package fileupload;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	public static MultipartRequest uploadFile(HttpServletRequest req,
			String saveDirectory, int maxPostSize) {
		
		MultipartRequest mr = null;
		try {
			/*
			파일 업로드를 위해 MultipartRequest 객체를 생성한다.
			해당 객체가 정상적으로 생성되면 파일업로드는 완료된다.
			 */
			mr = new MultipartRequest(req, saveDirectory,maxPostSize,"UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		return mr;
		
	}
}
