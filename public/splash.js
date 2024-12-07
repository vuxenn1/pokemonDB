document.addEventListener("DOMContentLoaded", () => {
    // Dynamically load splash.css
    const splashStyle = document.createElement("link");
    splashStyle.rel = "stylesheet";
    splashStyle.href = "splash.css"; // Path to your splash.css file
    document.head.appendChild(splashStyle);

    // Create splash screen element
    const splashScreen = document.createElement("div");
    splashScreen.id = "splash-screen";
    splashScreen.innerHTML = `
        <img src="/images/pokeball.gif" class="pokeball" alt="Loading...">
    `;

    // Add the splash screen to the DOM
    document.body.appendChild(splashScreen);

    // Remove the splash screen after 1 second
    setTimeout(() => {
        splashScreen.style.opacity = "0"; // Fade-out effect
        setTimeout(() => {
            splashScreen.remove(); // Remove splash screen
            splashStyle.remove(); // Remove splash.css from the page
        }, 500);
    }, 1000); // Visible duration
});
