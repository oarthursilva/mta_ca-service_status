using {statusoverview.cf.db as db} from '../db/statusoverview';

namespace statusoverview.cf.srv;

service StatusService {
    @readonly
    entity StatusOverview as projection on db.StatusOverview;
}

annotate StatusService with @(require: 'admin');

service AdminService {
    entity StatusOverview as projection on db.StatusOverview;
}

annotate AdminService with @(require: 'admin');
