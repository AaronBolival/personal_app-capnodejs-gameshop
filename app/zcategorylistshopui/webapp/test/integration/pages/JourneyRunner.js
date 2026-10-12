sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zcategorylistshopui/test/integration/pages/CategoryListList.gen",
	"zcategorylistshopui/test/integration/pages/CategoryListObjectPage.gen"
], function (JourneyRunner, CategoryListListGenerated, CategoryListObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zcategorylistshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheCategoryListListGenerated: CategoryListListGenerated,
			onTheCategoryListObjectPageGenerated: CategoryListObjectPageGenerated
        },
        async: true
    });

    return runner;
});

