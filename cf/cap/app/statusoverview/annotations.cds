using statusoverview.cf.srv.StatusOverviewService as service from '../../srv/statusoverview-service';
using from '../../db/statusoverview';

annotate service.StatusOverview with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'status_code',
                Value : status_code,
            },
            {
                $Type : 'UI.DataField',
                Value : component,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : status.descr,
            Label : '{i18n>CurrentStatus}',
            Criticality : status.criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : component,
        },
        {
            $Type : 'UI.DataField',
            Value : comment.comment,
            Label : '{i18n>Comments}',
        },
        {
            $Type : 'UI.DataField',
            Value : comment.createdAt,
            Label : '{i18n>Date}',
        },
    ],
    UI.SelectionFields : [
        status_code,
    ],
);

annotate service.StatusOverview with {
    status @(
        Common.Label : '{i18n>CurrentStatus}',
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Status',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
            ],
        },
        )
};

annotate service.Status with {
    descr @Common.Text : code
};

