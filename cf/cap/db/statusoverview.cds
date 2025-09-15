using {
    // cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

namespace statusoverview.cf.db;

/**
* Status overview created by employees
*/
entity StatusOverview : managed {
    key component : Association to Components         @(title: 'Component');
        position  : Int32; // internal
        status    : Association to Status default 'S' @(title: 'Status');
        comment   : String                            @(title: 'Comment')  @UI.MultiLineText;
        date      : Date                              @(title: 'Date');
        time      : Time                              @(title: 'Time');
}

entity Components : CodeList {
    key code : String @(
            Common.Text           : name,
            Common.TextArrangement: #TextOnly
        ) enum {
            General = 'General';
            F1 = 'F1';
            F2 = 'F2';
            F3 = 'F3';
            F4 = 'F4';
            F5 = 'F5';
            F6 = 'F6';
            S1 = 'S1';
            S2 = 'S2'
        }
}

entity Status : CodeList {
    key code        : String @(
            Common.Text           : name,
            Common.TextArrangement: #TextOnly,
        ) enum {
            error = 'E';
            warning = 'W';
            success = 'S';

        };
        criticality : Integer;
}
