package com.kh.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.www.Apart.model.exception.ApartException;
import com.kh.www.Apart.model.service.ApartService;
import com.kh.www.Apart.model.vo.Apart;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private ApartService aptService;
	
	@RequestMapping("aptAdd.do")
	public String aptInsert(@RequestParam("aptAdd_Name") String name, @RequestParam("address1") String address,
			                @RequestParam("aptAdd_dong") String[] dong, @RequestParam("aptAdd_phone") String phone,
			                Model model, HttpServletResponse response) throws IOException {
		
		System.out.println("�씠由�:" + name);
		System.out.println("二쇱냼:" + address);
		System.out.println("�룞:" + Arrays.toString(dong));
		System.out.println("�쟾�솕踰덊샇:" + phone);
		
		String dongjoin = String.join(",",dong);
		
		Apart apt = new Apart(name, dongjoin, address, phone);
		
		int result = aptService.aptInsert(apt);
		
		if(result>0) {
			model.addAttribute("msg","�븘�뙆�듃瑜� �떊泥��븯���뒿�땲�떎.");
			response.setContentType("text/html; charset=UTF-8");
			
            PrintWriter out = response.getWriter();
            out.println("<script>alert('�븘�뙆�듃瑜� �떊泥��븯���뒿�땲�떎.'); history.go(-1);</script>");
            out.flush();


			return "index";
		}else {
			throw new ApartException("�븘�뙆�듃 異붽��뿉 �떎�뙣�뻽�뒿�땲�떎.");
		}
		
	}
	
	@RequestMapping("donglist.bo")
	public void donglist(@RequestParam("name") String name, Model model,
						   HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8"); 
		String dong = null;
		String[] dongs = null;
		if(name != null) {
			dong = aptService.donglist(name);
			dongs = dong.split(",");
		}
		
		Gson gson = new Gson();
		
		try {
			gson.toJson(dongs, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("aptDupChk.do")
	   public void aptDupName(@RequestParam("name") String name, HttpServletResponse response) {
	      
	      System.out.println(name);
	      
	      int result = aptService.aptDupName(name);
	      
	      boolean isable = result == 0 ? true : false;
	      
	      try {
	         response.getWriter().print(isable);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      
	      
	   }
	

	
}
