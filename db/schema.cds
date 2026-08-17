namespace GameShop;

using { managed, sap.common.Currencies } from '@sap/cds/common';

type enum_StockStatus : String(1) enum
{
    inStock = 'I';
    lowStock = 'L';
    outOfStock = 'O';
    discontinued = 'D';
}

entity zgame : managed
{
    key gameId : UUID @mandatory;
    title : String(250);
    releaseDate : Date;
    price : Decimal(10,2);
    rating : Decimal(2,1);
    stock : Integer @default: 0; 
    imgUrl : String(1000);
    description : String(1000);
    stockStatus: enum_StockStatus;
    agerating : Association to one zagerating;
    reviews : Association to many zreview on reviews.game = $self;
    publisher : Association to one zpublisher;
    studio : Association to one zstudio;
    currency : Association to one Currencies;
    gameplatforms : Composition of many zgameplatform on gameplatforms.game = $self;
    categories : Composition of many zcategory on categories.game = $self;
    screenshots : Composition of many zscreenshot on screenshots.game = $self;

}

entity zreview : managed
{
    key reviewId : UUID @mandatory;
    name : String(250) @cds.on.insert: $user;
    rate : Decimal(2,1);
    comment : String(500);
    game : Association to one zgame;
}

entity zpublisher
{
    key publisherId : UUID @mandatory;
    name : String(250) @mandatory;
    country : String(30);
    games : Association to many zgame on games.publisher = $self;
}

entity zstudio
{
    key studioId : UUID @mandatory;
    name : String(250) @mandatory;
    country : String(30);
    games : Association to many zgame on games.studio = $self;
}

entity zagerating 
{   
    key code : String(10);
    name : String(50);
}

entity zcategory 
{
    key ID : UUID;
        game : Association to one zgame;
        category : Association to one zcategorylist;
}

entity zcategorylist
{
    key categoryId : UUID;
        name : String(50);
}

entity zgameplatform
{   
    key ID : UUID;
        game : Association to one zgame;
        platform : Association to one zplatform;
}

entity zplatform
{
    key platformId : UUID;
        name       : String(100);
}

entity zscreenshot
{
    key screenshotId : UUID;
        name : String(50);
        imgUrl : String(1000);
        //Association
        game : Association to one zgame;
}
