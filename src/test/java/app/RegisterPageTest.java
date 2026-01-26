package app.selenium;

import org.junit.jupiter.api.*;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class RegisterPageTest {

    WebDriver driver;
    WebDriverWait wait;

    @BeforeEach
    void setUp() {
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless=new"); // nouvelle API headless plus stable
        options.addArguments("--no-sandbox");
        options.addArguments("--disable-dev-shm-usage");
        options.addArguments("--window-size=1920,1080"); // important pour rendre les éléments visibles

        driver = new ChromeDriver(options);
        wait = new WebDriverWait(driver, Duration.ofSeconds(10));
    }

    @Test
    void testCreateAccount() {
        driver.get("http://10.11.19.83:8080/carshare-app/register");

        // Attendre que le champ username soit visible
        WebElement usernameInput = wait.until(
                ExpectedConditions.visibilityOfElementLocated(By.id("username"))
        );
        WebElement emailInput = driver.findElement(By.id("email"));
        WebElement passwordInput = driver.findElement(By.id("password"));
        WebElement submitButton = driver.findElement(By.cssSelector("button[type='submit']"));

        // Remplissage du formulaire
        usernameInput.sendKeys("zinebtest");
        emailInput.sendKeys("zineb@test.com");
        passwordInput.sendKeys("Test1234!");

        // Cliquer sur le bouton S'inscrire
        submitButton.click();

        // Attendre que le message de succès apparaisse
        boolean successMessageVisible = wait.until(
                ExpectedConditions.or(
                        ExpectedConditions.textToBePresentInElementLocated(By.cssSelector("div.bg-green-100"), "Votre compte a été créé"),
                        ExpectedConditions.textToBePresentInElementLocated(By.cssSelector("div.bg-green-100"), "success")
                )
        );

        assertTrue(successMessageVisible, "Le compte n'a pas été créé !");
    }

    @AfterEach
    void tearDown() {
        if (driver != null) driver.quit();
    }
}
