sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zpublishershopui/test/integration/pages/PublisherList.gen",
	"zpublishershopui/test/integration/pages/PublisherObjectPage.gen"
], function (JourneyRunner, PublisherListGenerated, PublisherObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zpublishershopui') + '/test/flp.html#app-preview',
        pages: {
			onThePublisherListGenerated: PublisherListGenerated,
			onThePublisherObjectPageGenerated: PublisherObjectPageGenerated
        },
        async: true
    });

    return runner;
});

