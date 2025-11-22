window.addEventListener("message", function(event) {
    const container = document.getElementById("container");

    if (event.data.action === "open") {
        container.style.display = "block";
        container.classList.remove("closing");
        container.classList.add("opening");
    } else if (event.data.action === "close") {
        container.classList.remove("opening");
        container.classList.add("closing");
        setTimeout(() => {
            container.style.display = "none";
            container.classList.remove("closing");
        }, 250);
    }
});

function sendTest() {
    const data = {
        name: document.getElementById("name")?.value || "",
        age: document.getElementById("age")?.value || "",

        // Historique personnel
        depression: document.getElementById("depression")?.value || "",
        psy: document.getElementById("psy")?.value || "",
        suicidal: document.getElementById("suicidal")?.value || "",
        stress: document.getElementById("stress")?.value || "",

        // Gestion de la colère
        disrespect: document.getElementById("disrespect")?.value || "",
        anger: document.getElementById("anger")?.value || "",
        physical: document.getElementById("physical")?.value || "",
        calm: document.getElementById("calm")?.value || "",

        // Consommation
        alcohol: document.getElementById("alcohol")?.value || "",
        dangerous: document.getElementById("dangerous")?.value || "",
        problems: document.getElementById("problems")?.value || "",

        // Antécédents de violence
        fights: document.getElementById("fights")?.value || "",
        tribunal: document.getElementById("tribunal")?.value || "",
        complaints: document.getElementById("complaints")?.value || "",
        bully: document.getElementById("bully")?.value || "",

        // Motivation PPA
        reason: document.getElementById("reason")?.value || "",
        impact: document.getElementById("impact")?.value || "",
        responsibility: document.getElementById("responsibility")?.value || "",

        // Sécurité
        security: document.getElementById("security")?.value || "",
        emotion: document.getElementById("emotion")?.value || "",
        manipulate: document.getElementById("manipulate")?.value || "",

        // Commentaire général
        commentaire: document.getElementById("commentaire")?.value || ""
    };

    const container = document.getElementById("container");
    container.classList.remove("opening");
    container.classList.add("closing");

    fetch(`https://${GetParentResourceName()}/sendTest`, {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(data)
    });

    setTimeout(() => {
        container.style.display = "none";
        container.classList.remove("closing");
    }, 250);
}

function closeUI() {
    const container = document.getElementById("container");
    container.classList.remove("opening");
    container.classList.add("closing");

    setTimeout(() => {
        fetch(`https://${GetParentResourceName()}/close`, { method: "POST" });
        container.style.display = "none";
        container.classList.remove("closing");
    }, 250);
}
