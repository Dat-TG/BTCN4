const initOptions = {/* initialization options */};
const pgp = require('pg-promise')(initOptions);
const connection =require('../configs/cnStr');
const db = pgp(connection);
module.exports={
    pgp,
    db
}