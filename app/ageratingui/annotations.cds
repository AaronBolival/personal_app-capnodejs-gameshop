using GameShopService as service from '../../srv/service';
annotate service.Review with {
    game @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Game',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : game_gameId,
                ValueListProperty : 'gameId',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'title',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'releaseDate',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'price',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'rating',
            },
        ],
    }
};

