import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})],
    onClose: (selectedDates, dateStr, instance) => {
      const div = document.querySelector("#pricetotal");
      const numberOfDays = document.querySelector("#counter");
      const days = document.getElementsByClassName("inRange").length + 1
      const pricePerDay = parseInt(document.querySelector("#price").innerHTML, 10);
      const totalPrice = document.querySelector("#totalprice");
      const Dayss = document.querySelector("#dayss");
      const button = document.querySelector("#book")
      numberOfDays.innerHTML = days
      div.style.display = "flex"
      totalPrice.innerHTML =  `${pricePerDay * days}€`;
      button.disabled = false;
      if (days > 1) {
        Dayss.innerHTML = "Days"
      } else {
        Dayss.innerHTML = "Day"
     }
    }
  });
}

export { initFlatpickr };