const router = require('express').Router();

//importing the model file
const SecPwd = require('../models/SecurePassword');


//get all password entries for a user
router.get('/get-pwd/:id', async (req,res) =>{
    
    try {
        const pwds = await SecPwd.find({user_id : req.params.id})
        console.log(pwds);

        res.status(200).send(pwds)
    } catch (error) {
        res.status(500).send(error)
    }

});


//add a new pwd
router.post('/add-pwd', async (req, res, _next) => {

    try{
        const data = await SecPwd.create({
            website : req.body.website,
            username : req.body.username,
            password : req.body.password,
            addedDate: new Date(),
            user : req.body.user,
        })

        res.json({status:200, message:'Password Protection successful!!'})
        console.log(data)
    }
    catch(err){
        console.log(err);
    }
});

module.exports = router;