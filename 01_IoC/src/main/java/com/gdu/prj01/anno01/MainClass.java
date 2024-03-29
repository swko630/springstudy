package com.gdu.prj01.anno01;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {
  public static void method1() {
    
    
    // appCtx.xml 읽기
    AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
    
    // appCtx.xml 에 등록한 빈(bean) 가져오기
    Calculator calculator = ctx.getBean("calculator", Calculator.class);
    
    // 가져온 빈(bean) 사용하기
    calculator.add(10, 20);
    calculator.sub(10, 20);
    calculator.mul(10, 20);
    calculator.div(100, 4);
    
    ctx.close();
    
    
  }

  public static void method2() {
    
  AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);  
  
  Computer computer1 = ctx.getBean("computer1", Computer.class);
  
  System.out.println(computer1.getModel());
  System.out.println(computer1.getPrice());
  computer1.getCalculator().add(10, 10);
  computer1.getCalculator().sub(10, 10);
  computer1.getCalculator().mul(10, 10);
  computer1.getCalculator().div(10, 10);
    
  ctx.close();
  }
  
  public static void method3() {
    
  AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppConfig.class);
  
  Computer computer2 = ctx.getBean("computer2", Computer.class);
  
  System.out.println(computer2.getModel());
  System.out.println(computer2.getPrice());
  computer2.getCalculator().add(100, 10);
  computer2.getCalculator().sub(100, 10);
  computer2.getCalculator().mul(100, 10);
  computer2.getCalculator().div(100, 10);
    
  ctx.close();
  }
  
  
  public static void main(String[] args) {
    
    method3();
    
  }

}
