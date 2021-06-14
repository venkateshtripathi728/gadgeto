import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Lawnmower ?", "Ax ?",  "Hammer ?", "and many others"],
    typeSpeed: 50,
    loop: true
  });
}
export { loadDynamicBannerText };
