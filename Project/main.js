const cookieParser = require('cookie-parser'); 
const express = require('express');

const authentication = require('./middleware/authentication.js');
const connection = require('./middleware/db_connection');

const app = express();

app.set('view engine' ,  'ejs');
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static('public'));

const port = 3000; //Port used

//Routes to be imported
const authRoutes = require('./routes/authRoutes');

const admin = require('./routes/admin/admin');
const donor = require('./routes/donor/donor');

//Routes
app.use(authRoutes);

app.use(admin);
app.use(donor);


app.listen(port , ()=>console.log("Server running on port ", port));




