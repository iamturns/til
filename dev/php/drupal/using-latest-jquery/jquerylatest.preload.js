if (window.jQuery) {
    window.jQueryOld = window.jQuery;
    try {
        delete window.jQuery;
    } catch(e) {
        window['jQuery'] = undefined;
    }
}
if (window.$) {
    window.$old = window.$;
    try {
        delete window.$;
    } catch(e) {
        window['$'] = undefined;
    }
}