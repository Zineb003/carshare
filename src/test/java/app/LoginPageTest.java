package app.selenium;

import org.junit.jupiter.api.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class LoginPageTest {

    WebDriver driver;

    @BeforeEach
    void setUp() {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");             // Chrome sans interface graphique
        options.addArguments("--no-sandbox");           // nécessaire sur Linux
        options.addArguments("--disable-dev-shm-usage"); // éviter crash mémoire
        driver = new ChromeDriver(options);
    }

    @Test
    void testCreateAccount() {
        // Ouvre la page de login/inscription
        driver.get("http://10.11.19.83:8080/carshare-app/login");

        // Remplit le formulaire
        WebElement emailInput = driver.findElement(By.name("email"));
        WebElement passwordInput = driver.findElement(By.name("password"));
        WebElement submitButton = driver.findElement(By.id("registerBtn")); // à adapter selon ton code HTML

        emailInput.sendKeys("testuser@example.com");
        passwordInput.sendKeys("TestPassword123");
        submitButton.click();

        // Vérifie qu'une confirmation apparaît ou qu'on est redirigé
        String pageSource = driver.getPageSource();
        assertTrue(pageSource.contains("Bienvenue") || pageSource.contains("Account created"), 
                   "Le compte n'a pas été créé correctement !");
    }

    @AfterEach
    void tearDown() {
        if (driver != null) driver.quit();
    }
}
