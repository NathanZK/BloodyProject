const { Router } = require('express');
const connection = require('../middleware/db_connection');
const authentication = require('../middleware/authentication.js');


const router = Router();

router.get('/home' ,(req , res)=> {
    res.render('guest/guest' );
  });


module.exports = router;