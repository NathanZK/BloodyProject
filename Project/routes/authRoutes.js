const { Router } = require('express');
const connection = require('../middleware/db_connection');
const authentication = require('../middleware/authentication.js');
const jwt = require('jsonwebtoken');

const router = Router();

//Login page - get request
router.get('/login' , (req , res)=> {
    res.render('login' , {error: false });
});


//Login page - post request
router.post('/login' , (req , res) => { 
 
let pass = false;
let sql1 = `SELECT * FROM admin 
            INNER JOIN personal_info
            ON admin.admin_info_ID= personal_info.ID
            WHERE Username = "${req.body.username}" and Password = "${req.body.password}" `;

let sql2 = `SELECT * FROM donor 
            INNER JOIN personal_info
            ON donor.donor_info_ID= personal_info.ID
            WHERE Username = "${req.body.username}" and Password = "${req.body.password}" `;
 
  connection.query(sql1 , (error , result) => {
      if (result !==undefined && result.length > 0 ) {
          const token = jwt.sign({
              FullName: result[0].FullName,
              Username: result[0].Username
            },
            'SECRETADMIN', {
              expiresIn: '7d'
            });
            
            pass=true;
            res.cookie('jwt' , token , {httpOnly:true , maxAge:3600*1000});
            res.redirect('/Admin_home')
             
      } 
      else {

        connection.query(sql2 , (error , result) => {
          if (result !==undefined && result.length > 0 ) {
              const token = jwt.sign({
                  FullName: result[0].FirstName +" "+ result[0].LastName,
                  Username: result[0].Username
                },
                'SECRETDONOR', {
                  expiresIn: '7d'
                });
                
                pass=true;
                res.cookie('jwt' , token , {httpOnly:true , maxAge:3600*1000});
                res.redirect('/donor/profile')
      
                 
          } 
          if (!pass){
            res.render('login' , {error:true });
           }
          
       });


      }
     
      
      
   }); 
  
 
     
});

//Example pages
router.get('/Admin_home' , authentication.isAdminLoggedIn ,(req , res)=> {
  res.render('admin_home' , { user : req.userData });
});

// router.get('/Donor_home' , authentication.isDonorLoggedIn ,(req , res)=> {
//   res.render('donor_home' , { user : req.userData });
// });


module.exports = router;





