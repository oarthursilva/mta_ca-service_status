sap.ui.define([
	"sap/m/ButtonType",
	"statusoverview/ext/dialog/InformationDialog",
], function (buttonType, InformationDialog) {
	"use strict";

	const ButtonType = buttonType;

	return {
		onInit: function () {
			const informationButton = this.byId('statusoverview::StatusOverviewList--fe::table::StatusOverview::LineItem::CustomAction::information');
			informationButton.setIcon('sap-icon://information');
			informationButton.setType(ButtonType.Emphasized);
		},

		/**
		 * @event
		 */
		handleInformationDialog: function () {
			const controller = this._controller;
			InformationDialog.open(controller);
		},
	};
});