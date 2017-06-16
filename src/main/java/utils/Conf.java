package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Conf {

	public static String getProperty(String propName) {
		Properties prop = new Properties();
		InputStream input = null;

		try {

			String filename = "feedmeback.properties";
			input = Conf.class.getClassLoader().getResourceAsStream(filename);
			if(input==null){
					System.out.println("Sorry, unable to find " + filename);
				return null;
			}

			//load a properties file from class path, inside static method
			prop.load(input);
			return prop.getProperty(propName);

		} catch (IOException ex) {
			ex.printStackTrace();
		} finally{
			if(input!=null){
				try {
					input.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return null;
	}
}