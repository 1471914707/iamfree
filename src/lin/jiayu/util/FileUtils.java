package lin.jiayu.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

public class FileUtils {
	public static void copyFile(File upload,String realPath) throws Exception{
			InputStream is = new FileInputStream(upload);
			OutputStream os = new FileOutputStream(realPath);
			byte buffer[] = new byte[1024];
			int count = 0;
			while ((count=is.read(buffer))>0){
				os.write(buffer,0,count);
			}
			is.close();
			os.close();		
	}
	
	public static void copyMutilFile(List<File> upload,List<String> realPath) throws Exception{
		for (int i=0; i<upload.size(); i++){
			InputStream is = new FileInputStream(upload.get(i));
			OutputStream os = new FileOutputStream(realPath.get(i));
			byte buffer[] = new byte[1024];
			int count = 0;
			while ((count=is.read(buffer))>0){
				os.write(buffer,0,count);
			}
			is.close();
			os.close();
		}
	}
}
