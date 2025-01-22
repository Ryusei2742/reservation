document.addEventListener("DOMContentLoaded", () => {
  const dropdownToggle = document.getElementById("userDropdown");
  const dropdownMenu = document.getElementById("dropdownMenu");

  if (dropdownToggle && dropdownMenu) {
    dropdownToggle.addEventListener("click", (e) => {
      e.preventDefault();
      dropdownMenu.classList.toggle("show");
    });

    // メニュー外をクリックするとドロップダウンを閉じる
    document.addEventListener("click", (e) => {
      if (!dropdownToggle.contains(e.target) && !dropdownMenu.contains(e.target)) {
        dropdownMenu.classList.remove("show");
      }
    });
  } else {
    console.error("Dropdown elements not found: userDropdown or dropdownMenu");
  }
});
