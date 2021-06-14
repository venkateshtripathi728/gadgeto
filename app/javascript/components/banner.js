import Typed from 'typed.js';
const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Lawnmower", "Ladder",  "Hammer", "Wheelbarrow", "Strimmer", "and many others..."],
    typeSpeed: 50,
    loop: true
  });
}
export { loadDynamicBannerText };
