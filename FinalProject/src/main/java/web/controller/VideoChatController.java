package web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VideoChatController {
	
	@GetMapping(value="/videoChat/sender")
	public void videoSender() {}
	
	@GetMapping(value="/videoChat/receiver")
	public void videoReceiver() {}
	
	
	
}
