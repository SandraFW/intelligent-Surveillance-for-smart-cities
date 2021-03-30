import java.io.*;
import java.util.Arrays;

import javax.script.*;

public class JavaRunCommand {

	 public static void main(String... args) throws IOException {

	        ProcessBuilder pb =
	                new ProcessBuilder("python","path","1.pdf");

	        pb.redirectErrorStream(true);
	        Process proc = pb.start();

	        Reader reader = new InputStreamReader(proc.getInputStream());
	        BufferedReader bf = new BufferedReader(reader);
	        String s;
	        while ((s = bf.readLine()) != null) {
	            System.out.println(s);
	        }
	    }

}
