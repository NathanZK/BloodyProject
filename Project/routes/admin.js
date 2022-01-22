const { Router } = require('express');
const db = require('../middleware/db_connection');
const authentication = require('../middleware/authentication.js');

const router = Router();

//Admin Home
router.get('/admin/home' , authentication.isAdminLoggedIn ,(req , res)=> {
  res.render('admin_home' , { user : req.userData });
});


// Admin Profile
router
.get('/admin/profile', authentication.isAdminLoggedIn, ( req, res)=>{
  let sql1 = `SELECT * FROM admin 
            INNER JOIN personal_info
            ON admin.admin_info_ID= personal_info.Username
            WHERE Username = "${req.userData.Username}"`;
  
  
 db.query(sql1, (error , result) =>{
    res.render("admin/AdminProfile", {user: result });
  });

});

//Create Donor profile
router
.get('/admin/createdonorprofile', authentication.isAdminLoggedIn, ( req, res)=>{
  res.render('donor/DonorProfile',{error: false, created: false, access: false});
});

router.post("/admin/createdonorprofile",authentication.isAdminLoggedIn,(req, res) => {
    // assigning the create donor from inputs from front end to variables 
      var firstname = req.body.firstname;
      var lastname = req.body.lastname;
      var gender = req.body.gender;
      var birthdate = req.body.birthdate;
      var phonenumber = req.body.phonenumber;
      var email = req.body.email;
      var city = req.body.city;
      var subcity = req.body.subcity;
      var woreda = req.body.woreda;
      var housenumber = req.body.housenumber;

      var username = firstname.slice(0,3)+ lastname.slice(0,3);
      var password = Math.random().toString(36).substring(2,7);

    
      let sql1 =`INSERT INTO personal_info (Username, Password, Phoneno, City, Subcity, Woreda, HouseNumber)
      VALUES ('${username}','${password}', '${phonenumber}', '${city}', '${subcity}', '${woreda}', '${housenumber}')`;
      
      let sql2 = `INSERT INTO donor (FirstName, LastName, Email, Gender, BDay, donor_info_ID)
      VALUES ('${firstname}','${lastname}', '${email}', '${gender}', '${birthdate}' , '${username}')`;

      let sql3 = `SELECT * FROM donor 
                  INNER JOIN personal_info
                  ON donor.donor_info_ID= personal_info.Username
                  WHERE Username = '${username}'`;

     db.query(sql1, (error , result) =>{
        console.log(error);
      });
     db.query(sql2, (error , result) =>{
        console.log(error);
      });
     db.query(sql3, (error , result) =>{
        res.render("donor/DonorProfile", { created: true,  user: result , admin:true, access: false});
      });
      
});

//Access Donor Profile

router
.get('/admin/accessdonorprofile', authentication.isAdminLoggedIn, ( req, res)=>{
  res.render('donor/DonorProfile',{error: false, created: false, access: true});
});

router
.post('/admin/accessdonorprofile', authentication.isAdminLoggedIn, ( req, res)=>{
  
  var username = req.body.username;
  
  let sql = `SELECT * FROM donor 
             INNER JOIN personal_info
             ON donor.donor_info_ID= personal_info.Username
             WHERE Username = '${username}'`;
  
 db.query(sql, (error , result) =>{
    res.render("donor/DonorProfile", { created: true,  user: result , admin:false, access: false});
  });

});

//Change Password
router.get('/admin/changepassword' , authentication.isAdminLoggedIn ,(req , res)=> {
  res.render('changepassword', {admin:true, donor:false});
});

router.post('/admin/changepassword' , authentication.isAdminLoggedIn ,(req , res)=> {
  
   var oldpassword = req.body.oldpassword;
   var newpassword = req.body.newpassword;
   var username = req.userData.Username;

  let sql = `UPDATE personal_info SET Password = "${newpassword}" 
            WHERE Username = "${req.userData.Username}" AND Password="${oldpassword}"`;


 db.query(sql, (error, result) => {
   if (error) throw err;
   res.redirect('/admin/home');
    
  });

 
});



module.exports = router;