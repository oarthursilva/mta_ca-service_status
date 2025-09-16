using {statusoverview.cf.db as db} from '../db/statusoverview';

namespace statusoverview.cf.srv;

service StatusService @(requires: 'authenticated-user') {
    @readonly
    entity StatusOverview as projection on db.StatusOverview
                             order by
                                 position;

    annotate StatusOverview with @(
        require    : 'user',
        odata.draft: {
            enabled: false,
            bypass : false
        }
    );
}

service AdminService {

    entity StatusOverview as projection on db.StatusOverview
                             order by
                                 position;

    annotate StatusOverview with @(
        require    : 'admin',
        odata.draft: {
            enabled,
            bypass
        }
    );
}
