using statusoverview.cf.srv.AdminService as service from '../../srv/statusoverview-service';
using from '../../db/statusoverview';

annotate service.StatusOverview with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type      : 'UI.DataField',
                Value      : status_code,
                Criticality: status.criticality,
            },
            {
                $Type: 'UI.DataField',
                Value: component_code,
            },
            {
                $Type: 'UI.DataField',
                Value: comment,
            },
            {
                $Type: 'UI.DataField',
                Value: date,
            },
            {
                $Type: 'UI.DataField',
                Value: time,
            }
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
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
    );
    comment   @(UI.MultiLineText)
};
