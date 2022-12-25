require('dotenv').config();
const hbs = require('express-handlebars');
const express = require('express');
const { urlencoded } = require('express');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash');
const cookieParser = require('cookie-parser');
const app = express();
const port = process.env.PORT || 20454;
const passport = require('passport');
const bodyParser = require('body-parser');
const cors = require('cors');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());

//Router and model
const UserRouter = require('./routers/user.r');
const catM=require('./models/cat.m');

//Use static resources
app.use(express.static(path.join(__dirname, '/public')));

app.use(express.urlencoded({
    extended: true
}))

app.use(express.json());

//Use Session 
app.set('trust proxy', 1) // trust first proxy
app.use(session({
    secret: process.env.SECRET,
    resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 30 * 24 * 60 * 60 * 1000 },
}))

//require('./config/passport')(app);

app.use(flash());
//Template engine
app.engine('hbs', hbs.engine({
    extname: 'hbs',
    defaultLayout: 'main',
    layoutsDir: path.join(__dirname, '/views/layouts'),
    partialsDir: [
        path.join(__dirname, '/views/partials')
    ]
}));
app.set('view engine', 'hbs')
app.set('views', path.join(__dirname, '/views'))

app.use('/user', UserRouter);
app.use('/', async (req, res, next) => {
    const rs = await catM.getAll();
    var clist = rs.map((item) => {
        return { CatID: item.CategoryID, CatName: item.CategoryName }
    });
    res.render('home',{clist:clist});
});

app.use((err, req, res, next) => {
    const statusCode = err.statusCode | 500;
    console.log(err.message);
    res.status(statusCode).send(err.message);
})


app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
})
