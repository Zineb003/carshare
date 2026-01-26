package app.selenium;

import org.junit.jupiter.api.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class RegisterPageTest {

    WebDriver driver;

    @BeforeEach
    void setUp() {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--no-sandbox");
        options.addArguments("--disable-dev-shm-usage");

        driver = new ChromeDriver(options);
    }

    @Test
    void testCreateAccount() throws InterruptedException {
        driver.get("http://10.11.19.83:8080/carshare-app/register");

        // Remplissage du formulaire
        driver.findElement(By.id("username")).sendKeys("zinebtest");
        driver.findElement(By.id("email")).sendKeys("zineb@test.com");
        driver.findElement(By.id("password")).sendKeys("Test1234!");

        // Cliquer sur le bouton S'inscrire
        driver.findElement(By.cssSelector("button[type='submit']")).click();

        // Attendre un peu que la page se recharge (ou utiliser WebDriverWait pour attendre un message)
        Thread.sleep(2000);

        // Vérification de la réussite via la présence d'un message success ou redirection
        String bodyText = driver.getPageSource();
        assertTrue(bodyText.contains("Votre compte a été créé") || bodyText.contains("success"), "Le compte n'a pas été créé !");
    }

    @AfterEach
    void tearDown() {
        if (driver != null) driver.quit();
    }
}
