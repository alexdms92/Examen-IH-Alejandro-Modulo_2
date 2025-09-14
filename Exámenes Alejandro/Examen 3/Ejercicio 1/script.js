const urlJoke = "https://official-joke-api.appspot.com/random_joke";

function getJoke()
{

    document.getElementById('joke-display').innerHTML = '<p class="loading">Cargando...</p>';

    fetch(urlJoke)
    .then(res => res.json())
    .then((data) =>
        {
            document.getElementById('joke-display').innerHTML = `
            <div class="joke-container">
            <div class="setup">${data.setup}</div>
            <div class="punchline">${data.punchline}</div>
            </div>
            `;
        })

        .catch((error) =>
            {
                console.error(error);
                document.getElementById('joke-display').innerHTML = `
                <div class="error">
                <strong>Oops!</strong> Something went wrong while fetching the joke. Please try again!
                </div>
                `;
            });
}

window.onload = function()
{
    getJoke();
}