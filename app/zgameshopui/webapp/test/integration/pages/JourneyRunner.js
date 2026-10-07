sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"zgameshopui/test/integration/pages/GameList.gen",
	"zgameshopui/test/integration/pages/GameObjectPage.gen"
], function (JourneyRunner, GameListGenerated, GameObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('zgameshopui') + '/test/flp.html#app-preview',
        pages: {
			onTheGameListGenerated: GameListGenerated,
			onTheGameObjectPageGenerated: GameObjectPageGenerated
        },
        async: true
    });

    return runner;
});

