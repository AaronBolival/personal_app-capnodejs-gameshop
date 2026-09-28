sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ageratingui/test/integration/pages/ReviewList.gen",
	"ageratingui/test/integration/pages/ReviewObjectPage.gen"
], function (JourneyRunner, ReviewListGenerated, ReviewObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ageratingui') + '/test/flp.html#app-preview',
        pages: {
			onTheReviewListGenerated: ReviewListGenerated,
			onTheReviewObjectPageGenerated: ReviewObjectPageGenerated
        },
        async: true
    });

    return runner;
});

