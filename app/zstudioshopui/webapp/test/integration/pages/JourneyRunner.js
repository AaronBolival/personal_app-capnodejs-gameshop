sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zstudioshopui/test/integration/pages/StudioList.gen",
	"zstudioshopui/test/integration/pages/StudioObjectPage.gen"
], function (JourneyRunner, StudioListGenerated, StudioObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zstudioshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheStudioListGenerated: StudioListGenerated,
			onTheStudioObjectPageGenerated: StudioObjectPageGenerated
        },
        async: true
    });

    return runner;
});

