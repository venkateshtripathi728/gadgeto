
const displaycategory = () => {
  const lists = document.querySelectorAll(".category-btn")
  
  lists.forEach((list) => {
    list.addEventListener('click', (event) => {

      console.log(event.currentTarget)
      lists.forEach((list) => {
        list.classList.remove("active")
      })
      event.currentTarget.classList.add("active")
      const tools = document.querySelectorAll(".product-cards")
      tools.forEach((tool) => {
        console.log(event.currentTarget.dataset.filter)
        console.log(tool.dataset.filter)
        if (event.currentTarget.dataset.filter != tool.dataset.filter) {
          tool.classList.add('d-none')
        }
        else {
          tool.classList.remove('d-none')
        }
      })
    })
  
  })
}

export { displaycategory };