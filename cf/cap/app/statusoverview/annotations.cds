using statusoverview.cf.srv.StatusService as service from '../../srv/statusoverview-service';
using from '../../db/statusoverview';

annotate service.StatusOverview with @(UI.HeaderInfo: {
    TypeName      : 'Component',
    TypeNamePlural: 'Components'
});

annotate service.StatusOverview with @(
    UI.CreateHidden,
    UI.DeleteHidden,
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: component_code,
            },
            {
                $Type                    : 'UI.DataField',
                Value                    : status_code,
                Criticality              : status.criticality,
                CriticalityRepresentation: #WithIcon,
            },
            {
                $Type: 'UI.DataField',
                Value: date,
            },
            {
                $Type: 'UI.DataField',
                Value: time,
            },
            {
                $Type: 'UI.DataField',
                Value: comment,
                @UI.Hidden,
            }
        ],
    },

    UI.FieldGroup #Section       : {Data: [{Value: comment}, ]},

    UI.LineItem                  : [
        {
            $Type             : 'UI.DataField',
            Value             : '',
            Label             : '{i18n>CurrentStatus}',
            Criticality       : status.criticality,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '10rem',
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : component.descr,
            Label             : '{i18n>Component}',
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '15rem',
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : comment,
            Label             : '{i18n>Comments}',
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '40rem',
            },
            @UI.PartOfPreview : true,
            @UI.Importance    : #High,
        },
        {
            $Type             : 'UI.DataField',
            Value             : date,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem',
            },
        },
        {
            $Type             : 'UI.DataField',
            Value             : time,
            @HTML5.CssDefaults: {
                $Type: 'HTML5.CssDefaultsType',
                width: '7rem',
            },
        }
    ],
    UI.SelectionFields           : [
        status_code,
        component_code
    ],
);

annotate service.StatusOverview with {
    status    @(
        Common.Label                   : '{i18n>CurrentStatus}',
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Status',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.Text                    : status.descr,
        Common.Text.@UI.TextArrangement: #TextOnly,
    );
    component @(
        Common.Label                   : '{i18n>Component}',
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Components',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: component_code,
                ValueListProperty: 'code',
            }, ],
        },
        Common.Text                    : component.descr,
        Common.Text.@UI.TextArrangement: #TextOnly,
    );
};

annotate service.StatusOverview with @(UI.Facets: [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    },
    {
        $Type : 'UI.CollectionFacet',
        ID    : 'collectionFacetSection',
        Label : 'Description',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Section',
            ID    : 'SubSectionComment',
            Label : 'Comment',
        }],
    }
]);
