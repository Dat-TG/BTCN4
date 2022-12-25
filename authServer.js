require('dotenv').config();
const express=require('express');
const app=express();
const port=process.env.PORT_AUTH || 3113;
app.use('/', async(req, res, next) => {
    res.send('home auth');
});
app.listen(port, () => {
    console.log(`Auth server is runnig on port ${port}`);
})