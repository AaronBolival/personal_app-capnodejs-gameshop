using { GameShop as dbschema } from '../db/schema.cds';

@path : '/service/GameShopService'
// @requires: 'authenticated-user'
service GameShopService
{   
    @odata.draft.enabled
    entity Game as projection on dbschema.zgame {
        *,
        case 
            when stock is null or stock = 0 then 'O'
            when stock <= 5 then 'L'
            else 'I'
        end as stockStatus : dbschema.enum_StockStatus
    };
    entity GamePlatform as projection on dbschema.zgameplatform;
    entity Category as projection on dbschema.zcategory;
    entity Screenshot as projection on dbschema.zscreenshot;

    @odata.draft.enabled    
    entity Review as projection on dbschema.zreview;

    @cds.redirection.target
    @readonly
    entity ReviewView as projection on dbschema.zreview;

    @odata.draft.enabled
    entity Publisher as projection on dbschema.zpublisher;

    @odata.draft.enabled
    entity Studio as projection on dbschema.zstudio;

    @odata.draft.enabled
    // @restrict: [{ grant: 'READ', to: 'Viewer' }]
    entity AgeRating as projection on dbschema.zagerating;

    @odata.draft.enabled
    entity Platform as projection on dbschema.zplatform;

    @odata.draft.enabled
    entity CategoryList as projection on dbschema.zcategorylist;


}

// annotate GameShopService with @requires :
// [
//     'authenticated-user'
// ];
