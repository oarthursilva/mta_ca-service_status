sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"statusoverview/test/integration/pages/StatusOverviewList",
	"statusoverview/test/integration/pages/StatusOverviewObjectPage"
], function (JourneyRunner, StatusOverviewList, StatusOverviewObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('statusoverview') + '/index.html',
        pages: {
			onTheStatusOverviewList: StatusOverviewList,
			onTheStatusOverviewObjectPage: StatusOverviewObjectPage
        },
        async: true
    });

    return runner;
});

