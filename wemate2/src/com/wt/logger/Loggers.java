package com.wt.logger;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

	@Service
	@Aspect
	public class Loggers {
		private Logger search_log = Logger.getLogger("search");
		private Logger work_log = Logger.getLogger("work"); 
		private Logger user_log = Logger.getLogger("user"); 
		//private Logger data_log = Logger.getLogger("data"); 
		
		// 탭에서 서치하면 로그 생성
		@Before("execution(* com.wt.controller..SearchController.search*return(..))")
		public void search_logging(JoinPoint jp) {
			//String method = jp.getSignature().getName();
			Object[] args = jp.getArgs();
			search_log.debug("search_name : "+args[0].toString());

		}
		
		@Before("execution(* com.wt.controller..*Controller.*(..))")
		public void logging(JoinPoint jp) {
			work_log.debug(jp.getSignature().getName()+" ");
		}
		@Before("execution(* com.wt.controller..*Controller.loginimpl(..))")
		public void logging2(JoinPoint jp) {
			String method = jp.getSignature().getName();
			Object[] args = jp.getArgs();
			user_log.debug("call method="+method+" args[1]="+args[1].toString()+" args[2]="+args[2].toString());
		}
		/*@Before("execution(* com.wt.controller..ProductController.get*Detail(..))")
		public void logging3(JoinPoint jp) {
			String method = jp.getSignature().getName();
			Object[] args = jp.getArgs();
			data_log.debug("Called method Name = "+method+" / Product ID No = "+args[0].toString()+" ");
		}*/
	}
