using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

namespace statusoverview.cf.db;

/**
* Status overview created by employees
*/
entity StatusOverview : cuid, managed {
    status    : Association to Status default 'S';
    component : String @title: 'Component';
    comment   : Composition of one {
                    key ID        : UUID;
                        comment   : String;
                        createdAt : type of managed : createdAt;
                        createdBy : type of managed : createdBy;
                }
}

entity Status : CodeList {
    key code        : String enum {
            error = 'Error';
            warning = 'Warning';
            success = 'Success';

        };
        criticality : Integer;
}
