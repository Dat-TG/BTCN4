require('dotenv').config();
const bcrypt=require('bcrypt');
const saltRounds=parseInt(process.env.SALT_ROUND);
const https = require('https');
const fs = require('fs');
const express = require('express');
const userM = require('./models/user.m');
const port = process.env.PORT_AUTH || 3113;
const app = express();

const options = {
    key: fs.readFileSync('./certificates/key.pem'),
    cert: fs.readFileSync('./certificates/cert.pem')
};
https.createServer(options, async (req, res) => {
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:20454');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    const url = req.url;
    console.log(req.method);
    if (req.method=="GET") {
        res.end('nothing');
    }
    if (req.method=="POST") {
        var body = "";
        req.on("data", function (chunk) {
            body += chunk;
        });

        req.on("end", function(){
            var user=queryStringToJSON(body);
            var pw=user.Password;
            bcrypt.hash(pw, saltRounds).then(async function(hash) {
                user.Password=hash;
                userM.getByUsername(user.Username).then(async(rs)=>{
                    if (rs.length==0) {
                        await userM.add(user);
                    }
                });
            });
            console.log(user);
            res.writeHead(302, {'Location': 'http://localhost:20454/user/login'});
            res.end();
        });
    }
}).listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

function queryStringToJSON(qs) {
    qs = qs || location.search.slice(1);

    var pairs = qs.split('&');
    var result = {};
    pairs.forEach(function(p) {
        var pair = p.split('=');
        var key = pair[0];
        var value = decodeURIComponent(pair[1] || '');
        value=value.replaceAll('+',' ');

        if( result[key] ) {
            if( Object.prototype.toString.call( result[key] ) === '[object Array]' ) {
                result[key].push( value );
            } else {
                result[key] = [ result[key], value ];
            }
        } else {
            result[key] = value;
        }
    });

    return JSON.parse(JSON.stringify(result));
};