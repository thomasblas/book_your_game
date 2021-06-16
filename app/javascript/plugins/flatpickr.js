import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr(".rent_start_at", {
    altInput: true,
    plugins: [new rangePlugin({ input: ".rent_end_at" })],
    enableTime: false,
  });
}

export { initFlatpickr };
