// app imports  
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
const cors = require('cors')
const router = express.Router({});
require('dotenv/config')

const PORT = process.env.PORT || 8080;

//Middleware
app.use(bodyParser.json())
app.use(cors())

//routes
const health = require('./routes/health')

//routes
app.use('/health',health)
//server start
app.listen(PORT, () =>{
    console.log('server is at', PORT);
});