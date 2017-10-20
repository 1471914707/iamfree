package lin.jiayu.util;

import java.util.Random;

public class VerCode {
	public static String getVerCode(int n){
		String rCode = "";
		Random rn = new Random();
		for (int i=0; i<n; i++){
			rCode += rn.nextInt(10);			
		}
		return rCode;
	}
}
