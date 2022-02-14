const { Router } = require('express');
const db = require('../middleware/db_connection');
const authentication = require('../middleware/authentication.js');


const router = Router();

// Donor Profile
router
.get('/donor/profile', authentication.isDonorLoggedIn, ( req, res)=>{

  let sql =  `SELECT FirstName, LastName, Gender, Bday, Blood_type, RhesusFactor, Date_Donated, 
              Donation_Location, Amount, Duration, COUNT(donation_history.ID) AS Total
              FROM donor 
              INNER JOIN personal_info
              ON donor.donor_info_ID= personal_info.Username
              INNER JOIN appointment
              ON donor.donor_info_ID = appointment.donor_username
              INNER JOIN static_health_info
              ON donor.donor_info_ID = static_health_info.donorUsername
              INNER JOIN donor_health
              ON donor.donor_info_ID = donor_health.donor_ID
			        INNER JOIN donation_history
              ON donor_health.donation_history_ID = donation_history.ID
              INNER JOIN inventory
              ON donor_health.inventory_ID = inventory.BloodBagNo
              WHERE Username = "${req.userData.Username}"`;
  
 db.query(sql, (error , result) =>{
    res.render("donor/donor", { created: true,  user: result , admin:false, access: false});
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