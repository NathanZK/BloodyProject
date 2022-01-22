const { Router } = require('express');
const db = require('../middleware/db_connection');
const authentication = require('../middleware/authentication.js');


const router = Router();

// Donor Profile
router
.get('/donor/profile', authentication.isDonorLoggedIn, ( req, res)=>{
  let sql3 = `SELECT * FROM donor 
  INNER JOIN personal_info
  ON donor.donor_info_ID= personal_info.Username
  WHERE Username = "${req.userData.Username}"`;

 db.query(sql3, (error , result) =>{
    res.render("donor/DonorProfile", { created: true,  user: result , admin:false, access: false});
  });

});
//View blood test results
router.get('/donor/result' , authentication.isDonorLoggedIn ,(req , res)=> {
 let sql = `SELECT * FROM donor 
            INNER JOIN donor_health 
            ON donor.donor_info_ID = donor_health.donor_ID
            INNER JOIN test_result
            ON donor_health.test_result_ID = test_result.Testtube_No
            WHERE donor_info_ID= "${req.userData.Username}"
            ORDER BY Date_Tested DESC`;
 


 db.query(sql, (error , result) =>{
 
  res.render('donor/results', {user:result});
  });

  
});

//Change Password
router.get('/donor/changepassword' , authentication.isDonorLoggedIn ,(req , res)=> {
  res.render('changepassword', {admin:false, donor:true});
});

router.post('/donor/changepassword' , authentication.isDonorLoggedIn ,(req , res)=> {
  
   var oldpassword = req.body.oldpassword;
   var newpassword = req.body.newpassword;
   var username = req.userData.Username;

  let sql = `UPDATE personal_info SET Password = "${newpassword}" 
            WHERE Username = "${req.userData.Username}" AND Password="${oldpassword}"`;


 db.query(sql, (error, result) => {
   if (error) throw err;
   res.redirect('/donor/profile' );
    
  });

 
});
module.exports = router;