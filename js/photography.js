import PhotoSwipeLightbox from "https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe-lightbox.esm.min.js";
import PhotoSwipe from "https://cdn.jsdelivr.net/npm/photoswipe@5/dist/photoswipe.esm.min.js";

const gallery = document.querySelector("[data-photo-gallery]");

if (gallery) {
  const lightbox = new PhotoSwipeLightbox({
    gallery,
    children: "a[data-pswp-width]",
    pswpModule: PhotoSwipe,
    initialZoomLevel: "fit",
    secondaryZoomLevel: 2,
    maxZoomLevel: 4,
    preload: [1, 2],
    escKey: true,
    arrowKeys: true,
    pinchToClose: true,
    closeOnVerticalDrag: true,
    padding: { top: 24, right: 24, bottom: 24, left: 24 }
  });

  lightbox.init();
}

const siteHeader = document.querySelector("[data-site-header]");

if (siteHeader) {
  const menuButton = siteHeader.querySelector(".portfolio-menu-button");
  const menuLabel = menuButton?.querySelector("span");
  const navigation = siteHeader.querySelector(".portfolio-nav");

  const setMenuState = (isOpen) => {
    siteHeader.classList.toggle("is-menu-open", isOpen);
    document.body.classList.toggle("is-menu-open", isOpen);
    menuButton?.setAttribute("aria-expanded", String(isOpen));

    if (menuLabel) {
      menuLabel.textContent = isOpen ? "Close" : "Menu";
    }
  };

  menuButton?.addEventListener("click", () => {
    setMenuState(menuButton.getAttribute("aria-expanded") !== "true");
  });

  navigation?.addEventListener("click", (event) => {
    if (event.target.closest("a")) {
      setMenuState(false);
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      setMenuState(false);
      menuButton?.focus();
    }
  });

  window.matchMedia("(min-width: 761px)").addEventListener("change", (event) => {
    if (event.matches) {
      setMenuState(false);
    }
  });
}
