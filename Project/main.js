const cookieParser = require('cookie-parser'); 
const express = require('express');

const app = express();

app.set('view engine' ,  'ejs');
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static('public'));

const port = 3000; //Port used

//Routes to be imported
const authRoutes = require('./routes/authRoutes');

const admin = require('./routes/admin');
const donor = require('./routes/donor');
const guest = require('./routes/guest');

//Routes
app.use(authRoutes);

app.use(admin);
app.use(donor);
app.use(guest);


app.listen(port , ()=>console.log("Server running on port ", port));