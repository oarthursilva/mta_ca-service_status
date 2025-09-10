sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"statusoverviewadmin/test/integration/pages/StatusOverviewList",
	"statusoverviewadmin/test/integration/pages/StatusOverviewObjectPage"
], function (JourneyRunner, StatusOverviewList, StatusOverviewObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('statusoverviewadmin') + '/index.html',
        pages: {
			onTheStatusOverviewList: StatusOverviewList,
			onTheStatusOverviewObjectPage: StatusOverviewObjectPage
        },
        async: true
    });

    return runner;
});

