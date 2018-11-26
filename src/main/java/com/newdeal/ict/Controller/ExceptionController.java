package com.newdeal.ict.Controller;

import java.io.IOException;

import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	@ExceptionHandler(IOException.class)
	public ModelAndView exception(IOException e) {
		ModelAndView mv = new ModelAndView("test/exception");
		mv.addObject("name",e.getClass().getSimpleName());
		mv.addObject("message",e.getMessage());
		mv.addObject("test","IOException");
		return mv;
		
	}
	
	@ExceptionHandler(HttpRequestMethodNotSupportedException.class)
	public ModelAndView exception(HttpRequestMethodNotSupportedException e) {
		ModelAndView mv = new ModelAndView("test/exception");
		mv.addObject("name",e.getClass().getSimpleName());
		mv.addObject("message",e.getMessage());
		mv.addObject("test","HttpRequestMethodNotSupportedException");
		return mv;
		
	}
}
