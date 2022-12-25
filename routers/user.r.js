const app=require('express');
const router=app.Router();
const UserC=require('../controllers/user.c');
router.get('/login',UserC.getLogin);
router.post('/login',UserC.postLogin);
module.exports=router;