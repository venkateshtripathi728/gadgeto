
const displaycategory = () => {
  const lists = document.querySelectorAll(".category-btn")
  const arrayLists = Array.from(lists)
  lists.forEach((list) => {
    list.addEventListener('click', (event) => {
      console.log(event.currentTarget.classList.contains("active"))
      console.log(lists)
      lists.forEach((list) => {
        if (list !== event.currentTarget) {
          list.classList.remove("active")
        };
      });
      event.currentTarget.classList.toggle("active")
      const tools = document.querySelectorAll(".product-cards")
      if (!event.currentTarget.classList.contains("active")) {
        tools.forEach((tool) => {
          tool.classList.remove('d-none')
        })
      }
      else {
        tools.forEach((tool) => {
        if (event.currentTarget.dataset.filter != tool.dataset.filter) {
          tool.classList.add('d-none')
        }
        else {
          tool.classList.remove('d-none')
        }
      })
      }
    })
  })
}


export { displaycategory };
