using {statusoverview.cf.db as db} from '../db/statusoverview';

namespace statusoverview.cf.srv;

service StatusOverviewService {
    entity StatusOverview as projection on db.StatusOverview;
}

service AdminService {
    entity StatusOverview as projection on db.StatusOverview;
}
