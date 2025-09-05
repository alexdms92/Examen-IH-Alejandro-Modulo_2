const urlNorris = "https://api.chucknorris.io/jokes/random";


fetch(urlNorris)
.then(res=>res.json())
.then((data)=>
{
    console.log(data);
})



.catch((error)=>
{
    console.error(error);
});