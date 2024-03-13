package com.gdu.prj01.xml02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

  public static void method1() {
    
    AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
    
    Student student = (Student) ctx.getBean("student");
    
    System.out.println(student.getScores());
    System.out.println(student.getContacts());
    System.out.println(student.getFriends());
    
    ctx.close();
    
  }
  
  
  public static void main(String[] args) {
  
    method1();
    

  }

}
