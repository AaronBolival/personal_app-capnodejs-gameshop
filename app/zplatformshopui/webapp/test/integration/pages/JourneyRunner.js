sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zplatformshopui/test/integration/pages/ReviewList.gen",
	"zplatformshopui/test/integration/pages/ReviewObjectPage.gen"
], function (JourneyRunner, ReviewListGenerated, ReviewObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zplatformshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheReviewListGenerated: ReviewListGenerated,
			onTheReviewObjectPageGenerated: ReviewObjectPageGenerated
        },
        async: true
    });

    return runner;
});

