sap.ui.define(
    [
        "sap/ui/core/Fragment",
        "sap/ui/model/json/JSONModel",
    ],
    function (Fragment, JSONModel) {
        "use strict";

        let messagesDialog;
        let data = {
            status: {
                title: 'Status indicator',
                success: 'No problems',
                warning: 'Update delayed, maintenance, details can be found in comment',
                error: 'Data not up to date, technical problems, details can be found in comment'
            },
            remarks: {
                title: 'Remarks',
                text1: 'If traffic light is green, latest update of data load is:',
                text2: ['<ul>',
                    '<li>1st load: 09:00 CET</li>',
                    '<li>2nd load: 15:00 CET / 09:00 EST</li>',
                    '<li>3nd load: 01:00 CET / 07:00 HKT (summer) / 08:00 HKT (winter)</li>',
                    '</ul>'].join(''),
                text3: '<p>The actual time of "last data update" can be found in each BIS report</p>',
                text4: 'The traffic lights are only maintained by BI Team <strong>one hour</strong> before latest update for <strong>first and second load</strong>'
            }
        };

        function controller(parentController) {
            function closeDialog() {
                messagesDialog.close();
            }

            return {
                onDialogBeforeOpen: function (oEvent) {
                    messagesDialog = oEvent.getSource();
                    parentController.getView().addDependent(messagesDialog);

                    const model = new JSONModel();
                    model.setData(data);

                    messagesDialog.setModel(model);
                },

                onDialogAfterClose: function () {
                    parentController.getView().removeDependent(messagesDialog);
                    messagesDialog.destroy();
                    messagesDialog = undefined;
                },

                onCloseButtonPress: function () {
                    closeDialog();
                },
            };
        }

        return {
            open: function (parentController) {
                Fragment.load({
                    id: "idInformationDialog",
                    name: "statusoverview.ext.dialog.InformationDialog",
                    controller: controller(parentController),
                }).then((dialog) => dialog.open());
            },
        };
    }
);