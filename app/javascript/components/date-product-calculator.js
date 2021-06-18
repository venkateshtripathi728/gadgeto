function date { 
const dates = document.querySelector("#range_start");
const div = document.querySelector("#pricetotal");
const pricePerDay = parseInt(document.querySelector("#price").innerHTML, 10);
const totalPrice = document.querySelector("#totalprice");
const numberOfDays = document.querySelector("#counter");
const Dayss = document.querySelector("#dayss");
dates.addEventListener("blur", (event) => {
    console.log("event ok")
    const start_date = new Date(document.querySelector("#range_start").value.slice(0,10))
    const end_date = new Date(document.querySelector("#range_start").value.slice(14,24))
    numberOfDays.innerHTML = (end_date-start_date) / (1000*60*60*24)
    totalPrice.innerHTML =  `${pricePerDay * (end_date-start_date) / (1000*60*60*24)}€`;
    if (((end_date-start_date) / (1000*60*60*24)) > 1) {
        Dayss.innerHTML = "Days"
     } else {
        Dayss.innerHTML = "Day"
     }
});
}


