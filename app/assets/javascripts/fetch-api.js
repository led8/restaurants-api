
const restaurants = document.querySelector('.restaurants');
const form = document.querySelector('#search-movies');


function searchRestaurant(query) {
  fetch(`http://localhost:3000/api/v1/restaurants?search=${query}`)
  .then(response => response.json())
  .then((data) => {
    data.restaurants.forEach((resto) => {

      const name = resto.name;
      const address = resto.address
      const comment = resto.comments.map(com => com.content)

      const restaurant = `<div class="restaurant">
        <h2 class="name">${name}</h2>
        <h4 class="address">${address}</h4>
        <h6 class="comment">${comment}</h6>
      </div>`;

      restaurants.insertAdjacentHTML("beforeend", restaurant)
    });
  });
}

form.addEventListener('submit', (event) => {
  event.preventDefault();
  const input = event.currentTarget.querySelector('.form-control').value;

  restaurants.innerHTML = '';
  searchRestaurant(input);
})

searchRestaurant('Chez Justine');
