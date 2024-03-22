package com.gdu.prj08.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdu.prj08.utills.MyFileUtils;

@Controller
public class MvcControlller {
  

  
  @GetMapping(value= {"/", "/main.do"})
  public String welcome() {
    
    return "index";
  }
}