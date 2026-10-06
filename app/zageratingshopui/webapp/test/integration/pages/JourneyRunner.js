sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zageratingshopui/test/integration/pages/AgeRatingList.gen",
	"zageratingshopui/test/integration/pages/AgeRatingObjectPage.gen"
], function (JourneyRunner, AgeRatingListGenerated, AgeRatingObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zageratingshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheAgeRatingListGenerated: AgeRatingListGenerated,
			onTheAgeRatingObjectPageGenerated: AgeRatingObjectPageGenerated
        },
        async: true
    });

    return runner;
});

