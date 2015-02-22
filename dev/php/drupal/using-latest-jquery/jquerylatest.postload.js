//Store current jQuery as jQuery latest
if (window.jQuery) {
    window.jQueryLatest = window.jQuery;
}
if (window.$) {
    window.$latest = window.$;
}

//Restore jQueryOld as jQuery
if (window.jQueryOld) {
    window.jQuery = window.jQueryOld;
}
if (window.$old) {
    window.$ = window.$old;
}