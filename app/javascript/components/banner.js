// home page
import Typed from 'typed.js';
function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Containeroo"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
