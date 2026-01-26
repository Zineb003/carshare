package app.selenium;

import org.junit.jupiter.api.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class HomePageTest {

    WebDriver driver;

    @BeforeEach
    void setUp() {
        driver = new ChromeDriver();
    }

    @Test
    void testHomePageTitle() {
        driver.get("http://10.11.19.83:8080/carshare-app");
        assertTrue(driver.getTitle().contains("Carshare"));
    }

    @AfterEach
    void tearDown() {
        if (driver != null) driver.quit();
    }
}
