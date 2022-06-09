package web.util;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class StoreImg {
	
	public String on(MultipartFile file, ServletContext context) {
		
		String storedPath = context.getRealPath("upload");
		
		File storedFolder = new File( storedPath );
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		String storedName =  UUID.randomUUID().toString().split("-")[4]; 
		
		File dest = new File(storedFolder, storedName);
		
		try {
			
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return storedName;

	}

}
