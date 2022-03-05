// app imports  
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const mongoose = require('mongoose')
const cors = require('cors')
const router = express.Router({});
require('dotenv/config')

const PORT = process.env.PORT || 8080;

//Middleware
app.use(bodyParser.json())
app.use(cors())

//routes
const health = require('./routes/health')
const secure_note = require('./routes/secure_notes')

//routes
app.use('/health',health)
app.use('/secure-notes',secure_note)

//connecting to the database
mongoose.connect(
    process.env.DB_CONNECTION,
    {useNewUrlParser: true , useUnifiedTopology:true},
    () =>{
        
        console.log("connected to the database")
    }
)

//server start
app.listen(PORT, () =>{
    console.log('server is at', PORT);
});