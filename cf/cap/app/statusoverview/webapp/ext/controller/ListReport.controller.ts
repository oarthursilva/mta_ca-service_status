import ControllerExtension from 'sap/ui/core/mvc/ControllerExtension';
import ExtensionAPI from 'sap/fe/templates/ListReport/ExtensionAPI';
import InformationDialog from 'statusoverview/ext/dialog/InformationDialog';
import Button from 'sap/m/Button';

/**
 * @namespace statusoverview.ext.controller
 * @controller
 */
export default class ListReport extends ControllerExtension<ExtensionAPI> {
	static overrides = {
		/**
		 * Called when a controller is instantiated and its View controls (if available) are already created.
		 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
		 * @memberOf statusoverview.ext.controller.ListReport
		 */
		onInit(this: ListReport) {
			// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
			// const model = this.base.getExtensionAPI().getModel();

			// @ts-ignore
			const informationButton = this.byId('statusoverview::StatusOverviewList--fe::table::StatusOverview::LineItem::CustomAction::information') as Button;
			informationButton.setIcon('sap-icon://information');
			informationButton.setType('Emphasized');
		}
	}
}

/**
 * Generated event handler.
 */
export function handleInformationDialog() {
	// @ts-ignore
	InformationDialog.open(this);
}
