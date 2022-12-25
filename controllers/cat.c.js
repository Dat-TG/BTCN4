const catM = require('../models/cat.m');
const path = require('path');
const fs = require('fs');
exports.render = async (req, res, next) => {
    try {
        var CatID = req.params.CatID;
        var CatName = "";
        const rs = await catM.getAll();
        var clist = rs.map((item) => {
            if (CatName == "" && item.CatID == CatID) {
                CatName = item.CatName;
            }
            return { CatID: item.CatID, CatName: item.CatName }
        });
        res.render('home', { clist: clist, plist: p3list, CatName: CatName, btn_display: "inline", CatID: CatID });
    } catch (err) {
        console.log(err);
        next(err);
    }
}
exports.delete = async (req, res, next) => {
    try {
        var CatID = req.params.CatID;
        catM.delete(CatID).then(() => {
            setTimeout(function () {
                res.redirect('/');
            }, 3000);
        });
    }
    catch (err) {
        next(err);
    }
}
exports.edit = async (req, res, next) => {
    try {
        var CatID = req.params.CatID;
        var CatName = req.body.CatName;
        catM.update(CatID, CatName).then(() => {
            setTimeout(function () {
                res.redirect('/Categories/' + CatID);
            }, 3000);
        });
    }
    catch (err) {
        next(err);
    }
}