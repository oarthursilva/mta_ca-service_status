using {statusoverview.cf.db as db} from '../db/statusoverview';

namespace statusoverview.cf.srv;

service StatusService @(requires: 'authenticated-user') {
    @readonly
    entity StatusOverview as projection on db.StatusOverview;

    annotate StatusService with @(require: 'user');
}

service AdminService {
    entity StatusOverview as projection on db.StatusOverview;

    annotate AdminService with @(require: 'admin');
}