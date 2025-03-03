document.addEventListener("turbolinks:load", function () {
  const userDropdown = document.getElementById("userDropdown");
  const dropdownMenu = document.getElementById("dropdownMenu");

  if (userDropdown && dropdownMenu) {
    userDropdown.addEventListener("click", function (event) {
      event.preventDefault();
      dropdownMenu.classList.toggle("show");
    });

    document.addEventListener("click", function (event) {
      if (!userDropdown.contains(event.target) && !dropdownMenu.contains(event.target)) {
        dropdownMenu.classList.remove("show");
      }
    });
  }
});
