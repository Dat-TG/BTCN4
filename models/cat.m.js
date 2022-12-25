const {pgp, db}=require('../models/db.m');
module.exports={
    getAll: async()=>{
        const rs=await db.any('SELECT * FROM "Categories" ORDER BY "CategoryID"');
        return rs;
    },
    getByID: async(CategoryID)=> {
        const rs=db.any('SELECT * FROM "Categories" WHERE "CategoryID"=$1', [CategoryID]);
        return rs;
    },
    add: async(CategoryName)=>{
        var CategoryID=await db.one('SELECT MAX("CategoryID") FROM "Categories"');
        CategoryID=CategoryID.max+1;
        const rs=await db.one('INSERT INTO "Categories"("CategoryID","CategoryName") VALUES($1, $2) RETURNING *', [CategoryID, CategoryName]);
        return rs;
    },
    delete: async(CategoryID) => {
        const rs=await db.any('DELETE FROM "Categories" WHERE "CategoryID"=$1', [CategoryID]);
        return rs;
    },
    update: async(CategoryID, CategoryName) => {
        const rs=await db.none('UPDATE "Categories" SET "CategoryName"=$1 WHERE "CategoryID"=$2', [CategoryName, CategoryID]);
        return rs;
    }
}