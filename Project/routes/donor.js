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