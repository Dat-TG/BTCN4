const {pgp, db}=require('../models/db.m');
module.exports={
    getAll: async()=>{
        const rs=await db.any('SELECT * FROM "Users"');
        return rs;
    },
    getByUsername: async(data)=> {
        const rs=db.any('SELECT * FROM "Users" WHERE "Username"=$1', [data]);
        return rs;
    },
    add: async(data)=>{
        var ID=await db.one('SELECT MAX("UserID") FROM "Users"');
        const rs=await db.any('INSERT INTO "Users"("UserID","Username","Password","FullName","Token","Address") VALUES($1, $2, $3, $4, $5, $6) RETURNING *', [ID.max+1,data.Username, data.Password, data.FullName, data.Token, data.Address]);
        return rs;
    },
}