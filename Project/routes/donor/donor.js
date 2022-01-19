const { Router } = require('express');
const connection = require('../../middleware/db_connection');
const authentication = require('../../middleware/authentication.js');


const router = Router();

router
.get('/donor/profile', authentication.isDonorLoggedIn, ( req, res)=>{
  let sql3 = `SELECT * FROM donor 
  INNER JOIN personal_info
  ON donor.donor_info_ID= personal_info.ID
  WHERE Username = "${req.userData.Username}"`;
  
  connection.query(sql3, (error , result) =>{
    res.render("donor/DonorProfile", { created: true,  user: result , admin:false});
  });

});


module.exports = router;