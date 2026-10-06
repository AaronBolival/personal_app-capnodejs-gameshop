sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zreviewviewshopui/test/integration/pages/ReviewViewList.gen",
	"zreviewviewshopui/test/integration/pages/ReviewViewObjectPage.gen"
], function (JourneyRunner, ReviewViewListGenerated, ReviewViewObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zreviewviewshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheReviewViewListGenerated: ReviewViewListGenerated,
			onTheReviewViewObjectPageGenerated: ReviewViewObjectPageGenerated
        },
        async: true
    });

    return runner;
});

