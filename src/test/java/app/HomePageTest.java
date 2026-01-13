package app.selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.*;

public class HomePageTest {

    WebDriver driver;

    @BeforeClass
    public void setUp() {
        // Chemin vers le driver Chrome ou Gecko
        System.setProperty("webdriver.chrome.driver", "/usr/local/bin/chromedriver");
        driver = new ChromeDriver();
    }

    @Test
    public void testHomePageTitle() {
        driver.get("http://10.11.19.83:8080/carshare-app");
        assert driver.getTitle().contains("Carshare") : "Titre incorrect!";
    }

    @AfterClass
    public void tearDown() {
        if(driver != null) driver.quit();
    }
}
