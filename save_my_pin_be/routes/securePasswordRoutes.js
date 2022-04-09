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


//delete pwd
router.delete('/delete/:id', async (req, res, _next) => {
    try{
        var pwdId = req.params.id

        let isDeleted = await SecPwd.deleteOne({_id: pwdId})

        if(isDeleted){
            console.log(isDeleted);
            res.status(200).json({"message" : "item deleted"})
        }
    }catch (err){
        res.status(500).send(err.toString())
    }
})

//edit pwd
router.put('/edit/:id', async (req, res, _next) => {
    try{
        const pwdId = req.params.id;
        let updatePwd;
    
        let username = req.body.username;
    
        updatePwd = {
            website : req.body.website,
            username : req.body.username,
            password : req.body.password,
            addedDate: new Date(),
        };
    
        await SecPwd.findByIdAndUpdate(pwdId, updatePwd).then(() => {
          res.json({ status: 200, message: "Password updated", pwd: pwdId });
        });
      }
      catch(e){
        res.json({ status: 200, error: e });
      }
});

//search
router.get('/search/:txt', async (_req, res, _next) => {
    // const index = Item.createIndex( { itemTitle: "text", description: "text" } )
    const data = await Item.find({$text:{$search: _req.params.txt}})

    res.send(data)
});

module.exports = router;  