document.addEventListener("DOMContentLoaded", () => {
    const splashStyle = document.createElement("link");
    splashStyle.rel = "stylesheet";
    splashStyle.href = "splash.css";
    document.head.appendChild(splashStyle);

    const splashScreen = document.createElement("div");
    splashScreen.id = "splash-screen";
    splashScreen.innerHTML = `
        <img src="/images/load_screen/pokeball.gif" class="pokeball" alt="Loading...">
    `;
    document.body.appendChild(splashScreen);

    setTimeout(() => {
        splashScreen.style.opacity = "0";
        setTimeout(() => {
            splashScreen.remove();
            splashStyle.remove();
        }, 500);
    }, 1000);
});
