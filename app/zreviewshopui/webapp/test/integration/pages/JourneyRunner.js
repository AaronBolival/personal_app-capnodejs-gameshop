sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zreviewshopui/test/integration/pages/ReviewList.gen",
	"zreviewshopui/test/integration/pages/ReviewObjectPage.gen"
], function (JourneyRunner, ReviewListGenerated, ReviewObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zreviewshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheReviewListGenerated: ReviewListGenerated,
			onTheReviewObjectPageGenerated: ReviewObjectPageGenerated
        },
        async: true
    });

    return runner;
});

