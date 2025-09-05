const urlJoke = "http://www.official-joke-api.appspot.com/random_joke";


fetch(urlJoke)
.then(res=>res.json())
.then((data)=>
{
    console.log(data);
})



.catch((error)=>
{
    console.error(error);
});