const jwt = require("jsonwebtoken");

module.exports = {
    isAdminLoggedIn: (req, res, next) => {
        try {
          const token = req.cookies.jwt;
          const decoded = jwt.verify(
            token,
            'SECRETADMIN'
          );
          req.userData = decoded;
          next();
        } catch (err) {
          return res.redirect('/login');
        }
      } ,
      isDonorLoggedIn: (req, res, next) => {
        try {
          const tokenn = req.cookies.jwt;
          const decodedd = jwt.verify(
            tokenn,
            'SECRETDONOR'
          );
          req.userData = decodedd;
          next();
        } catch (err) {
          return res.redirect('/login');
        }
      } ,
      
}

