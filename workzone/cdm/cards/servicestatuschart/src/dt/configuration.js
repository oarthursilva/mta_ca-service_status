// add your copyright here

/**
 * This module was created by the BASEditor
 */
sap.ui.define(["sap/ui/integration/Designtime"], function (
    Designtime
) {
    "use strict";
    return function () {
        return new Designtime({
            "form": {},
            "preview": {
                "modes": "LiveAbstract"
            }
        });
    };
});