using GameShopService from './service';

annotate GameShopService.Game with {
    description 
        @UI.MultiLineText;

    publisher @(
        Common.Text : publisher.name,
        Common.TextArrangement : #TextOnly,
        Common.ValueList : {
            Label : 'Publisher',
            CollectionPath : 'Publisher',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : publisher_publisherId,
                    ValueListProperty : 'publisherId'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );

    studio @(
        Common.Text : studio.name,
        Common.TextArrangement : #TextOnly,
        Common.ValueList : {
            Label : 'Studio',
            CollectionPath : 'Studio',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : studio_studioId,
                    ValueListProperty : 'studioId'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );

    agerating @(
        Common.Text : agerating.name,
        Common.TextArrangement : #TextOnly,
        Common.ValueList : {
            Label : 'Age Rating',
            CollectionPath : 'AgeRating',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : agerating_code,
                    ValueListProperty : 'code'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );

}
annotate GameShopService.Game with @(
    UI.HeaderInfo : {
        TypeName       : 'Game',
        TypeNamePlural : 'Games',
        Title : {
            Value : title
        }
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : gameId,
            Label : 'Game ID'
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'Title'
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock'
        },
        {
            $Type : 'UI.DataField',
            Value : stockStatus,
            Label : 'Stock Status'
        }
    ],
    UI.Facets : [ 
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Game Details',
            Target : '@UI.FieldGroup#GameDetails'
        }, 
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Associated Entity',
            Target : '@UI.FieldGroup#AssociatedEntity'
        }, 
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Game Platforms',
            Target : 'gameplatforms/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Categories',
            Target : 'categories/@UI.LineItem'
        },                    
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Screenshots',
            Target : 'screenshots/@UI.LineItem'
        },          
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Customer Reviews',
            Target : 'reviews/@UI.LineItem'
        }
    ],
    UI.FieldGroup #GameDetails: {
        Data : [
             { $Type: 'UI.DataField', Value: gameId,      Label: 'Game ID' },
             { $Type: 'UI.DataField', Value: title,       Label: 'Title' },
             { $Type: 'UI.DataField', Value: releaseDate, Label: 'Release Date' },
             { $Type: 'UI.DataField', Value: price,       Label: 'Price' },
             { $Type: 'UI.DataField', Value: rating,      Label: 'Rating' },
             { $Type: 'UI.DataField', Value: stock,       Label: 'Stock' },
             { $Type: 'UI.DataField', Value: stockStatus, Label: 'Stock Status' },
             { $Type: 'UI.DataField', Value: imgUrl,      Label: 'Image URL' },
             { $Type: 'UI.DataField', Value: description, Label: 'Description' }
        ]
    },
    UI.FieldGroup #AssociatedEntity: {
        Data : [
             { $Type: 'UI.DataField', Value: publisher_publisherId, Label: 'Publisher' },
             { $Type: 'UI.DataField', Value: studio_studioId, Label: 'Studio' },
             { $Type: 'UI.DataField', Value: agerating_code,   Label: 'Age Rating' }
        ]
    }
    
);

annotate GameShopService.ReviewView with {
    comment 
        @UI.MultiLineText;
}
annotate GameShopService.ReviewView with @(
    UI.HeaderInfo : {
        TypeName       : 'Review',
        TypeNamePlural : 'Reviews',
        Title : {
            Value : name
        },
        Description: {
            Value : game.title
        }
    }, 
    UI.Facets : [ 
        {
            
            $Type : 'UI.CollectionFacet',
            Label : 'Comment Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Info',
                    Target : '@UI.FieldGroup#Comment1'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Comment',
                    Target : '@UI.FieldGroup#Comment2'
                }
            ]
        }
    ],       
    UI.LineItem : [ {

            $Type : 'UI.DataField',
            Value : game_gameId,
            Label : 'Game ID',
        },       
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'User'
        },        
        {
            $Type : 'UI.DataField',
            Value : rate,
            Label : 'Review Rate'
        },        
        {
            $Type : 'UI.DataField',
            Value : comment,
            Label : 'Comment'
        },        
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : 'Date'
        }
    ],
    UI.FieldGroup #Comment1: {
        Data : [
             { $Type: 'UI.DataField', Value: reviewId,    Label: 'Review ID' },
             { $Type: 'UI.DataField', Value: name,        Label: 'Name' },
             { $Type: 'UI.DataField', Value: rate,        Label: 'Rate' },
        ]
    },
    UI.FieldGroup #Comment2: {
        Data : [
             { $Type: 'UI.DataField', Value: createdAt,   Label: 'Created At' },
             { $Type: 'UI.DataField', Value: comment,     Label: 'Comment' }
        ]
    }    

);

annotate GameShopService.Review with {
    comment 
        @UI.MultiLineText;
}
annotate GameShopService.Review with @(
    UI.HeaderInfo : {
        TypeName       : 'Review',
        TypeNamePlural : 'Reviews',
        Title : {
            Value : name
        },
        Description: {
            Value : game.title
        }
    }, 
    UI.Facets : [ 
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Comment Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Keys',
                    Target : '@UI.FieldGroup#Keys'                    
                },                
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Details',
                    Target : '@UI.FieldGroup#Details'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Comment',
                    Target : '@UI.FieldGroup#Comment'                    
                }
            ]
        }
    ],             
    UI.LineItem : [ 
        {

            $Type : 'UI.DataField',
            Value : game_gameId,
            Label : 'Game ID'
        }, 
        {

            $Type : 'UI.DataField',
            Value : reviewId,
            Label : 'Review ID'
        },               
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'User'
        },        
        {
            $Type : 'UI.DataField',
            Value : rate,
            Label : 'Review Rate'
        },        
        {
            $Type : 'UI.DataField',
            Value : comment,
            Label : 'Comment'
        },        
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            Label : 'Date'
        }
    ],
    UI.FieldGroup #Keys: {
        Data : [
             { $Type: 'UI.DataField', Value: reviewId,    Label: 'Review ID' },
        ]
    },    
    UI.FieldGroup #Details: {
        Data : [
             { $Type: 'UI.DataField', Value: name,        Label: 'Name' },
             { $Type: 'UI.DataField', Value: rate,        Label: 'Rate' },
             { $Type: 'UI.DataField', Value: comment,     Label: 'Comment' },
             { $Type: 'UI.DataField', Value: createdAt,   Label: 'Created At' }
        ]
    },
    UI.FieldGroup #Comment: {
        Data : [
             { $Type: 'UI.DataField', Value: comment,     Label: 'Comment' }
        ]
    }
);

annotate GameShopService.Publisher with {

}
annotate GameShopService.Publisher with @(
    UI.HeaderInfo : {
        TypeName       : 'Publisher',
        TypeNamePlural : 'Publishers',
        Title : {
            Value : name
        }
    },       
    UI.Facets : [ 
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Comment',
            Target : '@UI.FieldGroup#PublisherDetails'
        }
    ],       
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : publisherId,
            Label : 'Publisher ID'
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Publisher'
        },
        {
            $Type : 'UI.DataField',
            Value : country,
            Label : 'Country'
        }
    ],
    UI.FieldGroup #PublisherDetails: {
        Data : [
             { $Type: 'UI.DataField', Value: publisherId,   Label: 'Publisher ID' },
             { $Type: 'UI.DataField', Value: name,          Label: 'Name' },
             { $Type: 'UI.DataField', Value: country,       Label: 'Country' }
        ]
    }
);

annotate GameShopService.Studio with {
    
}
annotate GameShopService.Studio with @(
    UI.HeaderInfo : {
        TypeName       : 'Studio',
        TypeNamePlural : 'Studios',
        Title : {
            Value : name
        }
    },       
    UI.Facets : [ 
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Studio Details',
            Target : '@UI.FieldGroup#StudioDetails'
        }
    ],    
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : studioId,
            Label : 'Studio ID'
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Publisher'
        },
        {
            $Type : 'UI.DataField',
            Value : country,
            Label : 'Country'
        }
    ],
    UI.FieldGroup #StudioDetails: {
        Data : [
             { $Type: 'UI.DataField', Value: studioId,   Label: 'Studio ID' },
             { $Type: 'UI.DataField', Value: name,       Label: 'Name' },
             { $Type: 'UI.DataField', Value: country,    Label: 'Country' }
        ]
    }
    
);

annotate GameShopService.AgeRating with {

}
annotate GameShopService.AgeRating with @(
    UI.HeaderInfo : {
        TypeName       : 'Age Rating',
        TypeNamePlural : 'Age Ratings',
        Title : {
            Value : name
        }
    },      
    UI.Facets : [ 
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Age Rating',
            Target : '@UI.FieldGroup#AgeRating'
        }
    ],    
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : code,
            Label : 'Code'
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name'
        }
    ],   
    UI.FieldGroup #StudioDetails: {
        Data : [
             { $Type: 'UI.DataField', Value: code, Label: 'Code' },
             { $Type: 'UI.DataField', Value: name, Label: 'Name' }
        ]
    }
);

annotate GameShopService.GamePlatform with {
    platform @(
        Common.Text : platform.name,
        Common.TextArrangement : #TextOnly,
        Common.ValueList : {
            Label : 'Platform',
            CollectionPath : 'Platform',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : platform_platformId,
                    ValueListProperty : 'platformId'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );
    
};
annotate GameShopService.GamePlatform with @(
    UI.HeaderInfo : {
        TypeName       : 'Game Platform',
        TypeNamePlural : 'Game Platforms',
        Title : {
            Value : name
        }
    },      
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : platform.name,
            Label : 'Platform Name'
        },       
    ],
    UI.FieldGroup #General : {
        Data : [
            { $Type : 'UI.DataField',  Value : platform_platformId, Label : 'Platform'}
            // { $Type : 'UI.DataField',  Value : platform.name, Label : 'Platform'}
        ]
    }
);

annotate GameShopService.Platform with @(
    UI.HeaderInfo : {
        TypeName       : 'Platform',
        TypeNamePlural : 'Platform List',
        Title : {
            Value : name
        }
    },      
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Platform Name'
        }
    ],
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        }
    ],  
    UI.FieldGroup #General : {
        Data : [
            { $Type : 'UI.DataField',  Value : platformId, Label : 'Platform ID'},
            { $Type : 'UI.DataField',  Value : name, Label : 'Platform Name'}
        ]
    }      
);

annotate GameShopService.Category with {
    category @(
        Common.Text : category.name,
        Common.TextArrangement : #TextOnly,
        Common.ValueList : {
            Label : 'Category',
            CollectionPath : 'CategoryList',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : category_categoryId,
                    ValueListProperty : 'categoryId'
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                }
            ]
        }
    );    
}

annotate GameShopService.Category with @(
    UI.HeaderInfo : {
        TypeName       : 'Game Category',
        TypeNamePlural : 'Game Categories',
        Title : {
            Value : name
        }
    },      
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : category.name,
            Label : 'Category Name'
        },       
    ],
    UI.FieldGroup #General : {
        Data : [
            { $Type : 'UI.DataField',  Value : category_categoryId, Label : 'Category Id'}
            // { $Type : 'UI.DataField',  Value : category.name, Label : 'Category Name'}
        ]
    }
);

annotate GameShopService.CategoryList with @(
    UI.HeaderInfo : {
        TypeName       : 'Category',
        TypeNamePlural : 'Categories',
        Title : {
            Value : name
        }
    },      
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Category Name'
        }
    ],
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        }
    ],  
    UI.FieldGroup #General : {
        Data : [
            { $Type : 'UI.DataField',  Value : categoryId, Label : 'Category ID'},
            { $Type : 'UI.DataField',  Value : name, Label : 'Category Name'}
        ]
    }      
);


annotate GameShopService.Screenshot with @(
    UI.HeaderInfo : {
        TypeName       : 'Screenshot',
        TypeNamePlural : 'Screenshots',
        Title : {
            Value : name
        }
    },    
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#General'
        }
    ],      
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : screenshotId,
            Label : 'Screenshot ID'
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Image Name'
        },
        {
            $Type : 'UI.DataField',
            Value : imgUrl,
            Label : 'Image URL'
        }
    ],  
    UI.FieldGroup #General : {
        Data : [
            { $Type : 'UI.DataField',  Value : screenshotId, Label : 'Screenshot ID'},
            { $Type : 'UI.DataField',  Value : name, Label : 'Image Name'},
            { $Type : 'UI.DataField',  Value : imgUrl, Label : 'Image URl'}
        ]
    }   
)
