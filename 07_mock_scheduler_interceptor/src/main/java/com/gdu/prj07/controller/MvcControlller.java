package com.gdu.prj07.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MvcControlller {

  
  @GetMapping(value= {"/", "/main.do"})
  public String welcome() {
        
    return "index";
  }
}