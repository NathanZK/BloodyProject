const { Router } = require('express');
const connection = require('../../middleware/db_connection');
const authentication = require('../../middleware/authentication.js');

const router = Router();

router
.get('/admin/profile', authentication.isAdminLoggedIn, ( req, res)=>{
  let sql1 = `SELECT * FROM admin 
            INNER JOIN personal_info
            ON admin.admin_info_ID= personal_info.ID
            WHERE Username = "${req.userData.Username}"`;
  
  
  connection.query(sql1, (error , result) =>{
    res.render("admin/AdminProfile", {user: result });
  });

});

router
.get('/admin/createdonorprofile', authentication.isAdminLoggedIn, ( req, res)=>{
  res.render('DonorProfile',{error: false, created: false});
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

      var ID = Math.floor(Math.random()*1000);

      let sql1 =`INSERT INTO personal_info (ID, Username, Password, Phoneno, City, Subcity, Woreda, HouseNumber)
      VALUES ('${ID}', '${username}','${password}', '${phonenumber}', '${city}', '${subcity}', '${woreda}', '${housenumber}')`;
      
      let sql2 = `INSERT INTO donor (FirstName, LastName, Email, Gender, BDay, donor_info_ID)
      VALUES ('${firstname}','${lastname}', '${email}', '${gender}', '${birthdate}' , ${ID})`;

      let sql3 = `SELECT * FROM donor 
                  INNER JOIN personal_info
                  ON donor.donor_info_ID= personal_info.ID
                  WHERE Username = '${username}'`;

      connection.query(sql1, (error , result) =>{
        console.log(error);
      });
      connection.query(sql2, (error , result) =>{
        console.log(error);
      });
      connection.query(sql3, (error , result) =>{
        res.render("donor/DonorProfile", { created: true,  user: result, admin:true});
      });
      
});



module.exports = router;