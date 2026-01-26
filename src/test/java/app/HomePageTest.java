package app.selenium;

import org.junit.jupiter.api.*;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class HomePageTest {

    WebDriver driver;

    @BeforeEach
    void setUp() {
        // Configuration de Chrome en mode headless pour CI/CD
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");             // Chrome sans interface graphique
        options.addArguments("--no-sandbox");           // nécessaire sur Linux
        options.addArguments("--disable-dev-shm-usage"); // évite les problèmes de mémoire

        driver = new ChromeDriver(options);
    }

    @Test
    void testHomePageTitle() {
        // Accès à l'application déployée en préproduction
        driver.get("http://10.11.19.83:8080/carshare-app");
        assertTrue(driver.getTitle().contains("Carshare"), "Le titre de la page est incorrect !");
    }

    @AfterEach
    void tearDown() {
        if (driver != null) driver.quit();
    }
}
