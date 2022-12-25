const userM = require("../models/user.m");
const jwt = require('jsonwebtoken');
require('dotenv').config();
exports.getLogin = async (req, res, next) => {
    try {
        res.send('login');
    } catch (err) {
        next(err);
    }
}
exports.postLogin = async (req, res, next) => {
    try {
        const token = jwt.sign(req.body, process.env.ACCESS_TOKEN_SECRET,function(err, token) {
            if (err) {
                console.log(err);
                next(err);
            } else {
                res.json({ token: token });
            }});
    } catch (err) {
        next(err);
    }
};