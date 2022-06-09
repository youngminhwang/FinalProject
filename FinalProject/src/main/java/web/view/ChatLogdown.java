package web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import web.service.face.ChatService;

public class ChatLogdown extends AbstractView{

	@Autowired ServletContext context;
	@Autowired ChatService chatService;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//저장된 파일의 이름
		String fileName = (String) request.getAttribute("filepath");
		
		//업로드된 텍스트 파일 다루기 위한 객체 
		File src = new File(context.getRealPath("chatlog"), fileName);

		//서버 입출력 스트림
		FileInputStream in = new FileInputStream(src);
		OutputStream out = response.getOutputStream();
		
		//헤더 정보 구성 (MIME타입으로 전송)
		response.setContentLength((int) src.length());
		response.setContentType("application/octet-stream");
//		response.setContentType("application/JSON");
		response.setCharacterEncoding("UTF-8");
		
		String output = URLEncoder.encode(fileName,"UTF-8"); //octet 인코딩 
		response.setHeader("Content-Disposition","attachment; filename = \"" + output + "\"");
	
		FileCopyUtils.copy(in, out);
		
	}

}
