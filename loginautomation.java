package sel_day1;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.firefox.FirefoxDriver;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class assign1 {

	
	public static void main(String[] args) {
		try {
			File f1 = new File("C:\\Users\\SI325473\\Selenium_HandsOn\\Sel_assign1\\Data_Source\\Ex1_Login.xls");
			Workbook w = Workbook.getWorkbook(f1);
			Sheet s = w.getSheet("Sheet1");
			
			int rowno = s.getRows();
			System.out.println(rowno);
			int colno = s.getColumns();
			Cell c = null;
		String [][] cells = new String[rowno][colno];
		
		
			for (int row=0; row<rowno; row++) {
				for(int col=0; col<colno; col++) {
								
				}
			}
		System.setProperty("webdriver.gecko.driver", "C:\\Users\\SI325473\\Selenium_HandsOn\\Sel_assign1\\Drivers\\geckodriver.exe");
		FirefoxDriver d1 = new FirefoxDriver();

		//Step 1 : Launching the application
		d1.get("https://demo.opencart.com/");
		
		// waiting for the webpage to load
		d1.manage().timeouts().implicitlyWait(60, TimeUnit.SECONDS);
		
		d1.manage().window().maximize();
//		System.out.println(d1.getTitle());
		
		
		//Step 2 : Click on Login Link 
		for (int i=0; i<rowno-1; i++) {
			for(int j=0; j<colno-1; j++) {
				
		
		d1.findElement(By.xpath("//*[@id=\"top-links\"]/ul/li[2]/a")).click();	
		d1.findElementByLinkText("Login").click();
	
		// Step 3 : Login with username and pwd & submit
		String email =	s.getCell(j, i).getContents();
		//System.out.println(email);
	   d1.findElement(By.xpath("//*[@id=\"input-email\"]")).sendKeys(email);
		String pwd = s.getCell(j+1, i).getContents();
	   d1.findElement(By.cssSelector("#input-password")).sendKeys(pwd);
		d1.findElement(By.xpath("//*[@id=\"content\"]/div/div[2]/div/form/input")).click();		

		// Step 4 : Click on Logout
		d1.findElement(By.xpath("//*[@id=\"top-links\"]/ul/li[2]/a")).click();
		d1.findElement(By.cssSelector("#top-links > ul > li.dropdown.open > ul > li:nth-child(5) > a")).click();
	
		
			}
		}
		
		}
		
		catch(Exception e) {
			System.out.println(e);
		}
	}
	

}
